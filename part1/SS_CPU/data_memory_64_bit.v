`default_nettype none
`timescale 1ns/1ns

module data_memory_64_bit(clk , E , address , write_data , mem_write , mem_read , read_data);
    input clk , E;
    input [63:0] address;
    input [63:0] write_data;
    input mem_write , mem_read;
    output reg [63:0] read_data;
    reg [63:0] Q [0:1023];

    always @(posedge clk)
    if (E)
    begin
        if(mem_write) 
            Q[address] = write_data;
        if(mem_read)
            read_data = Q[address];
    end

    initial 
    begin
        Q[0] = 53;    
    end
endmodule