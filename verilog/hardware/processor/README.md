Run `make` to generate a programming bitstream and to program the FPGA.

# Baseline
## Functional Benchmark Results

### At 6 MHz

bubblesort76 - 89.5 mS
=== design hierarchy ===

   top                               1
     cpu                             1
       ALUControl                    1
       ForwardingUnit                1
       adder                         2
       alu                           1
       branch_decision               1
       branch_predictor              1
       control                       1
       csr_file                      1
       ex_mem                        1
       id_ex                         1
       if_id                         1
       imm_gen                       1
       mem_wb                        1
       mux2to1                      24
       program_counter               1
       regfile                       1
       sign_mask_gen                 1
     data_mem                        1
     instruction_memory              1

   Number of wires:               5776
   Number of wire bits:         139810
   Number of public wires:        5776
   Number of public wire bits:  139810
   Number of memories:               0
   Number of memory bits:            0
   Number of processes:              0
   Number of cells:               3392
     SB_CARRY                      188
     SB_DFF                        594
     SB_DFFE                       124
     SB_DFFN                         1
     SB_HFOSC                        1
     SB_LUT4                      2464
     SB_RAM40_4K                    20
    
HelloWorld
=== design hierarchy ===

   top                               1
     cpu                             1
       ALUControl                    1
       ForwardingUnit                1
       adder                         2
       alu                           1
       branch_decision               1
       branch_predictor              1
       control                       1
       csr_file                      1
       ex_mem                        1
       id_ex                         1
       if_id                         1
       imm_gen                       1
       mem_wb                        1
       mux2to1                      24
       program_counter               1
       regfile                       1
       sign_mask_gen                 1
     data_mem                        1
     instruction_memory              1

   Number of wires:               5660
   Number of wire bits:         139694
   Number of public wires:        5660
   Number of public wire bits:  139694
   Number of memories:               0
   Number of memory bits:            0
   Number of processes:              0
   Number of cells:               3276
     SB_CARRY                      188
     SB_DFF                        594
     SB_DFFE                       124
     SB_DFFN                         1
     SB_HFOSC                        1
     SB_LUT4                      2348
     SB_RAM40_4K                    20

lpf128 4.361 mS
=== design hierarchy ===

   top                               1
     cpu                             1
       ALUControl                    1
       ForwardingUnit                1
       adder                         2
       alu                           1
       branch_decision               1
       branch_predictor              1
       control                       1
       csr_file                      1
       ex_mem                        1
       id_ex                         1
       if_id                         1
       imm_gen                       1
       mem_wb                        1
       mux2to1                      24
       program_counter               1
       regfile                       1
       sign_mask_gen                 1
     data_mem                        1
     instruction_memory              1

   Number of wires:               6078
   Number of wire bits:         140112
   Number of public wires:        6078
   Number of public wire bits:  140112
   Number of memories:               0
   Number of memory bits:            0
   Number of processes:              0
   Number of cells:               3695
     SB_CARRY                      188
     SB_DFF                        594
     SB_DFFE                       124
     SB_DFFN                         1
     SB_HFOSC                        1
     SB_LUT4                      2767
     SB_RAM40_4K                    20

pedometer128 15.28mS
=== design hierarchy ===

   top                               1
     cpu                             1
       ALUControl                    1
       ForwardingUnit                1
       adder                         2
       alu                           1
       branch_decision               1
       branch_predictor              1
       control                       1
       csr_file                      1
       ex_mem                        1
       id_ex                         1
       if_id                         1
       imm_gen                       1
       mem_wb                        1
       mux2to1                      24
       program_counter               1
       regfile                       1
       sign_mask_gen                 1
     data_mem                        1
     instruction_memory              1

   Number of wires:               7108
   Number of wire bits:         141142
   Number of public wires:        7108
   Number of public wire bits:  141142
   Number of memories:               0
   Number of memory bits:            0
   Number of processes:              0
   Number of cells:               4724
     SB_CARRY                      188
     SB_DFF                        594
     SB_DFFE                       124
     SB_DFFN                         1
     SB_HFOSC                        1
     SB_LUT4                      3796
     SB_RAM40_4K                    20

schlieren128 1.395 mS
=== design hierarchy ===

   top                               1
     cpu                             1
       ALUControl                    1
       ForwardingUnit                1
       adder                         2
       alu                           1
       branch_decision               1
       branch_predictor              1
       control                       1
       csr_file                      1
       ex_mem                        1
       id_ex                         1
       if_id                         1
       imm_gen                       1
       mem_wb                        1
       mux2to1                      24
       program_counter               1
       regfile                       1
       sign_mask_gen                 1
     data_mem                        1
     instruction_memory              1

   Number of wires:               5798
   Number of wire bits:         139832
   Number of public wires:        5798
   Number of public wire bits:  139832
   Number of memories:               0
   Number of memory bits:            0
   Number of processes:              0
   Number of cells:               3414
     SB_CARRY                      188
     SB_DFF                        594
     SB_DFFE                       124
     SB_DFFN                         1
     SB_HFOSC                        1
     SB_LUT4                      2486
     SB_RAM40_4K                    20

### At 12 MHz (PnR the same)

bubblesort76 44.87 mS
lpf128
pedometer128
schlieren128