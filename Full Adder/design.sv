// Code your design here
module fa(
    input a,
    input b,
    input cin,
    output s,
    output cout
);

// Full Adder logic
assign s    = (a ^ b ^ cin);
assign cout = ((a & b) | (cin & (a ^ b)));

endmodule