`include "rs_Dflipflop.v"
`timescale 1ns/1ns

module tb_rs_Dflipflop (

);
    reg        clk;
    reg        reset;
    reg  [3:0] D;
    wire [3:0] Q;

    rs_Dflipflop flipflop (
        clk, reset, D, Q
    );

    always
        #5 clk = ~clk;
    
    initial begin
        #0 // clk: 0, reset: 0
        clk = 1'b0;
        reset = 1'b0;
        D = 4'b0001;

        #5 // clk: 1, reset: 1
        reset = 1'b1;
        D = 4'b0001;
        
        #5 // clk: 0, reset: 1
        reset = 1'b1;
        D = 4'b0010;

        #5 // clk: 1, reset: 0
        reset = 1'b0;
        D = 4'b0001;

        #20
        $finish;

    end

    initial begin
        $dumpfile("tb_rs_Dflipflop.vcd");  
        $dumpvars(0, tb_rs_Dflipflop);     
    end

endmodule