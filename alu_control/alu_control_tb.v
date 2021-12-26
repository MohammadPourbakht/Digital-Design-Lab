`default_nettype none
`timescale 1ns/1ns

`include "alu_control.v"

module alu_control_tb;
    reg [6:0] func7;
    reg [2:0] func3;
    reg [1:0] alu_op;
    wire [3:0] result;
    alu_control aluC(.func7(func7) , .func3(func3) , .alu_op(alu_op) , .result(result));
    parameter delay = 20;

    initial begin
        $dumpfile("alu_control_tb.vcd");
        $dumpvars(0,alu_control_tb);

        alu_op = 2'b00;
        func7 = 7'b1001001;
        func3 = 3'b001;
        #delay

        alu_op = 2'b01;
        func7 = 7'b1011001;
        func3 = 3'b101;
        #delay

        alu_op = 2'b10;
        func7 = 7'b0000000;
        func3 = 3'b110;
        #delay


        alu_op = 2'b10;
        func7 = 7'b0000000;
        func3 = 3'b000;
        #delay

        alu_op = 2'b10;
        func7 = 7'b0000000;
        func3 = 3'b111;
        #delay

        $display("Finish");
    end

endmodule