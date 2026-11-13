// Code your testbench here
// or browse Examples
module dff_pre_clr_tb();

    // Input declarations
    reg clk, d, rst, pre, clr;

    // Output declaration
    wire q;

    // DUT Instantiation
    dff_pre_clr d1 (
        .d(d),
        .rst(rst),
        .clk(clk),
        .pre(pre),
        .clr(clr),
        .q(q)
    );

    // Clock Generation
    always #5 clk = ~clk;

    // Apply input stimulus
    initial begin

        $monitor("Time=%0t | clk=%b | rst=%b | pre=%b | clr=%b | d=%b | q=%b",
                  $time, clk, rst, pre, clr, d, q);

        clk = 1'b0;
        d   = 1'b0;
        rst = 1'b1;
        pre = 1'b0;
        clr = 1'b0;

        #5  d = 1'b1;
        #10 rst = 1'b0;
        #5  d = 1'b1;
        #5  d = 1'b0;
        #5  d = 1'b1;
        #5  pre = 1'b1;
        #5  pre = 1'b0;
        #5  clr = 1'b1;

        #60 $finish;

    end

    // Generate waveform dump
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars();
    end

endmodule