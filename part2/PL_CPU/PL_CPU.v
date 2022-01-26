`default_nettype none
`timescale 1ns/1ns

`include "adder_64_bit.v"
`include "alu.v"
`include "alu_control.v"
`include "clock.v"
`include "control.v"
`include "data_memory_64_bit.v"
`include "imm_gen.v"
`include "instruction_memory.v"
`include "multiplexer.v"
`include "register_64_bit.v"
`include "register_file_64_bit.v"
`include "shift_left.v"
`include "if_id.v"
`include "id_ex.v"
`include "ex_mem.v"
`include "mem_wb.v"

module PL_CPU;
    //Clock
    wire clk;

    //PC
    wire [63:0] pc_input;
    reg E;
    reg pc_RW;
    wire [63:0] pc_output;

    //Instruction Memory
    reg  [31:0] instruction_input;
    reg  instruction_RW;
    wire [31:0] instruction_output;

    //Adder1
    wire [63:0] adder1_output;

    //Control
    wire branch;
    wire mem_read;
    wire mem_to_reg;
    wire [1:0] alu_op;
    wire mem_write;
    wire alu_src;
    wire reg_write;

    //Register File
    wire [63:0] register_file_read_data1;
    wire [63:0] register_file_read_data2;

    //Imm Gen
    wire [63:0] imm_result;

    //ALU Control
    wire [3:0] alu_control_result;

    //Multiplexer1
    wire [63:0] mux1_result;

    //ALU
    wire [63:0] alu_result;
    wire zero;

    //Data Memory
    wire [63:0] data_memory_read_data;

    //Multiplexer2
    wire [63:0] mux2_result; 

    //Multiplexer3
    wire [63:0] mux3_result; 

    //Adder2
    wire [63:0] adder2_output;

    // IF/ID
    wire [95:0] if_id_output;

    // ID/EX
    wire [271:0] id_ex_output;

    // EX/MEM
    wire [202:0] ex_mem_output;

    // MEM/WB
    wire [134:0] mem_wb_output;
    
    parameter delay = 20;
    initial begin
        $dumpfile("PL_CPU.vcd");
        $dumpvars(0,PL_CPU);

        E = 1;  
        pc_RW = 1;
        instruction_RW = 1;
        #delay;
        #delay;
        #delay;
        #delay;
        #delay;
        #delay;
        #delay;
        #delay;
        #delay;
        #delay;
        #delay;
        #delay;
        $display("Finish");
        $finish;
    end


    /*Clock*/
    clock clock1(.Clk(clk));

    //Multiplexer1
    multiplexer mux1(.w0(adder1_output) , .w1(ex_mem_output[197:134]) , .s(ex_mem_output[133] & ex_mem_output[200]) , .flag(1'b1) , .result(mux1_result));

    /* PC */
    register_64_bit pc (.dataIn(mux1_result) , .E(E) , .Clk(clk), .RW(pc_RW) , .dataOut(pc_output));

    //Instruction Memory  
    instruction_memory insMem (.dataIn(instruction_input) , .E(E) , .RW(instruction_RW) , .address(pc_output) ,  .dataOut(instruction_output));

    //Adder1
    adder_64_bit adder1 (.X(pc_output), .Y(64'b100), .S(adder1_output));

    // IF/ID
    if_id ifid (.dataIn({pc_output , instruction_output}) , .E(E) , .Clk(clk), .RW(pc_RW) , .dataOut(if_id_output));





    //Control
    control cntrl (.instruction(if_id_output[6:0]) , .branch(branch) , .mem_read(mem_read) , .mem_to_reg(mem_to_reg) , .alu_op(alu_op) , .mem_write(mem_write),
                    .alu_src(alu_src) , .reg_write(reg_write));

    //Register File
    register_file_64_bit registerFile (.E(E) , .clk(clk), .read_register1(if_id_output[19:15]) , .read_register2(if_id_output[24:20]) ,
    .write_register(mem_wb_output[4:0]) , .write_data(mux3_result) , .register_write(mem_wb_output[134]) ,
    .read_data1(register_file_read_data1) ,.read_data2(register_file_read_data2));

    //Imm Gen
    imm_gen immGen (.instruction(if_id_output[31:0]) , .result(imm_result));

    // ID/EX
    id_ex idex (.dataIn({reg_write , mem_to_reg , branch , mem_read , mem_write , alu_op , alu_src , if_id_output[95:32] , register_file_read_data1 
    , register_file_read_data2 , imm_result , if_id_output[14:12] , if_id_output[11:7]}) , .E(E) , .Clk(clk), .RW(pc_RW) , .dataOut(id_ex_output));






    //Multiplexer2
    multiplexer mux2(.w0(id_ex_output[135:72]) , .w1(id_ex_output[71:8]) , .s(id_ex_output[264]) , .flag(1'b0) , .result(mux2_result));

    //ALU Control
    alu_control aluC(.func7(if_id_output[31:25]) , .func3(if_id_output[14:12]) , .alu_op(id_ex_output[266:265]) , .result(alu_control_result));

    //ALU
    alu alu(.first_input(id_ex_output[199:136]) , .second_input(mux2_result) , .alu_control(alu_control_result) , .alu_result(alu_result) , .zero(zero));

    //Adder2
    adder_64_bit adder2 (.X(id_ex_output[71:8]) , .Y(id_ex_output[263:200]) , .S(adder2_output));

    // EX/MEM
    ex_mem ex_mem (.dataIn({id_ex_output[271:267] , adder2_output , zero , alu_result , id_ex_output[135:72] , id_ex_output[4:0]}) , .E(E) , .Clk(clk),
     .RW(pc_RW) , .dataOut(ex_mem_output));





    //Data Memory
    data_memory_64_bit data_memory(.clk(clk), .E(E), .address(ex_mem_output[132:69]), .write_data(ex_mem_output[68:5]), .mem_write(ex_mem_output[198]),
    .mem_read(ex_mem_output[199]), .read_data(data_memory_read_data));

    // MEM/WB
    mem_wb memwb (.dataIn({ex_mem_output[202:201] , data_memory_read_data , ex_mem_output[132:69] , ex_mem_output[4:0]}) , .E(E) , .Clk(clk), .RW(pc_RW)
     , .dataOut(mem_wb_output));

    

    
    //Multiplexer3
    multiplexer mux3(.w0(mem_wb_output[68:5]) , .w1(mem_wb_output[132:69]) , .s(mem_wb_output[133]) , .flag(1'b0) , .result(mux3_result));

endmodule
