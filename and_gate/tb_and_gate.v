`timescale 1ns/1ns

module tb_and_gate(
    // Testbench don't have any I/O port
);
    reg A_i;
    reg B_i;
    wire F_o;
    
    
    // DUT inst
    and_gate u_and_gate(
        .A_i (A_i),
        .B_i (B_i),
        .F_o (F_o)
    );

    initial begin
        #0 
        A_i = 1'b0;
        B_i = 1'b0;

        #5
        A_i = 1'b1;
        B_i = 1'b0;

        #5
        A_i = 1'b0;
        B_i = 1'b1;

        #5
        A_i = 1'b1;
        B_i = 1'b1;

    end

    initial begin
	    $dumpfile("and_gate.vcd");
	    $dumpvars(1);
    end

endmodule