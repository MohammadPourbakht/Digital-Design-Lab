`default_nettype none
`timescale 1ns/1ns

module adder_64_bit (X , Y , S);
    input [63:0] X , Y;
    output reg [63:0] S;
    reg carryin = 0;
    reg carryout;
    reg [64:0] C;
    integer k;

    always @(X, Y, carryin)
    begin
        C[0] = carryin;
        for (k = 0; k < 64; k = k+1)
        begin
            S[k] = X[k] ^ Y[k] ^ C[k];
            C[k+1] = (X[k] & Y[k]) | (X[k] & C[k]) | (Y[k] & C[k]);
        end
        carryout = C[64];
    end
endmodule