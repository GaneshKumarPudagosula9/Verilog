// Code your design here
module bit4_updown_counter (
    input clk,
    input rst,
    input en,
    input dir,
    input load_en,
    input [3:0] load,
    output reg [3:0] count
);

    // 4-bit Synchronous Up/Down Counter
    always @(posedge clk) begin

        if (rst) begin
            count <= 4'b0000;       // Synchronous Reset
        end

        else if (load_en) begin
            count <= load;          // Parallel Load
        end

        else if (en) begin

            if (dir)
                count <= count + 1'b1;  // Up Counting

            else
                count <= count - 1'b1;  // Down Counting

        end

        else begin
            count <= count;          // Hold Previous Value
        end

    end

endmodule