`default_nettype none
`timescale 1ns/1ns

module alu(first_input , second_input , alu_control , alu_result , zero);
    input [63:0] first_input;
    input [63:0] second_input;
    input [3:0] alu_control;
    output reg [63:0] alu_result;
    output zero;

    always @(alu_control , first_input , second_input)
    begin 
        if(alu_control == 4'b0000)
            alu_result = first_input & second_input;

        if(alu_control == 4'b0001)
            alu_result = first_input | second_input;

        if(alu_control == 4'b0010) 
            alu_result = first_input + second_input;

        if(alu_control == 4'b0110) 
            alu_result = first_input - second_input;
   
    end

    assign zero = (alu_result == 0) ? 1 : 0;
endmodule 