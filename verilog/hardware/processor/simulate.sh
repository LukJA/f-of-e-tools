cp programs/data.hex verilog/data.hex
cp programs/program.hex verilog/program.hex
cd verilog
cp topsim topsim_bak
rm topsim
iverilog -Wall -Wno-timescale -o topsim topsim.v adder.v cpu.v mux2to1.v alu_control.v pipeline_registers.v alu.v program_counter.v branch_decide.v forwarding_unit.v branch_predictor.v imm_gen.v control_unit.v instruction_mem.v data_mem.v register_file.v CSR.v dataMem_mask_gen.v
cd ..
./verilog/topsim