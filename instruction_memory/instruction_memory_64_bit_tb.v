`default_nettype none
`timescale 1ns/1ns

`include "instruction_memory_64_bit.v"

module instruction_memory_64_bit_tb;
    reg  [63:0] dataIn;
    reg E , Clk , RW;
    reg [63:0] address;
    wire [63:0] dataOut;
    instruction_memory_64_bit insMem (.dataIn(dataIn) , .E(E) , .Clk(Clk), .RW(RW) , .address(address) ,  .dataOut(dataOut));
    parameter delay = 20;

    initial begin
        $dumpfile("instruction_memory_64_bit_tb.vcd");
        $dumpvars(0,instruction_memory_64_bit_tb);

        dataIn = 39;
        E = 0;
        Clk = 1;
        RW = 0;
        address = 22;
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