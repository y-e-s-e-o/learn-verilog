`include "add_sub_4bit.v"

module ALU_4bit (
    input      [3:0] A_i,
    input      [3:0] B_i,
    input      [1:0] Control_i,
    output reg [3:0] R_o
);
    wire [3:0] R_w;
    wire       C_o;
    wire       N_o;
    wire       Z_o;
    wire       V_o;

    always @(*) begin

        case (Control_i[1:0])
            2'b00 : R_o = R_w;
            2'b01 : R_o = R_w;
            2'b10 : R_o = A_i | B_i;
            2'b11 : R_o = A_i & B_i;
        endcase
 
    end

    add_sub_4bit u_add_sub_4bit (
        .A_i (A_i),
        .B_i (B_i),
        .add_sub (Control_i[0]),
        .S_o (R_w),
        .C_o (C_o),
        .N_o (N_o),
        .Z_o (Z_o),
        .V_o (V_o)
    );


endmodule