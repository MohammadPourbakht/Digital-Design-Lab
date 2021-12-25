`default_nettype none
`timescale 1ns/1ns

`include "data_memory_64_bit.v"

module data_memory_64_bit_tb;
    reg clk , E;
    reg [63:0] address;
    reg [63:0] write_data;
    reg mem_write , mem_read;
    wire [63:0] read_data;
    data_memory_64_bit data_memory(.clk(clk), .E(E), .address(address), .write_data(write_data), .mem_write(mem_write), .mem_read(mem_read), .read_data(read_data));
    parameter delay = 20;

    initial begin
        $dumpfile("data_memory_64_bit_tb.vcd");
        $dumpvars(0,data_memory_64_bit_tb);

        E = 1;
        clk = 1;
        mem_write = 1;
        mem_read = 0;
        address = 23;
        write_data = 48;
        #delay

        clk = 0;
        #delay

        clk = 1;
        mem_write = 0;
        mem_read = 1;

        #delay

        clk = 0;
        #delay

        clk = 1;
        mem_write = 1;
        mem_read = 1;
        #delay

        clk = 0;
        mem_write = 0;
        mem_read = 0;
        #delay

        clk = 1;
        mem_write = 1;
        mem_read = 0;
        write_data = 28;
        #delay

        clk = 0;
        #delay

        E = 0;
        clk = 1;
        mem_write = 0;
        mem_read = 0;
        #delay

        E = 1;
        clk = 0;
        mem_write = 0;
        mem_read = 0;
        #delay

        clk = 1;
        mem_write = 1;
        mem_read = 1;
        #delay

        clk = 0;
        mem_write = 0;
        mem_read = 1;
        #delay

        clk = 1;
        mem_write = 1;
        mem_read = 0;
        #delay

        clk = 0;
        mem_write = 1;
        mem_read = 1;
        #delay
 
        $display("Finish");
    end

endmodule