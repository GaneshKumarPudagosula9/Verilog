// Code your testbench here
// or browse Examples
module dff_tb();

    // Input declarations
    reg d, clk;

    // Output declaration
    wire q;

    // DUT Instantiation
    dff d1 (
        .q(q),
        .d(d),
        .clk(clk)
    );

    // Clock Generation
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    // Apply input stimulus
    initial begin

        $monitor("Time=%0t | clk=%b | d=%b | q=%b",
                  $time, clk, d, q);

        d = 1'b0;

        #12 d = 1'b1;
        #10 d = 1'b0;
        #10 d = 1'b1;

        #68 $finish;
    end

    // Generate waveform dump
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars();
    end

endmodule