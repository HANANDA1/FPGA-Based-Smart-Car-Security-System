module TimeParameters (
    input logic [1:0] interval,
    output logic [3:0] value
);

    always_comb begin
        case (interval)
            2'b00: value = 4'b0110;
            2'b01: value = 4'b1000;
            2'b10: value = 4'b1111;
            2'b11: value = 4'b1010;
            default: value = 4'b0000; // optional safe default
        endcase
    end

endmodule
