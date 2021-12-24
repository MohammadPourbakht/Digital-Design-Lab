`default_nettype none
`timescale 1ns/1ns

`include "register_file_64_bit.v"

module register_file_64_bit_tb;
    reg E , clk;
    reg [4:0] read_register1;
    reg [4:0] read_register2;
    reg [4:0] write_register;
    reg [63:0] write_data;
    reg register_write;
    wire [63:0] read_data1;
    wire [63:0] read_data2;

    register_file_64_bit registerFile (.E(E) , .clk(clk), .read_register1(read_register1) , .read_register2(read_register2) , .write_register(write_register) ,
    .write_data(write_data) , .register_write(register_write) , .read_data1(read_data1) , .read_data2(read_data2));
    
    parameter delay = 20;

    initial begin
        $dumpfile("register_file_64_bit_tb.vcd");
        $dumpvars(0,register_file_64_bit_tb);


        E = 0;
        clk = 0;
        read_register1 = 10;
        read_register2 = 22;
        write_register = 22;
        write_data = 48;
        register_write = 1;
        #delay 

        clk = 1;
        #delay 

        E = 1;
        clk=0;
        #delay

        clk = 1;
        #delay

        E = 0;
        clk = 0;
        read_register1 = 10;
        read_register2 = 14;
        write_register = 10;
        write_data = 48;
        register_write = 0;
        #delay 

        clk = 1;
        #delay 

        E = 1;
        clk=0;
        #delay

        clk = 1;
        register_write = 1;
        #delay



        E = 0;
        clk = 0;
        read_register1 = 10;
        read_register2 = 14;
        write_register = 22;
        write_data = 48;
        register_write = 1;
        #delay 

        clk = 1;
        #delay 

        E = 1;
        clk=0;
        #delay

        clk = 1;
        #delay 

        $display("Finish");
    end

endmodule