`default_nettype none
`timescale 1ns/1ns

`include "multiplexer.v"

module multiplexer_tb;
    reg [63:0] w0;
    reg [63:0] w1;
    reg s;
    wire [63:0] result;

    multiplexer mux(.w0(w0) , .w1(w1) , .s(s) , .result(result));
    parameter delay = 20;

    initial begin
        $dumpfile("multiplexer_tb.vcd");
        $dumpvars(0,multiplexer_tb);

        w0  =  4'b1011;
        w1 = 4'b1101;
        s = 1'b1;
        #delay

        w0  =  4'b1011;
        w1 = 4'b1101;
        s = 1'b0;
        #delay

        $display("Finish");
    end

endmodule