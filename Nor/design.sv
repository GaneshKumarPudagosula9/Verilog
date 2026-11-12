// Code your design here
module nor_gate(
    input a,       // First input
    input b,       // Second input
    output reg c   // NOR output
);

// NOR logic
always @(*)
begin
    c = ~(a | b);
end

endmodule
