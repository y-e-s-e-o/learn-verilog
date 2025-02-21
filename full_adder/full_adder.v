module full_adder(
    A_i, B_i, C_i, S_o; C_o
);

    input [3:0] A_i;
    input [3:0] B_i;
    input C_i;
    output [3:0] F_o;

    wire S_w;
    wire C_w;

    assign S_w = A_i ^ B_i ^ C_i;
    assign C_w = ((A_i ^ B_i) & C_i) | (A_i & B_i);
    // S_w에 저장된 bit와 C_w의 bit 를 붙여서 하나의 출력으로 만들기
    assign F_o = {C_w, S_w}

endmodule
