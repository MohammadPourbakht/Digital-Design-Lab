`default_nettype none
`timescale 1ns/1ns

`include "adder_64_bit.v"

module adder_64_bit_tb;
    reg  [63:0] X;
    reg  [63:0] Y;
    wire [63:0] S;
    adder_64_bit adder (.X(X), .Y(Y), .S(S));
    parameter delay = 20;

    initial begin
    $dumpfile("adder_64_bit_tb.vcd");
    $dumpvars(0,adder_64_bit_tb);
        X = 13800121;
        Y = 13800223;
    #delay
        X = 23;
        Y = 21;
    #delay
        X = 400;
        Y = 22;
    #delay
        X = 4;
        Y = 3;
    #delay
        X = 57;
        Y = 75;
    #delay

    $display("Finish");
    end

endmodule