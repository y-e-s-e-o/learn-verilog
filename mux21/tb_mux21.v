`include "mux21.v"
`timescale 1ns/1ns

module tb_mux21(

);
    reg  D0_i;
    reg  D1_i;
    reg  S_i;
    wire Y_o;

    mux21 u_mux21(
        .D0_i (D0_i),
        .D1_i (D1_i),
        .S_i  (S_i),
        .Y_o  (Y_o)
    );

    initial begin
        #0
        D0_i = 1'b0;
        D1_i = 1'b1;
        S_i  = 1'b0;

        #1
        D0_i = 1'b0;
        D1_i = 1'b1;
        S_i  = 1'b1;

        #1
        D0_i = 1'b0;
        D1_i = 1'b1;
        S_i  = 1'b0;
        
        #1
        D0_i = 1'b0;
        D1_i = 1'b0;
        S_i  = 1'b1;

    end

    initial begin
	    $dumpfile("tb_mux21.vcd");
	    $dumpvars(0, tb_mux21);
    end
    
endmodule