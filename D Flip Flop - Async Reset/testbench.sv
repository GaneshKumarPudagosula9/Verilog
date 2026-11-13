// Code your testbench here
// or browse Examples
module dff_asyn_tb();

    // Input declarations
    reg clk, d, rst;

    // Output declaration
    wire q;

    // DUT Instantiation
    dff_asyn d1 (
        .d(d),
        .rst(rst),
        .clk(clk),
        .q(q)
    );

    // Clock Generation
    always #5 clk = ~clk;

    // Apply input stimulus
    initial begin

        $monitor("Time=%0t | clk=%b | rst=%b | d=%b | q=%b",
                  $time, clk, rst, d, q);

        clk = 1'b0;
        d   = 1'b0;
        rst = 1'b1;

        #5  d = 1'b1;
        #10 rst = 1'b0;
        #5  d = 1'b1;
        #5  d = 1'b0;

        #50 $finish;

    end

    // Generate waveform dump
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars();
    end

endmodule