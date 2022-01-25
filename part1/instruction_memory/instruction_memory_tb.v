`default_nettype none
`timescale 1ns/1ns

`include "instruction_memory.v"

module instruction_memory_tb;
    reg  [31:0] dataIn;
    reg E , RW;
    reg [63:0] address;
    wire [31:0] dataOut;
    instruction_memory insMem (.dataIn(dataIn) , .E(E) , .RW(RW) , .address(address) ,  .dataOut(dataOut));
    parameter delay = 20;

    initial begin
        $dumpfile("instruction_memory_tb.vcd");
        $dumpvars(0,instruction_memory_tb);

        dataIn = 39;
        E = 0;
        RW = 0;
        address = 64'b100;
        #delay
 

        RW = 1;
        #delay



        E = 1;
        RW = 0;
        #delay


        RW = 1;
        #delay

        $display("Finish");
        $finish;
    end

endmodule