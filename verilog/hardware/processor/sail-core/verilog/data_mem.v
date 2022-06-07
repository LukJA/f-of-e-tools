/*
	Authored 2018-2019, Ryan Voo.

	All rights reserved.
	Redistribution and use in source and binary forms, with or without
	modification, are permitted provided that the following conditions
	are met:

	*	Redistributions of source code must retain the above
		copyright notice, this list of conditions and the following
		disclaimer.

	*	Redistributions in binary form must reproduce the above
		copyright notice, this list of conditions and the following
		disclaimer in the documentation and/or other materials
		provided with the distribution.

	*	Neither the name of the author nor the names of its
		contributors may be used to endorse or promote products
		derived from this software without specific prior written
		permission.

	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
	"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
	LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
	FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
	COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
	INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
	BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
	LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
	CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
	LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
	ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
	POSSIBILITY OF SUCH DAMAGE.
*/


/* TODO move read and write alignment muxes to a different file */
module write_mux (sign_mask_buf, write_data_buffer, addr_buf_byte_offset, word_buf, replacement_word);
	/* Input signals */
	input [3:0] sign_mask_buf;
	input [31:0] write_data_buffer;
	input [1:0] addr_buf_byte_offset;
	input [31:0] word_buf;
	/* Output Signal */
	output [31:0] replacement_word;

	/*
	 *	Regs for multiplexer output
	 */
	wire [7:0]		buf0;
	wire [7:0]		buf1;
	wire [7:0]		buf2;
	wire [7:0]		buf3;
	assign 			buf0	= word_buf[7:0];
	assign 			buf1	= word_buf[15:8];
	assign 			buf2	= word_buf[23:16];
	assign 			buf3	= word_buf[31:24];

	/*
	 *	Byte select decoder
	 */
	wire bdec_sig0;
	wire bdec_sig1;
	wire bdec_sig2;
	wire bdec_sig3;
	assign bdec_sig0 = (~addr_buf_byte_offset[1]) & (~addr_buf_byte_offset[0]);
	assign bdec_sig1 = (~addr_buf_byte_offset[1]) & (addr_buf_byte_offset[0]);
	assign bdec_sig2 = (addr_buf_byte_offset[1]) & (~addr_buf_byte_offset[0]);
	assign bdec_sig3 = (addr_buf_byte_offset[1]) & (addr_buf_byte_offset[0]);


	/*
	 *	Constructing the word to be replaced for write byte
	 */
	wire[7:0] byte_r0;
	wire[7:0] byte_r1;
	wire[7:0] byte_r2;
	wire[7:0] byte_r3;
	assign byte_r0 = (bdec_sig0==1'b1) ? write_data_buffer[7:0] : buf0;
	assign byte_r1 = (bdec_sig1==1'b1) ? write_data_buffer[7:0] : buf1;
	assign byte_r2 = (bdec_sig2==1'b1) ? write_data_buffer[7:0] : buf2;
	assign byte_r3 = (bdec_sig3==1'b1) ? write_data_buffer[7:0] : buf3;

	/*
	 *	For write halfword
	 */
	wire[15:0] halfword_r0;
	wire[15:0] halfword_r1;
	assign halfword_r0 = (addr_buf_byte_offset[1]==1'b1) ? {buf1, buf0} : write_data_buffer[15:0];
	assign halfword_r1 = (addr_buf_byte_offset[1]==1'b1) ? write_data_buffer[15:0] : {buf3, buf2};

	/* a is sign_mask_buf[2], b is sign_mask_buf[1], c is sign_mask_buf[0] */
	wire write_select0;
	wire write_select1;
	assign write_select0 = ~sign_mask_buf[2] & sign_mask_buf[1];
	assign write_select1 = sign_mask_buf[2];
	
	wire[31:0] write_out1;
	wire[31:0] write_out2;
	assign write_out1 = (write_select0) ? {halfword_r1, halfword_r0} : {byte_r3, byte_r2, byte_r1, byte_r0};
	assign write_out2 = (write_select0) ? 32'b0 : write_data_buffer;
	
	assign replacement_word = (write_select1) ? write_out2 : write_out1;
	
endmodule

module read_mux (word_buf, sign_mask_buf, addr_buf_byte_offset, read_buf);
	input [31:0] word_buf;
	input [3:0] sign_mask_buf;
	input [1:0] addr_buf_byte_offset;
	output [31:0] read_buf;

	/*
	 *	Combinational logic for generating 32-bit read data
	 */

	/*
	 *	Regs for multiplexer output
	 */
	wire [7:0]		buf0;
	wire [7:0]		buf1;
	wire [7:0]		buf2;
	wire [7:0]		buf3;
	assign 			buf0	= word_buf[7:0];
	assign 			buf1	= word_buf[15:8];
	assign 			buf2	= word_buf[23:16];
	assign 			buf3	= word_buf[31:24];

	wire select0;
	wire select1;
	wire select2;
	
	wire[31:0] out1;
	wire[31:0] out2;
	wire[31:0] out3;
	wire[31:0] out4;
	wire[31:0] out5;
	wire[31:0] out6;
	/* a is sign_mask_buf[2], b is sign_mask_buf[1], c is sign_mask_buf[0]
	 * d is addr_buf_byte_offset[1], e is addr_buf_byte_offset[0]
	 */
	
	assign select0 = (~sign_mask_buf[2] & ~sign_mask_buf[1] & ~addr_buf_byte_offset[1] & addr_buf_byte_offset[0]) | (~sign_mask_buf[2] & addr_buf_byte_offset[1] & addr_buf_byte_offset[0]) | (~sign_mask_buf[2] & sign_mask_buf[1] & addr_buf_byte_offset[1]); //~a~b~de + ~ade + ~abd
	assign select1 = (~sign_mask_buf[2] & ~sign_mask_buf[1] & addr_buf_byte_offset[1]) | (sign_mask_buf[2] & sign_mask_buf[1]); // ~a~bd + ab
	assign select2 = sign_mask_buf[1]; //b
	
	assign out1 = (select0) ? ((sign_mask_buf[3]==1'b1) ? {{24{buf1[7]}}, buf1} : {24'b0, buf1}) : ((sign_mask_buf[3]==1'b1) ? {{24{buf0[7]}}, buf0} : {24'b0, buf0});
	assign out2 = (select0) ? ((sign_mask_buf[3]==1'b1) ? {{24{buf3[7]}}, buf3} : {24'b0, buf3}) : ((sign_mask_buf[3]==1'b1) ? {{24{buf2[7]}}, buf2} : {24'b0, buf2}); 
	assign out3 = (select0) ? ((sign_mask_buf[3]==1'b1) ? {{16{buf3[7]}}, buf3, buf2} : {16'b0, buf3, buf2}) : ((sign_mask_buf[3]==1'b1) ? {{16{buf1[7]}}, buf1, buf0} : {16'b0, buf1, buf0});
	assign out4 = (select0) ? 32'b0 : {buf3, buf2, buf1, buf0};
	
	assign out5 = (select1) ? out2 : out1;
	assign out6 = (select1) ? out4 : out3;
	
	assign read_buf = (select2) ? out6 : out5;
endmodule


module data_mem (clk, addr, write_data, memwrite, memread, sign_mask, read_data, led, clk_stall);
	/* Input Signals */
	input			clk;
	input [31:0]	addr;
	input [31:0]	write_data;
	input			memwrite;
	input			memread;
	input [3:0]		sign_mask;

	/* Output Signals */
	output reg [31:0]	read_data;
	output [7:0]		led;
	output reg clk_stall = 0;

	reg [31:0]		led_reg; /* LED memory location */
	assign led = led_reg[7:0];

	/* ------------------------
	 *	Block memory registers
	 * ------------------------
	 */
	reg [31:0]		data_block[0:1023]; // 1 kWORD of data memory [ 4 kilobytes, word addressed ]
	
	/*
	 *	This uses Yosys's support for nonzero initial values:
	 *
	 *		https://github.com/YosysHQ/yosys/commit/0793f1b196df536975a044a4ce53025c81d00c7f
	 *
	 *	Rather than using this simulation construct (`initial`),
	 *	the design should instead use a reset signal going to
	 *	modules in the design.
	 */
	initial begin
		$readmemh("verilog/data.hex", data_block);
		clk_stall <= 0;
	end

	/*
	 *	Memory Access State machine OG <- DEPREC
	 * 
	 *	IF memread or memwrite are assert on clock edge
	 *  - Buffer all inputs
	 * 	- Move to READ_BUFFER & stall processor
	 *  Next clock edge - ADDRESS IS READY
	 *	- Read out data at addr_buf[11:2]
	 *  - select next stage as read or write
	 *  Next clock edge
	 *  - read data into the read buffer OR
	 *  - write replacement_word into the memory
	 *  - unstall clock
	 *
	 *	Memory contents has been modified in time for next ICLK
	 */

	/* Address calculations */

	/* - combinationally generate the word address, and byte offset for both 
	 *   the immediate addr value, and
     *   the buffered addr_buf value
	 *
	 * - The instruction memory offset is also removed 
	 */

	wire [31:0] 	addr_data; /* input */
	wire [9:0]		addr_block_addr; /* Addr MSB */
	wire [1:0]		addr_byte_offset; /* Addr 2 LSB */
	assign 			addr_data  = addr - 32'h1000;
	assign			addr_block_addr	= addr_data[11:2];

	reg [31:0]		addr_buf; /* input buffer */

	wire [31:0]     addr_buf_datamem; /* offset for data memory */
	wire [9:0]		addr_buf_block_addr; /* Addr MSB */
	wire [1:0]		addr_buf_byte_offset; /* Addr 2 LSB */
	assign 			addr_buf_datamem  = addr_buf - 32'h1000;
	assign			addr_buf_block_addr	= addr_buf_datamem[11:2];
	assign			addr_buf_byte_offset	= addr_buf_datamem[1:0];


	/* Read data mux IO */
	reg [31:0]		word_buf; /* (read) Line buffer */
	wire [31:0]		read_buf; /* actual output data */


	/* Write data mux IO */
	reg [31:0]		write_data_buffer; /* input buffer (stored over */
	wire [31:0]		replacement_word; /* actual write line */

	/* other buffers */
	reg [3:0]		sign_mask_buf; 
	reg				memread_buf;
	reg				memwrite_buf;


	/* ---- Single Cycle Run ----
	 * Simulates OK
	 * DOES NOT CHIP for verify, does for some leds??
	 * verify sim: 180229

	 * completes program? FOR LOW FREQ OSC (10k) - not a timing glitch...
	 * requires pos-neg order even at LF to get that far
	 * single cycle causes the compare function to fail!? double cycle still gives a valid result ...
	 * still gives a valid result?
	 */

	// always @(posedge clk) begin
	// 	/* decode is complete - pipeline reg filled prev cycle - control paths are populated */
	// 	/* buffer controls for subsequent stage */
	// 	if (state == IDLE) begin
	// 		memread_buf <= memread;
	// 		memwrite_buf <= memwrite;
	// 		write_data_buffer <= write_data;
	// 		addr_buf <= addr;
	// 		sign_mask_buf <= sign_mask;
			
	// 		/* if its a RW, pre-aquire word on this cycle */
	// 		if(memwrite==1'b1 || memread==1'b1) begin
	// 			word_buf <= data_block[addr_block_addr];
	// 		end

	// 		if(memwrite==1'b1) begin
	// 			state <= WRITE;
	// 		end
	// 		if(memread==1'b1) begin
	// 			state <= READ;
	// 		end
	// 		if(memread==1'b1 && memwrite==1'b1) begin
	// 			$display("FAIL");
	// 		end
	// 	end
	// end

	// /* falling edge to memory changes */
	// always @(negedge clk) begin
	// 	if(state == READ) begin
	// 		/* special case memory read go here */
	// 		if (addr_buf == 32'h2000) begin
	// 			read_data <= led_reg;
	// 		end else begin
	// 			read_data <= read_buf;
	// 		end
	// 		state <= IDLE;
	// 	end 
    //     else if(state == WRITE) begin
	// 		/* special case memory write go here */
	// 		if (addr_buf == 32'h2000) begin
	// 			// $display("LED to %0h", write_data_buffer);
	// 			led_reg <= write_data_buffer;
	// 		end else begin
	// 		/* standard ram write */
	// 			data_block[addr_buf_block_addr] <= replacement_word;
	// 		end
	// 		state <= IDLE;
	// 	end
	// end




	/* Dual cycle run 
	 * RUNS on chip 
	 * verify sim OK on chip 
	 */
	integer state = 0;
	parameter IDLE = 0, READ = 1, WRITE = 2;
	// TODO - revert to a case (removes priority logic)
	always @(posedge clk) begin
		if (state==READ) begin
			/* special case memory read go here */
			if (addr_buf == 32'h2000) begin
				read_data <= led_reg;
			end else begin
				read_data <= read_buf;
			end
			clk_stall <= 0;
			state <= IDLE;
		end 
		else if(state==WRITE) begin
			/* special case memory write go here */
			if (addr_buf == 32'h2000) begin
				led_reg <= write_data_buffer;
			end else begin
			/* standard ram write */
				data_block[addr_buf_block_addr] <= replacement_word;
			end
			clk_stall <= 0;
			state <= IDLE;
		end else begin
			clk_stall <= 0;

			write_data_buffer <= write_data;
			addr_buf <= addr;
			sign_mask_buf <= sign_mask;

			word_buf <= data_block[addr_block_addr];

			if(memwrite==1'b1) begin
				state <= WRITE;
				clk_stall <= 1;
			end
			if(memread==1'b1) begin
				state <= READ;
				clk_stall <= 1;
			end
		end
	end

	/* write data mux */
	write_mux write_mux_inst0(
		.sign_mask_buf(sign_mask_buf),
		.write_data_buffer(write_data_buffer),
		.addr_buf_byte_offset(addr_buf_byte_offset),
		.word_buf(word_buf),
		.replacement_word(replacement_word)
	);

	/* Read data mux */
	read_mux read_mux_inst0(
		.word_buf(word_buf), 
		.sign_mask_buf(sign_mask_buf), 
		.addr_buf_byte_offset(addr_buf_byte_offset), 
		.read_buf(read_buf)
	);

endmodule
