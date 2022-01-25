`default_nettype none
`timescale 1ns/1ns

`include "alu.v"

module alu_tb;
    reg [63:0] first_input;
    reg [63:0] second_input;
    reg [3:0] alu_control;
    wire [63:0] alu_result;
    wire zero;
    alu alu(.first_input(first_input) , .second_input(second_input) , .alu_control(alu_control) , .alu_result(alu_result) , .zero(zero));
    parameter delay = 20;

    initial begin
        $dumpfile("alu_tb.vcd");
        $dumpvars(0,alu_tb);

        first_input =  4'b1011;
        second_input = 4'b1101;
        alu_control =  4'b0000;
        #delay

        first_input =  4'b1001;
        second_input = 4'b1100;
        alu_control =  4'b0001;
        #delay

        first_input =  4'b0110;
        second_input = 4'b0101;
        alu_control =  4'b0010;
        #delay

        first_input =  4'b0111;
        second_input = 4'b0011;
        alu_control =  4'b0110;
        #delay

        first_input =  4'b1011;
        second_input = 4'b0100;
        alu_control =  4'b0000;
        #delay

        first_input =  4'b0111;
        second_input = 4'b0111;
        alu_control =  4'b0110;
        #delay

 
        $display("Finish");
    end

endmodule