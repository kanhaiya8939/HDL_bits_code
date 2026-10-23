
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2026 10:49:44 AM
// Design Name: 
// Module Name: tri_state_Buffer
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


module tri_state_Buffer(
input x,
input  enable,
output reg y

    );
  always @(*)begin
  case(enable)
  1'b0 : begin 
   y <= x;
   end
    1'b1 : begin 
   y <= 1'bz;
   end
   default : y<= 1'b0;
  endcase
  end  
endmodule
