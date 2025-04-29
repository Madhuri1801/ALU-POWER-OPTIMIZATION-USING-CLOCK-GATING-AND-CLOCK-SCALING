`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2025 11:04:17 AM
// Design Name: 
// Module Name: ALU_32bit
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


module ALU_32bit (
    input [31:0] A, B,
    input [2:0] Opcode,
    input [1:0] Power_Mode,
    input Clk,
    input Enable,
    output reg [31:0] Result,
    output reg Cout
);

    // Internal wires
    wire [31:0] CLA_Sum;
    wire CLA_Cout;
    wire Clk_Scaled;
    wire Clk_Gated_CLA, Clk_Gated_Logic;
    wire [31:0] B_comp_isolated;

    // Operand isolation for subtraction
    assign B_comp_isolated = (Opcode == 3'b001) ? ~B + 1 : B;

    // Instantiate CLA Adder
    CLA_Adder_32bit CLA (
        .A(A),
        .B(B_comp_isolated),
        .Cin(1'b0),
        .Sum(CLA_Sum),
        .Cout(CLA_Cout)
    );

    // Clock Scaling
    ClockScaler clk_div (
        .Clk(Clk),
        .Power_Mode(Power_Mode),
        .Clk_Scaled(Clk_Scaled)
    );

    // Clock Gating Cells
    clockgating cla_gate (
        .Clk(Clk_Scaled),
        .Enable(Enable && (Opcode == 3'b000 || Opcode == 3'b001)),
        .Gated_Clk(Clk_Gated_CLA)
    );

    clockgating logic_gate (
        .Clk(Clk_Scaled),
        .Enable(Enable && (Opcode >= 3'b010 && Opcode <= 3'b101)),
        .Gated_Clk(Clk_Gated_Logic)
    );

    // Arithmetic Operations (ADD/SUB)
    always @(posedge Clk_Gated_CLA) begin
    case(Opcode)
    3'b000: {Result , Cout} = { CLA_Sum , CLA_Cout};
    3'b001: {Result , Cout} = { CLA_Sum , ~CLA_Cout};
    default : $display("invalid input");
    endcase 
    end
    
   
    // Logic Operations (AND, OR, XOR, NOT)
    always @(posedge Clk_Gated_Logic) begin
        case (Opcode)
            3'b010: Result <= A & B;
            3'b011: Result <= A | B;
            3'b100: Result <= A ^ B;
            3'b101: Result <= ~A;
            default: Result <= 32'b0;
        endcase
        Cout <= 1'b0;
    end
endmodule