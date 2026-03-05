`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2026 13:07:02
// Design Name: 
// Module Name: ALU_8Bit_Final_Project
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


module ALU_8Bit_Final_Project(
    input  [7:0] InputA,
    input  [7:0] InputB,
    input  [2:0] OpCode,
    output reg [15:0] OutALU,
    output reg COut
);

always @(*) begin
    // Default values
    OutALU = 16'b0;
    COut   = 1'b0;

    case (OpCode)

        // 000 : Addition
        3'b000: begin
            {COut, OutALU[7:0]} = InputA + InputB;
        end

        // 001 : Subtraction
        3'b001: begin
            {COut, OutALU[7:0]} = InputA - InputB;
        end

        // 010 : Multiplication
        3'b010: begin
            OutALU = InputA * InputB;
            COut   = 1'b0;
        end

        // 011 : Left Shift
        3'b011: begin
            OutALU = InputA << 1;
        end

        // 100 : Right Shift
        3'b100: begin
            OutALU = InputA >> 1;
        end

        // 101 : Logical AND
        3'b101: begin
            OutALU[7:0] = InputA & InputB;
        end

        // 110 : Logical OR
        3'b110: begin
            OutALU[7:0] = InputA | InputB;
        end

        // 111 : Logical XOR
        3'b111: begin
            OutALU[7:0] = InputA ^ InputB;
        end

        default: begin
            OutALU = 16'b0;
            COut   = 1'b0;
        end

    endcase
end

endmodule

