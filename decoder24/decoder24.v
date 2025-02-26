module decoder24 (
    input A0_i, A1_i,
    output Y0_o, Y1_o, Y2_o, Y3_o
);

    assign Y0_o = ({A1_i, A0_i} == 2'b00);
    assign Y1_o = ({A1_i, A0_i} == 2'b01);
    assign Y2_o = ({A1_i, A0_i} == 2'b10);
    assign Y3_o = ({A1_i, A0_i} == 2'b11);
    
endmodule