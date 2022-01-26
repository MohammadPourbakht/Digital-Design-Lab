`default_nettype none
`timescale 1ns/1ns

module  instruction_memory(dataIn , E , RW , address , dataOut);
    input [31:0] dataIn;
    input E , RW;
    input [63:0] address;
    output reg [31:0] dataOut;
    reg [31:0] Q [0:256];

    initial begin
        Q[0] = 32'b00000000000001010010101000000011;
        Q[4] = 32'b00000001010000000000101010110011;
        Q[8] = 32'b0100001010010101000001100110011;
        Q[12] = 32'b00000001010001010010010000100011 ;
        Q[16] = 32'b11111111010110100000111001100111 ;
    end


    always @(*)
    if (E)
    begin
        if(!RW) 
            Q[address] = dataIn;
        else
            dataOut = Q[address];
    end
endmodule 