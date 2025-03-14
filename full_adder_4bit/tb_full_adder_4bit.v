`timescale 1ns/1ns

module tb_full_adder_4bit (
    // TB don't have any I/O port
);

    reg  [3:0] A_i;
    reg  [3:0] B_i;
    reg        C_i;
    wire [3:0] S_o;
    wire       C_o;

    // DUT inst
    full_adder_4bit u_full_adder_4bit(
        .A_i (A_i), 
        .B_i (B_i),
        .C_i (C_i),
        .S_o (S_o),
        .C_o (C_o)
    );

    initial begin
        #0
            A_i = 'd10;
            B_i = 'd5;
            C_i = 'd0;

        #1
            A_i = 'd3;
            B_i = 'd7;
            C_i = 'd0;
        #1
            A_i = 'd2;
            B_i = 'd3;
            C_i = 'd0;

    end

    initial begin
	    $dumpfile("full_adder_4bit.vcd");
	    $dumpvars(1);
    end

endmodule