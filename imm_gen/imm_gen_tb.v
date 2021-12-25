`default_nettype none
`timescale 1ns/1ns

`include "imm_gen.v"

module imm_gen_tb;
    reg  [63:0] instruction;
    wire [63:0] result;
    imm_gen immGen (.instruction(instruction), .result(result));
    parameter delay = 20;

    initial begin
        $dumpfile("imm_gen_tb.vcd");
        $dumpvars(0,imm_gen_tb);

        instruction = 64'b0100011000000000000000010101010010000000000000000000000001100111;
        #delay;

        instruction = 64'b0000011000000000000001001000100001000010011101000000000000100011;
        #delay;
        
        instruction = 64'b1100111000000011111101111111110000000111111101010100000100000011;
        #delay;

        $display("Finish");
    end
endmodule