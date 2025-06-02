module Timer1Hz (
    input logic clock,
    input logic startTimer,
    input logic [3:0] value,
    output logic clock1Hz,
    output logic expired
);

    logic [26:0] counter = 27'b000000000000000000000000000;
    logic [3:0] counter1Hz = 4'b0000;
    logic indicator;

    always_ff @ (posedge clock) begin
        if (counter == 27'b111011100110101100100111111)
            begin
                clock1Hz <= 1'b1;
                counter <= 27'b000000000000000000000000000;
            end
        else
            begin
                clock1Hz <= 1'b0;
                counter <= counter + 27'b000000000000000000000000001;
            end

        if (startTimer)
            begin
                counter <= 27'b111011100110101100100111111;
                counter1Hz <= 4'b0000;
                expired <= 1'b0;
            end

        if (clock1Hz)
            begin
                if (indicator)
                    counter1Hz <= 4'b0000;
                else if (counter1Hz == value)
                    begin
                        expired <= 1'b1;
                        counter1Hz <= 4'b0000;
                    end
                else
                    counter1Hz <= counter1Hz + 4'b0001;
            end

        if (expired)
            begin
                expired <= 1'b0;
                counter <= 27'b000000000000000000000000000;
            end
    end

    always_comb begin
        if (startTimer & clock1Hz)
            indicator = 1'b1;
        else
            indicator = 1'b0;
    end

endmodule
