`default_nettype none
`timescale 1ns/1ns

`include "control.v"

module control_tb;
    reg [6:0] instruction;
    wire branch;
    wire mem_read;
    wire mem_to_reg;
    wire [1:0] alu_op;
    wire mem_write;
    wire alu_src;
    wire reg_write;
    control cntrl (.instruction(instruction), .branch(branch) , .mem_read(mem_read) , .mem_to_reg(mem_to_reg) , .alu_op(alu_op) , .mem_write(mem_write) ,
                    .alu_src(alu_src) , .reg_write(reg_write));

    parameter delay = 20;

    initial begin
        $dumpfile("control_tb.vcd");
        $dumpvars(0,control_tb);

        instruction = 64'b0110011;
        #delay;

        instruction = 64'b0000011;
        #delay;
        
        instruction = 64'b0100011;
        #delay;

        instruction = 64'b1100011;
        #delay;

        $display("Finish");
    end
endmodule