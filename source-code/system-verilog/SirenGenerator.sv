module SirenGenerator (
    input logic clock,
    input logic siren,
    output logic speaker
);

    logic [26:0] tone;
    wire [6:0] ramp = ~tone[25:19];
    wire [17:0] clockDivider = {2'b01, ramp, 9'b0};
    logic [17:0] counter;

    always_ff @(posedge clock) begin
        if (!siren) begin
            speaker <= 1'b0;
            tone <= '0;
            counter <= clockDivider;
        end else begin
            tone <= tone + 27'd1;
            if (counter == 18'd0) begin
                counter <= clockDivider;
                speaker <= ~speaker;
            end else begin
                counter <= counter - 18'd1;
            end
        end
    end

endmodule
