// Code your design here
module nand_gate(
    input a,       // First input
    input b,       // Second input
    output reg c   // NAND output
);

// NAND logic
always @(*)
begin
    c = ~(a & b);
end

endmodule