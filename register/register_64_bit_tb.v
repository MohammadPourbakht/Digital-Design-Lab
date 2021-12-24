`default_nettype none
`timescale 1ns/1ns

`include "register_64_bit.v"

module register_64_bit_tb;
    reg  [63:0] dataIn;
    reg E , Clk , RW;
    wire [63:0] dataOut;
    register_64_bit register (.dataIn(dataIn) , .E(E) , .Clk(Clk), .RW(RW) , .dataOut(dataOut));
    parameter delay = 20;

    initial begin
        $dumpfile("register_64_bit_tb.vcd");
        $dumpvars(0,register_64_bit_tb);

        dataIn = 75;
        E = 0;
        Clk = 1;
        RW = 0;
        #delay

        
        Clk = 0;
        RW = 0;
        #delay

        Clk = 1;
        RW = 1;
        #delay

        Clk = 0;
        RW = 1;
        #delay


        E = 1;
        Clk = 1;
        RW = 0;
        #delay

        
        Clk = 0;
        RW = 0;
        #delay

        Clk = 1;
        RW = 1;
        #delay

        Clk = 0;
        RW = 1;
        #delay

        $display("Finish");
    end

endmodule