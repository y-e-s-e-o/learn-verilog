`include "Dflipflop_4bit.v"
`timescale 1ns/1ns

module tb_Dflipflop_4bit;

    reg         clk;
    reg  [3:0]  D;
    wire [3:0]  Q;

    Dflipflop_4bit Dflipflop (
        .clk(clk), 
        .D(D), 
        .Q(Q)
    );

    // 클럭 생성 (5ns 주기)
    always 
        #5 clk = ~clk;

    initial begin
        #0
        clk = 1'b0;    
        D = 4'b0001;   
        
        #5
        D = 4'b0001;   
        
        #5
        D = 4'b0011;  
        
        #5
        D = 4'b0011;   
        
        #20          
        $finish;     
    end

    initial begin
        $dumpfile("tb_Dflipflop_4bit.vcd");  
        $dumpvars(0, tb_Dflipflop_4bit);     
    end

endmodule
