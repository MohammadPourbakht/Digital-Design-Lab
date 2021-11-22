`default_nettype none
`timescale 1ns/1ns
`include "mux2_64bit.v"

module mux2_64bit_tb;

    reg  s;
    reg [63:0] w0;
    reg [63:0] w1;
    wire [63 : 0] f;

    mux2_64bit UUT(.w0(w0), .w1(w1), .s(s), .f(f));

    parameter delay = 20;


    initial begin
        $dumpfile("mux2_64bit_tb.vcd");
        $dumpvars(0,mux2_64bit_tb);

    
        s = 0;
        #delay

        if (f != w0)
            $display("Test Failed");

        s = 1;
        #delay

        if (f != w1)
            $display("Test Failed");

    end



endmodule