module full_adder (A_i, B_i, C_i, S_o, C_o);

    input A_i;
    input B_i;
    input C_i;
    output S_o;
    output C_o;

    assign S_o = A_i ^ B_i ^ C_i;
    assign C_o = ((A_i ^ B_i) & C_i) | (A_i & B_i);

endmodule