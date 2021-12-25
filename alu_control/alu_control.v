`default_nettype none
`timescale 1ns/1ns

module alu_control(instruction , alu_op , result); 
    input [5:0] instruction;
    input [1:0] alu_op;
    output reg [3:0] result;

    always @(*)
    begin
            if(alu_op == 2'b00)
                result = 4'b0010; //add
            
            if(alu_op == 2'b01)
                result = 4'b0110; //sub

            if(alu_op == 2'b10)
                begin
                    if(instruction == 6'b100000)  //add
                        result = 4'b0010;
                    
                    if(instruction == 6'b100010)  //sub
                        result = 4'b0110;

                    if(instruction == 6'b100100)  //and
                        result = 4'b0000;

                    if(instruction == 6'b100101)  //or
                        result = 4'b0001;

                end                    
    end
endmodule 