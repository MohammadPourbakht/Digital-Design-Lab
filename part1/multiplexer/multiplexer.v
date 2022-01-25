`default_nettype none
`timescale 1ns/1ns

module multiplexer(w0 , w1 , s , result);
    input [63:0] w0;
    input [63:0] w1;
    input s;
    output [63:0] result;

    assign result = s ? w1 : w0;
endmodule 