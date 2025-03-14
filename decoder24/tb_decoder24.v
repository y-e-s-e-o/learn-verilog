`timescale 1ns/1ns

module tb_decoder24 (

);

    reg  A0_i;
    reg  A1_i;
    wire Y0_o;
    wire Y1_o;
    wire Y2_o;
    wire Y3_o;

    decoder24 u_decoder24 (
        .A0_i (A0_i),
        .A1_i (A1_i),
        .Y0_o (Y0_o),
        .Y1_o (Y1_o),
        .Y2_o (Y2_o),
        .Y3_o (Y3_o)
    );

    initial begin
        #0
        A0_i = 1'b0;
        A1_i = 1'b0;

        #1
        A0_i = 1'b1;
        A1_i = 1'b0;

        #1
        A0_i = 1'b0;
        A1_i = 1'b1;

        #1
        A0_i = 1'b1;
        A1_i = 1'b1;
    
    end

    initial begin
	    $dumpfile("decoder24.vcd");
	    $dumpvars(1);
    end

endmodule