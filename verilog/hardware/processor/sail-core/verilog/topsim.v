
`timescale 1 ns/100 ps  // time-unit = 1 ns, precision = 10 ps

module topsim;

	output [7:0]	led;
	reg  		clk = 0;
	
	wire		clk_proc;
	wire		data_clk_stall;
	assign 	clk_proc = (data_clk_stall) ? 1'b1 : clk;

	/*
	 *	Memory interface
	 */
	wire[31:0]	inst_in;
	wire[31:0]	inst_out;
	wire[31:0]	data_out;
	wire[31:0]	data_addr;
	wire[31:0]	data_WrData;
	wire		data_memwrite;
	wire		data_memread;
	wire[3:0]	data_sign_mask;


	cpu processor(
		.clk(clk_proc),
		.inst_mem_in(inst_in),
		.inst_mem_out(inst_out),
		.data_mem_out(data_out),
		.data_mem_addr(data_addr),
		.data_mem_WrData(data_WrData),
		.data_mem_memwrite(data_memwrite),
		.data_mem_memread(data_memread),
		.data_mem_sign_mask(data_sign_mask)
	);

	instruction_memory inst_mem( 
		.addr(inst_in), 
		.out(inst_out)
	);

	data_mem data_mem_inst(
			.clk(clk),
			.addr(data_addr),
			.write_data(data_WrData),
			.memwrite(data_memwrite), 
			.memread(data_memread), 
			.read_data(data_out),
			.sign_mask(data_sign_mask),
			.led(led),
			.clk_stall(data_clk_stall)
		);
    
    integer cycles;
	integer tik = 0;
	integer pulses = 0;
    initial begin
        $display($time, " << Starting the Simulation >>");
        for (cycles = 0; cycles <= 1000000; cycles = cycles + 1) begin
            #1 clk = ~clk;

			if (led == 8'hff) begin
				if (tik == 0) begin
					//$display("LED cycle %0d %0h", cycles, led);
					tik <= 1;
					pulses <= pulses + 1;
				end
			end
			if (led != 8'hff) begin
				if (tik == 1) begin	
					//$display("LED cycle %0d %0h", cycles, led);
				end
				tik <= 0;
			end

			if (pulses >= 500) begin
				pulses <= 0;
				$display($time, " << Completed #%0d cycles >> at %0h", cycles, inst_in);
				//$finish;
			end
        end
        $display($time, " << Completed #%0d cycles >> at %0h", cycles, inst_in);
    end

    initial begin
        $dumpfile("waves.vcd");
        $dumpvars(1, topsim, data_mem_inst);
    end

endmodule