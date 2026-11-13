// Code your design here
module dff_asyn (
    input  d,
    input  rst,
    input  clk,
    output reg q
);

    // Asynchronous Active-HIGH Reset D Flip-Flop
    always @(posedge clk or posedge rst) begin

        if (rst)
            q <= 1'b0;  // Reset output immediately

        else
            q <= d;     // Capture input data

    end

endmodule