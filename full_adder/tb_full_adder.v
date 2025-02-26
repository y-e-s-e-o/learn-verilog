`include "full_adder.v"
`timescale 1ns/1ns

module tb_full_adder(

);
    reg        A_i;
    reg        B_i;
    reg        C_i;
    wire [1:0] F_o;

    full_adder u_full_adder(
        .A_i (A_i),
        .B_i (B_i),
        .C_i (C_i),
        .F_o (F_o)
    );

    initial begin
        #1
        A_i = 'd1;
        B_i = 'd0;
        C_i = 'd0;

        #1
        A_i = 'd1;
        B_i = 'd0;
        C_i = 'd1;

        #1
        A_i = 'd1;
        B_i = 'd1;
        C_i = 'd0;
        
    end

    initial begin
	    $dumpfile("tb_full_adder.vcd");
	    $dumpvars(0, tb_full_adder);
    end

endmodule