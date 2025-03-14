`timescale 1ns/1ns

module tb_regfile (

);
    reg         clk;
    reg         we;
    reg  [1:0]  rs1;
    reg  [1:0]  rs2;
    reg  [1:0]  rd;
    reg  [31:0] rd_data;
    wire [31:0] rs1_data;
    wire [31:0] rs2_data;

    regfile u_regfile (
        clk, we, rs1, rs2, rd, rd_data, rs1_data, rs2_data
    );

    always 
        #5
        clk = ~clk;

    initial begin
        #0
        clk = 1'd0;
        
        #5 // x1 write
        we = 1'b1;
        rd = 2'b01;
        rd_data = 'd1;

        #5 // x1,x2 read
        we = 1'b0;
        rs1 = 2'b01;
        rs2 = 2'b00;

        #5 // x2 write
        we = 1'b1;
        rd = 2'b10;
        rd_data = 'd2;

        #5 // x1, x2 read
        we = 1'b0;
        rs1 = 2'b00;
        rs2 = 2'b10;

        #5
        $finish;

    end

    initial begin
        $dumpfile("regfile.vcd");  
        $dumpvars(1);     
    end


endmodule