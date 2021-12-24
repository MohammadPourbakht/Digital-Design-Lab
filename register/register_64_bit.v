`default_nettype none
`timescale 1ns/1ns

module  register_64_bit (dataIn , E , Clk , RW , dataOut);
    input [63:0] dataIn;
    input E , Clk , RW;
    output reg [63:0] dataOut;
    reg [63:0] Q;

    always @(posedge Clk)
    if (E)
    begin
        if(!RW) 
            Q = dataIn;
        else
            dataOut = Q;
    end
endmodule 