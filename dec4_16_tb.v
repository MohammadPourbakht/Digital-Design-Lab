`default_nettype none
`timescale 1ns/1ns
`include "dec4_16.v"

module dec4_16_tb;
reg [3:0] W;
wire [0:15] Y;
reg En;
integer i=0;
parameter delay = 20;

dec4to16 UUT (.W(W),  .Y(Y), .En(En));


initial begin
    $dumpfile("dec4_16_tb.vcd");
    $dumpvars(0, dec4_16_tb);

    En=1;
    W[0] = 0;
    W[1] = 0;
    W[2] = 0;
    W[3] = 0;
 
    for (i = 0 ; i < 15 ; i++) 
        begin
            if(Y[i] == 1 && i!=0) 
                $display("Test Failed");
            if(Y[0] != 1 ) 
                $display("Test Failed");    
        end

  #delay;


    En=1;
    W[0] = 1;
    W[1] = 0;
    W[2] = 0;
    W[3] = 0;
 
    for (i = 0 ; i < 15 ; i++) 
        begin
            if(Y[i] == 1 && i!=1) 
                $display("Test Failed");
            if(Y[1] != 1 ) 
                $display("Test Failed");    
        end

  #delay;

     En=1;
    W[0] = 0;
    W[1] = 1;
    W[2] = 0;
    W[3] = 0;
 
    for (i = 0 ; i < 15 ; i++) 
        begin
            if(Y[i] == 1 && i!=2) 
                $display("Test Failed");
            if(Y[2] != 1 ) 
                $display("Test Failed");    
        end

  #delay;

    En=1;
    W[0] = 1;
    W[1] = 1;
    W[2] = 0;
    W[3] = 0;
 
    for (i = 0 ; i < 15 ; i++) 
        begin
            if(Y[i] == 1 && i!=3) 
                $display("Test Failed");
            if(Y[3] != 1 ) 
                $display("Test Failed");    
        end

  #delay;

    En=1;
    W[0] = 0;
    W[1] = 0;
    W[2] = 1;
    W[3] = 0;
 
    for (i = 0 ; i < 15 ; i++) 
        begin
            if(Y[i] == 1 && i!=4) 
                $display("Test Failed");
            if(Y[4] != 1 ) 
                $display("Test Failed");    
        end

  #delay;

    En=1;
    W[0] = 1;
    W[1] = 0;
    W[2] = 1;
    W[3] = 0;
 
    for (i = 0 ; i < 15 ; i++) 
        begin
            if(Y[i] == 1 && i!=5) 
                $display("Test Failed");
            if(Y[5] != 1 ) 
                $display("Test Failed");    
        end

  #delay;

    En=1;
    W[0] = 0;
    W[1] = 1;
    W[2] = 1;
    W[3] = 0;
 
    for (i = 0 ; i < 15 ; i++) 
        begin
            if(Y[i] == 1 && i!=6) 
                $display("Test Failed");
            if(Y[6] != 1 ) 
                $display("Test Failed");    
        end

  #delay;

    En=1;
    W[0] = 1;
    W[1] = 1;
    W[2] = 1;
    W[3] = 0;
 
    for (i = 0 ; i < 15 ; i++) 
        begin
            if(Y[i] == 1 && i!=7) 
                $display("Test Failed");
            if(Y[7] != 1 ) 
                $display("Test Failed");    
        end

  #delay;

    En=1;
    W[0] = 0;
    W[1] = 0;
    W[2] = 0;
    W[3] = 1;
 
    for (i = 0 ; i < 15 ; i++) 
        begin
            if(Y[i] == 1 && i!=8) 
                $display("Test Failed");
            if(Y[8] != 1 ) 
                $display("Test Failed");    
        end

  #delay;

    En=1;
    W[0] = 1;
    W[1] = 0;
    W[2] = 0;
    W[3] = 1;
 
    for (i = 0 ; i < 15 ; i++) 
        begin
            if(Y[i] == 1 && i!=9) 
                $display("Test Failed");
            if(Y[9] != 1 ) 
                $display("Test Failed");    
        end

  #delay;

    En=1;
    W[0] = 0;
    W[1] = 1;
    W[2] = 0;
    W[3] = 1;
 
    for (i = 0 ; i < 15 ; i++) 
        begin
            if(Y[i] == 1 && i!=10) 
                $display("Test Failed");
            if(Y[10] != 1 ) 
                $display("Test Failed");    
        end

  #delay;
 
    En=1;
    W[0] = 1;
    W[1] = 1;
    W[2] = 0;
    W[3] = 1;
 
    for (i = 0 ; i < 15 ; i++) 
        begin
            if(Y[i] == 1 && i!=11) 
                $display("Test Failed");
            if(Y[11] != 1 ) 
                $display("Test Failed");    
        end

  #delay;
   
    En=0g;
    W[0] = 0;
    W[1] = 0;
    W[2] = 1;
    W[3] = 1;
 
    for (i = 0 ; i < 15 ; i++) 
        begin
            if(Y[i] == 1 && i!=12) 
                $display("Test Failed");
            if(Y[12] != 1 ) 
                $display("Test Failed");    
        end

  #delay;

    En=0;
    W[0] = 1;
    W[1] = 0;
    W[2] = 1;
    W[3] = 1;
  
    for (i = 0 ; i < 15 ; i++) 
        begin
            if(Y[i] == 1 && i!=13) 
                $display("Test Failed");
            if(Y[13] != 1 ) 
                $display("Test Failed");    
        end

  #delay;

    En=0;
    W[0] = 0;
    W[1] = 1;
    W[2] = 1;
    W[3] = 1;
 
    for (i = 0 ; i < 15 ; i++) 
        begin
            if(Y[i] == 1 && i!=14) 
                $display("Test Failed");
            if(Y[14] != 1 ) 
                $display("Test Failed");    
        end

  #delay;

    En=1;
    W[0] = 1;
    W[1] = 1;
    W[2] = 1;
    W[3] = 1;
 
    for (i = 0 ; i < 15 ; i++) 
        begin
            if(Y[i] == 1 && i!=15) 
                $display("Test Failed");
            if(Y[15] != 1 ) 
                $display("Test Failed");    
        end

  #delay;

    

    $display("Test Complete");
   
end

endmodule