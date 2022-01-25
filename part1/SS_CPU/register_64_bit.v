`default_nettype none
`timescale 1ns/1ns

module  register_64_bit (dataIn , E , Clk , RW , dataOut);
    input [63:0] dataIn;
    input E , Clk , RW;
    output reg [63:0] dataOut;
    reg [63:0] Q;

    integer u = 0;

    always @(posedge Clk)
    begin
        if (E && u!=0)
        begin
            if(!RW) 
                Q = dataIn;
            else
                dataOut = dataIn;
        end

        if(E && u==0)
        begin
            dataOut = 64'b0;
        end

        u++;
    end
endmodule 