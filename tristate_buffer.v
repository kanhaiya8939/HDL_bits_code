`timescale 1ns / 1ps

module tb_tri_state_Buffer();

    // 1. Declare inputs as 'reg' and outputs as 'wire'
    reg  tb_x;
    reg  tb_enable;
    wire tb_y;

    // 2. Instantiate the Device Under Test (DUT)
    tri_state_Buffer uut (
        .x(tb_x),
        .enable(tb_enable),
        .y(tb_y)
    );

    // 3. Stimulus generation process
    initial begin
        // Display headers for easy log reading
        $display("Time\t Enable\t X\t Y");
        $display("----------------------------");
        
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

        // Monitor changes automatically
        $monitor("%0d ns\t   %b\t %b\t %b", $time, tb_enable, tb_x, tb_y);

        // Case 1: Initialize values
        tb_enable = 0; tb_x = 0;
        #10;
        
        // Case 2: Enable is 0, X changes (Output Y should follow X)
        tb_x = 1;
        #10;
        
        tb_x = 0;
        #10;

        // Case 3: Enable turns to 1 (Output Y should go to High-Impedance 'z')
        tb_enable = 1;
        #10;
        
        // Changing X while disabled should NOT affect Y (Y stays 'z')
        tb_x = 1;
        #10;
        
        tb_x = 0;
        #10;

        // Case 4: Test Unknown/Uninitialized states (Triggers the default case)
        tb_enable = 1'bx; 
        #10;

        // End the simulation safely
        $display("----------------------------");
        $finish;
    end

endmodule
