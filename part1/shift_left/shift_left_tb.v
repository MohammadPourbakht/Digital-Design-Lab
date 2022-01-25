`default_nettype none
`timescale 1ns/1ns

`include "shift_left.v"

module shift_left_tb;
    reg [63:0] data_input;
    wire [63:0] data_output;
    shift_left shiftL (.data_input(data_input) , .data_output(data_output));
    parameter delay = 20;

    initial begin
        $dumpfile("shift_left_tb.vcd");
        $dumpvars(0,shift_left_tb);

        data_input =  4'b0011;
        #delay

        data_input =  5'b01011;
        #delay
        
        $display("Finish");
    end

endmodule