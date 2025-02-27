//signed 정수의 가산기, 감산기d

module add_sub_4bit (
    input  [3:0] A_i, B_i,
    input        add_sub, // 0: add, 1: sub -> sub일때 ~B_i + 1(C_w[0])로 2의 보수형태로 바뀜
    output [3:0] S_o,
    output       C_o, N_o, Z_o, V_o
);

    wire [4:0] C_w;
    wire [3:0] B_w;

    assign C_w[0] = add_sub;
    assign B_w    = add_sub ? ~B_i : B_i;

    adder_4bit adder (
        .A_i (A_i),
        .B_i (B_w),
        .C_i (C_w[0]),
        .S_o (S_o),
        .C_o (C_o),
        .N_o (N_o),
        .Z_o (Z_o),
        .V_o (V_o)
        
    );

endmodule


module adder_4bit (
    input   [3:0] A_i, B_i,
    input         C_i,
    output  [3:0] S_o,
    output        C_o, N_o, Z_o, V_o
);

    wire    [4:0] C_w;

    assign C_w[0] = C_i;
    assign C_o    = C_w[4];
    assign N_o    = S_o[3];
    assign Z_o    = (S_o == 4'b0000);
    assign V_o    = C_o ^ C_w[3];


    adder_1bit bit0 (
        .A_i (A_i[0]),
        .B_i (B_i[0]),
        .C_i (C_w[0]),
        .S_o (S_o[0]),
        .C_o (C_w[1])
    );

    adder_1bit bit1 (
        .A_i (A_i[1]),
        .B_i (B_i[1]),
        .C_i (C_w[1]),
        .S_o (S_o[1]),
        .C_o (C_w[2])
    );

    adder_1bit bit2 (
        .A_i (A_i[2]),
        .B_i (B_i[2]),
        .C_i (C_w[2]),
        .S_o (S_o[2]),
        .C_o (C_w[3])
    );

    adder_1bit bit3 (
        .A_i (A_i[3]),
        .B_i (B_i[3]),
        .C_i (C_w[3]),
        .S_o (S_o[3]),
        .C_o (C_w[4])
    );

endmodule


module adder_1bit (
    input  A_i, B_i,
    input  C_i,
    output S_o, C_o
);
    assign S_o = A_i ^ B_i ^ C_i;
    assign C_o = (A_i & B_i) | ((A_i ^ B_i) & C_i);

endmodule