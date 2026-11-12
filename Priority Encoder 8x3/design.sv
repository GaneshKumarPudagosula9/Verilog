// Code your design here
module prior_enc(
    input [7:0] i,
    output reg [2:0] y
);

// Priority Encoder logic
always @(*)
begin
    y = {
        (i[7] | i[6] | ((~i[7]) & (~i[6]) & (i[5] | i[4]))),

        (i[7] | i[6] | ((~i[7]) & (~i[6]) & (~i[5]) &
        (~i[4]) & (i[3] | i[2]))),

        (i[7] | (~i[6] | i[5]) |
        ((~i[7]) & (~i[6]) & (~i[5]) & (~i[4]) &
        (i[3] | ((~i[2]) & i[1]))))
    };
end

endmodule