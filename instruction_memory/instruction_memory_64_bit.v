`default_nettype none
`timescale 1ns/1ns

module  instruction_memory_64_bit(dataIn , E , Clk , RW , address , dataOut);
    input [63:0] dataIn;
    input E , Clk , RW;
    input [63:0] address;
    output reg [63:0] dataOut;
    reg [63:0] Q [0:1023];

    always @(posedge Clk)
    if (E)
    begin
        if(!RW) 
            Q[address] = dataIn;
        else
            dataOut = Q[address];
    end
endmodule 