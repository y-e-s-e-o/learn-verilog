module regfile (
    input             clk,
    input             we,
    input      [1:0]  rs1,
    input      [1:0]  rs2,
    input      [1:0]  rd,
    input      [31:0] rd_data,
    output reg [31:0] rs1_data,
    output reg [31:0] rs2_data
);
    reg [31:0] x1;
    reg [31:0] x2;
    reg [31:0] x3;

    //write
    always @(posedge clk) begin
        if (we) begin
            case (rd[1:0])
            2'd0: ;
            2'd1: x1 <= rd_data; // Nonblocking statement???
            2'd2: x2 <= rd_data;
            2'd3: x3 <= rd_data;
            endcase
        end
    end

    //read
    always @(*) begin
        case (rs1[1:0])
        2'd0: rs1_data = 'd0;
        2'd1: rs1_data = x1;
        2'd2: rs1_data = x2;
        2'd3: rs1_data = x3;
        endcase
    end

    always @(*) begin
        case (rs2[1:0])
        2'd0: rs2_data = 'd0;
        2'd1: rs2_data = x1;
        2'd2: rs2_data = x2;
        2'd3: rs2_data = x3;
        endcase
    end


endmodule