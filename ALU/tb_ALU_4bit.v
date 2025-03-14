`timescale 1ns/1ns

module tb_ALU_4bit (

);
    reg  [3:0] A_i;
    reg  [3:0] B_i;
    reg  [1:0] Control_i;
    wire [3:0] R_o;

    ALU_4bit u_ALU_4bit (
        .A_i (A_i),
        .B_i (B_i),
        .Control_i (Control_i),
        .R_o (R_o)
    );

    initial begin

        #0 //1+2
        A_i = 4'b0001;
        B_i = 4'b0010;
        Control_i = 2'b00;

        #1 // 2-1
        A_i = 4'b0010;
        B_i = 4'b0001;
        Control_i = 2'b01;

        #1 // OR
        A_i = 4'b0001;
        B_i = 4'b0010;
        Control_i = 2'b10;

        #1 // AND
        A_i = 4'b0001;
        B_i = 4'b0011;
        Control_i = 2'b11;

    end

    initial begin
	    $dumpfile("ALU_4bit.vcd");
	    $dumpvars(1);
    end

endmodule