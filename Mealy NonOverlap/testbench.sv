// Code your testbench here
// or browse Examples
module tb_mealy_overlap;

reg clk, rst, din;
wire dout;

mealy_overlap m1(
    .clk(clk),
    .rst(rst),
    .din(din),
    .dout(dout)
);

// Clock generation
initial
    clk = 0;

always #5 clk = ~clk;

// Testbench
initial
begin
  $monitor("Time=%0t | rst=%b | din=%b | ps=%b | dout=%b",
              $time, rst, din, m1.ps, dout);

    rst = 1;
    din = 0;

    #12 rst = 0;

    // Input sequence: 1011011

    #15 din = 1;
    #15 din = 0;
    #15 din = 1;
    #15 din = 1;
    #15 din = 0;
    #15 din = 1;
    #15 din = 1;
    #15 din = 0;

    #10;
    $finish;
end
initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars();
    end
endmodule
