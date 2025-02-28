module E_Dflipflop (
    input            E_i,
    input            clk,
    input      [3:0] D,
    output reg [3:0] Q
);

    always @(posedge clk) begin
        if (E_i) Q <= D;
    end
    
endmodule