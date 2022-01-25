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

module SS_CPU;
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
    wire [63:0] register_file_write_data;
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

    //Shift Left
    wire [63:0] result_shift;

    //Adder2
    wire [63:0] adder2_output;
    
    parameter delay = 20;
    initial begin
        $dumpfile("SS_CPU.vcd");
        $dumpvars(0,SS_CPU);

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

    /* PC */
    register_64_bit pc (.dataIn(pc_input) , .E(E) , .Clk(clk), .RW(pc_RW) , .dataOut(pc_output));

    //Instruction Memory  
    instruction_memory insMem (.dataIn(instruction_input) , .E(E) , .RW(instruction_RW) , .address(pc_output) ,  .dataOut(instruction_output));

    //Adder1
    adder_64_bit adder1 (.X(pc_output), .Y(64'b100), .S(adder1_output));

    

    //Control
    control cntrl (.instruction(instruction_output[6:0]) , .branch(branch) , .mem_read(mem_read) , .mem_to_reg(mem_to_reg) , .alu_op(alu_op) , .mem_write(mem_write),
                    .alu_src(alu_src) , .reg_write(reg_write));

    //Register File
    register_file_64_bit registerFile (.E(E) , .clk(clk), .read_register1(instruction_output[19:15]) , .read_register2(instruction_output[24:20]) ,
    .write_register(instruction_output[11:7]) , .write_data(register_file_write_data) , .register_write(reg_write) ,
    .read_data1(register_file_read_data1) ,.read_data2(register_file_read_data2));

    //Imm Gen
    imm_gen immGen (.instruction(instruction_output) , .result(imm_result));

    //ALU Control
    alu_control aluC(.func7(instruction_output[31:25]) , .func3(instruction_output[14:12]) , .alu_op(alu_op) , .result(alu_control_result));

    //Multiplexer1
    multiplexer mux1(.w0(register_file_read_data2) , .w1(imm_result) , .s(alu_src) , .flag(1'b0) , .result(mux1_result));

    //ALU
    alu alu(.first_input(register_file_read_data1) , .second_input(mux1_result) , .alu_control(alu_control_result) , .alu_result(alu_result) , .zero(zero));

    //Data Memory
    data_memory_64_bit data_memory(.clk(clk), .E(E), .address(alu_result), .write_data(register_file_read_data2), .mem_write(mem_write),
    .mem_read(mem_read), .read_data(data_memory_read_data));

    //Multiplexer2
    multiplexer mux2(.w0(alu_result) , .w1(data_memory_read_data) , .s(mem_to_reg) , .flag(1'b0) , .result(register_file_write_data));

    //Shift Left
    shift_left shiftL (.data_input(imm_result) , .data_output(result_shift));

    //Adder2
    adder_64_bit adder2 (.X(pc_output), .Y(result_shift), .S(adder2_output));

    
    //Multiplexer3
    multiplexer mux3(.w0(adder1_output) , .w1(adder2_output) , .s(zero & branch) , .flag(1'b1) , .result(pc_input));

endmodule
