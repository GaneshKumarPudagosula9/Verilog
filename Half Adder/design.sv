// Code your design here
module ha(
    input a,       // First input
    input b,       // Second input
    output reg s,  // Sum output
    output reg c   // Carry output
);

// Half Adder logic
always @(*)
begin
    s = a ^ b;
    c = a & b;
end

endmodule