// Code your testbench here
// or browse Examples
module bit4_updown_counter_tb();

    // Input declarations
    reg clk, rst, en, dir, load_en;
    reg [3:0] load;

    // Output declaration
    wire [3:0] count;

    // DUT Instantiation
    bit4_updown_counter b1 (
        .clk(clk),
        .rst(rst),
        .en(en),
        .dir(dir),
        .load_en(load_en),
        .load(load),
        .count(count)
    );

    // Clock Generation
    always #5 clk = ~clk;

    // Apply input stimulus
    initial begin

        $monitor("Time=%0t | clk=%b | rst=%b | en=%b | dir=%b | load_en=%b | load=%b | count=%b",
                  $time, clk, rst, en, dir, load_en, load, count);

        clk     = 1'b0;
        rst     = 1'b1;
        en      = 1'b0;
        dir     = 1'b1;
        load_en = 1'b0;
        load    = 4'b0000;

        // Release Reset
        #12 rst = 1'b0;

        // Parallel Load
        #3 load = 4'b0100;
           load_en = 1'b1;

        #10 load_en = 1'b0;

        // Up Counting
        #10 en = 1'b1;
            dir = 1'b1;

        // Down Counting
        #40 dir = 1'b0;

        // Disable Counter
        #40 en = 1'b0;

        // Parallel Load New Value
        #10 load = 4'b1010;
            load_en = 1'b1;

        #10 load_en = 1'b0;

        // Up Counting Again
        #10 en = 1'b1;
            dir = 1'b1;

        #40 $finish;

    end

    // Generate waveform dump
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars();
    end

endmodule