`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2025 11:05:04 AM
// Design Name: 
// Module Name: CLA_Adder_32bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CLA_Adder_32bit (
    input [31:0] A, B,
    input Cin,
    output [31:0] Sum,
    output Cout
);
    wire [31:0] G, P;
    wire [31:0] C;

    assign G = A & B;
    assign P = A ^ B;

    assign C[0] = Cin;

    genvar i;
    generate
        for (i = 0; i < 31; i = i + 1) begin : carry
            assign C[i+1] = G[i] | (P[i] & C[i]);
        end
    endgenerate

    assign Sum = P ^ C[31:0];
    assign Cout = C[31];
endmodule
