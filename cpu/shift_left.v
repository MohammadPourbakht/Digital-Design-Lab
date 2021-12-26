`default_nettype none
`timescale 1ns/1ns

module shift_left(data_input , data_output);
    input [63:0] data_input;
    output [63:0] data_output;

    assign data_output = data_input << 1;
endmodule