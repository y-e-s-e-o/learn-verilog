module mux41 (
    input      [1:0] D0_i,
    input      [1:0] D1_i,
    input      [1:0] D2_i,
    input      [1:0] D3_i,
    input      [1:0] S_i,
    output reg [1:0] Y_o
);

    always @(*) begin
        if      (S_i == 2'b00) Y_o = D0_i;
        else if (S_i == 2'b01) Y_o = D1_i;
        else if (S_i == 2'b10) Y_o = D2_i;
        else                   Y_o = D3_i;
        
    end

endmodule