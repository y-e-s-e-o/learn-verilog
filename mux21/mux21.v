module mux21 (
    input  D0_i,
    input  D1_i,
    input  S_i,
    output Y_o
);

    assign Y_o = S_i ? D0_i : D1_i;
    
endmodule