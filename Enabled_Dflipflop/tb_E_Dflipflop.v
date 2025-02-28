`include "E_Dflipflop.v"
`timescale 1ns/1ns

module tb_E_Dflipflop (

);
    reg        E_i;
    reg        clk;
    reg  [3:0] D;
    wire [3:0] Q;

    E_Dflipflop flipflop (
        E_i, clk, D, Q
    );

    always 
        #5 clk = ~clk;

    initial begin
        #0 // clk: 0, enable: 1
        clk = 1'b0;
        E_i = 1'b1;
        D = 4'b0001;

        #5 // clk: 1, enable: 1
        E_i = 1'b1;
        D = 4'b0001;

        #5 // clk: 0, enable: 0
        E_i = 1'b0;
        D = 4'b0010;

        #5 // clk: 1, enable: 1
        E_i = 1'b1;
        D = 4'b0010;

        #20
        $finish;
    end

    initial begin
        $dumpfile("tb_E_Dflipflop.vcd");  
        $dumpvars(0, tb_E_Dflipflop);     
    end

endmodule