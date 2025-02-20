module and_gate(A_i, B_i, F_o);

    input A_i;
    input B_i;
    output F_o;

    assign F_o = A_i & B_i;

endmodule