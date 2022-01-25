`default_nettype none
`timescale 1ns/1ns

module control (instruction , branch , mem_read , mem_to_reg , alu_op , mem_write , alu_src , reg_write);
    input [6:0] instruction;
    output reg branch;
    output reg mem_read;
    output reg mem_to_reg;
    output reg [1:0] alu_op;
    output reg mem_write;
    output reg alu_src;
    output reg reg_write;

    always @(instruction)   //Page281
    begin
        if(instruction == 7'b0110011) //R-type
        begin
            alu_src = 0;
            mem_to_reg = 0;
            reg_write = 1;
            mem_read = 0;
            mem_write = 0;
            branch = 0;
            alu_op = 2'b10;
        end

        if(instruction == 7'b0000011) //lw-type
        begin
            alu_src = 1;
            mem_to_reg = 1;
            reg_write = 1;
            mem_read = 1;
            mem_write = 0;
            branch = 0;
            alu_op = 2'b00; 
        end

        if(instruction == 7'b0100011) //sw-type
        begin
            alu_src = 1;
            mem_to_reg = 1'bx;
            reg_write = 0;
            mem_read = 0;
            mem_write = 1;
            branch = 0;
            alu_op = 2'b00; 
        end

        if(instruction == 7'b1100011) //beq-type
        begin
            alu_src = 0;
            mem_to_reg = 1'bx;
            reg_write = 0;
            mem_read = 0;
            mem_write = 0;
            branch = 1;
            alu_op = 2'b01; 
        end 
    end

endmodule