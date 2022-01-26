`default_nettype none
`timescale 1ns/1ns

module  ex_mem (dataIn , E , Clk , RW , dataOut);
    input [202:0] dataIn;
    input E , Clk , RW;
    output reg [202:0] dataOut;
    reg [202:0] Q;

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
            dataOut = 202'b0;
        end

        u++;
    end
endmodule 