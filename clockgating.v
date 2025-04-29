`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2025 12:33:19 PM
// Design Name: 
// Module Name: clockgating
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


module clockgating (
    input wire Clk,
    input wire Enable,
    output wire Gated_Clk
);
    reg Enable_latched;

    always @(posedge Clk)
        Enable_latched <= Enable;

    assign Gated_Clk = Clk & Enable_latched;
endmodule
