`include "mux41.v"
`timescale 1ns/1ns

module tb_mux41 (

);

    reg  [1:0]  D0_i;
    reg  [1:0]  D1_i;
    reg  [1:0]  D2_i;
    reg  [1:0]  D3_i;
    reg  [1:0]  S_i;
    wire [1:0]  Y_o;

    mux41 u_mux_41 (
        .D0_i (D0_i),
        .D1_i (D1_i),
        .D2_i (D2_i),
        .D3_i (D3_i),
        .S_i  (S_i),
        .Y_o  (Y_o)
    );

    initial begin
        #0
        D0_i = 2'b00;
        D1_i = 2'b01;
        D2_i = 2'b10;
        D3_i = 2'b11;
        S_i  = 2'b00; 

        #1
        D0_i = 2'b00;
        D1_i = 2'b01;
        D2_i = 2'b10;
        D3_i = 2'b11;
        S_i  = 2'b01; 

        #1
        D0_i = 2'b00;
        D1_i = 2'b01;
        D2_i = 2'b10;
        D3_i = 2'b11;
        S_i  = 2'b10; 

        #1
        D0_i = 2'b00;
        D1_i = 2'b01;
        D2_i = 2'b10;
        D3_i = 2'b11;
        S_i  = 2'b11; 


    end

    initial begin
	    $dumpfile("tb_mux41.vcd");
	    $dumpvars(0, tb_mux41);
    end

endmodule