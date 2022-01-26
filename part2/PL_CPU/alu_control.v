`default_nettype none
`timescale 1ns/1ns

module alu_control(func7 , func3 , alu_op , result);
    input [6:0] func7;
    input [2:0] func3;
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
                    if(func7 == 7'b0000000)  //add
                        result = 4'b0010;
                    
                    if(func7 == 7'b0100010)  //sub
                        result = 4'b0110;

                    if(func3 == 3'b111)  //and
                        result = 4'b0000;

                    if(func3 == 3'b110)  //or
                        result = 4'b0001;

                end                    
    end
endmodule 