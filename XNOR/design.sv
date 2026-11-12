// Code your design here
module xnor_gate(
    input a,       // First input
    input b,       // Second input
    output reg c   // XNOR output
);

// XNOR logic
always @(*)
begin
    c = a ^~ b;
end

endmodule