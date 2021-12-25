`default_nettype none
`timescale 1ns/1ns

`include "alu_control.v"

module alu_control_tb;
    reg [5:0] instruction;
    reg [1:0] alu_op;
    wire [3:0] result;
    alu_control aluC(.instruction(instruction) , .alu_op(alu_op) , .result(result));
    parameter delay = 20;

    initial begin
        $dumpfile("alu_control_tb.vcd");
        $dumpvars(0,alu_control_tb);

        alu_op = 2'b00;
        instruction = 6'b100000;
        #delay

        alu_op = 2'b10;
        instruction = 6'b100100;
        #delay


        alu_op = 2'b10;
        instruction = 6'b100010;
        #delay

        alu_op = 2'b10;
        instruction = 6'b100101;
        #delay

        $display("Finish");
    end

endmodule