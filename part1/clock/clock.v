`default_nettype none
`timescale 1ns/1ns

module  clock(Clk);
    output reg Clk;
    parameter delay = 20;

    always 
    begin
        Clk = 0;
        #delay;

        Clk = 1;
        #delay;
    end

endmodule