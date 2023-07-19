`include "Traffic_Light_Controller.v"
`timescale 1ns / 1ps

module Traffic_Light_Controller_Testbench;
  reg clk;
  reg rst;
  wire [2:0] light_M1;
  wire [2:0] light_S;
  wire [2:0] light_MT;
  wire [2:0] light_M2;

  Traffic_Light_Controller dut (
    .clk(clk),
    .rst(rst),
    .light_M1(light_M1),
    .light_S(light_S),
    .light_MT(light_MT),
    .light_M2(light_M2)
  );

  initial begin
    clk = 0;
    rst = 1;
    #5 rst = 0;

    $dumpfile("Traffic_Light_Controller_Testbench.vcd");
    $dumpvars(0, Traffic_Light_Controller_Testbench);

    repeat (100) begin
      #10 clk = ~clk;
    end

    #100 $finish;
  end
endmodule
