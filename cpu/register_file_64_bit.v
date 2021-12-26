`default_nettype none
`timescale 1ns/1ns

module register_file_64_bit (E , clk , read_register1 , read_register2 , write_register , write_data , register_write , read_data1 , read_data2);
    input  E , clk; 
    input [4:0] read_register1;
    input [4:0] read_register2;
    input [4:0] write_register;
    input [63:0] write_data;
    input register_write;
    output reg [63:0] read_data1;
    output reg [63:0] read_data2;
    reg [63:0] Q[0:63];

    integer i;
    initial begin
        for (i = 0; i < 64; i = i+1) begin
            Q[i] = 64'b0;
        end
    end

    always @(posedge clk)
    begin
        if (E)
            if(register_write) 
                Q[write_register] = write_data;

        read_data1 = Q[read_register1];
        read_data2 = Q[read_register2];
    end

endmodule