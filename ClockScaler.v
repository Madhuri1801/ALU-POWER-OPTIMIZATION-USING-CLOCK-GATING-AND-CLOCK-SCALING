`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2025 11:06:21 AM
// Design Name: 
// Module Name: ClockScaler
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


module ClockScaler (
    input wire Clk,
    input wire [1:0] Power_Mode,
    output reg Clk_Scaled
);
    reg [1:0] count;

    always @(posedge Clk) begin
        case (Power_Mode)
            2'b00: count <= count + 2'd1;  // /4
            2'b01: count <= count + 2'd2;  // /2
            2'b10: count <= 2'd0;          // full speed
            default: count <= 2'd0;
        endcase
    end

    always @(*) begin
        case (Power_Mode)
            2'b00: Clk_Scaled = (count == 2'b11);    // pulse every 4 cycles
            2'b01: Clk_Scaled = count[0];            // pulse every 2 cycles
            2'b10: Clk_Scaled = Clk;                 // full clock
            default: Clk_Scaled = Clk;
        endcase
    end
endmodule
