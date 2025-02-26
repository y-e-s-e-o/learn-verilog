`include "add_sub_4bit.v"
`timescale 1ns/1ns

module tb_add_sub_4bit (

);
    reg  [3:0] A_i;
    reg  [3:0] B_i;
    reg        add_sub;
    wire [3:0] S_o;
    wire       C_o;
    wire       N_o;
    wire       Z_o; 
    wire       V_o;

    add_sub_4bit adder (
        .A_i (A_i),
        .B_i (B_i),
        .add_sub (add_sub),
        .S_o (S_o),
        .C_o (C_o),
        .N_o (N_o),
        .Z_o (Z_o),
        .V_o (V_o)
    );

    initial begin
        #0 // 1+2 -> Carry:0, N:0, V:0, Z:0
        A_i = 4'b0001;
        B_i = 4'b0010;
        add_sub = 1'b0;

        #1 // 3-2 -> Carry:1, N:0, V:0, Z:0
        A_i = 4'b0011;
        B_i = 4'b0010;
        add_sub = 1'b1;

        #1 // -7+1 -> Carry:0, N:1, V:0, Z:0
        A_i = 4'b1001;
        B_i = 4'b0001;
        add_sub = 1'b0;

        #1 // -7-2 -> Carry:1, N:0, V:1, Z:0
        A_i = 4'b1001;
        B_i = 4'b0010;
        add_sub = 1'b1;

        #1 // 5+5 -> Carry:0, N:1, V:1, Z:0
        A_i = 4'b0101;
        B_i = 4'b0101;
        add_sub = 1'b0;

    end

    initial begin
	    $dumpfile("tb_add_sub_4bit.vcd");
	    $dumpvars(0, tb_add_sub_4bit);
    end

endmodule