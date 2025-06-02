module TimeParametersWithReprogrammability (
    input logic systemReset, reprogram,
    input logic [1:0] interval, timeParameterSelector,
    input logic [3:0] timeValue,
    output logic [3:0] value
);

    logic [3:0] T_ARM_DELAY = 4'b0110, T_DRIVER_DELAY = 4'b1000, T_PASSENGER_DELAY = 4'b1111, T_ALARM_ON = 4'b1010;

    always @(*) begin
        if (systemReset) begin
            T_ARM_DELAY = 4'b0110;
            T_DRIVER_DELAY = 4'b1000;
            T_PASSENGER_DELAY = 4'b1111;
            T_ALARM_ON = 4'b1010;
        end

        if (reprogram) begin
            case (timeParameterSelector)
                2'b00 : T_ARM_DELAY = timeValue;
                2'b01 : T_DRIVER_DELAY = timeValue;
                2'b10 : T_PASSENGER_DELAY = timeValue;
                2'b11 : T_ALARM_ON = timeValue;
            endcase
        end

        case (interval)
            2'b00 : value = T_ARM_DELAY;
            2'b01 : value = T_DRIVER_DELAY;
            2'b10 : value = T_PASSENGER_DELAY;
            2'b11 : value = T_ALARM_ON;
        endcase
    end

endmodule
