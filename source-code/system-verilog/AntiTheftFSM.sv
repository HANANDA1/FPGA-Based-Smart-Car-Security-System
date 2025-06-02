module AntiTheftFSM (
    input  logic clock,
    input  logic systemReset,
    input  logic ignition,
    input  logic driver,
    input  logic passenger,
    input  logic clock1Hz,
    input  logic expired,
    output logic status,
    output logic siren,
    output logic startTimer,
    output logic [1:0] interval
);

    typedef enum logic [2:0] {
        OffDisarmed = 3'b000,
        OffArmed    = 3'b001,
        OnDisarmed  = 3'b010,
        Siren       = 3'b011,
        TimeWait    = 3'b100
    } state_t;

    logic clock2s = 1'b0;
    logic doorsOpen;
    state_t state, nextState;

    always_ff @(posedge clock) begin
        if (clock1Hz)
            clock2s <= ~clock2s;

        case (state)
            OffDisarmed: begin
                if (systemReset) begin
                    doorsOpen <= 1'b0;
                    status <= clock2s;
                    startTimer <= 1'b0;
                    siren <= 1'b0;
                    nextState <= OffArmed;
                end
                else if (ignition) begin
                    doorsOpen <= 1'b0;
                    nextState <= OnDisarmed;
                end
                else if (~(driver & passenger)) begin
                    doorsOpen <= 1'b1;
                    status <= 1'b0;
                    siren <= 1'b0;
                    startTimer <= 1'b0;
                    nextState <= OffDisarmed;
                end
                else begin
                    if (driver & passenger & doorsOpen) begin
                        interval <= 2'b00;
                        startTimer <= 1'b1;
                        doorsOpen <= 1'b0;
                        status <= 1'b1;
                        siren <= 1'b0;
                        nextState <= TimeWait;
                    end
                    else begin
                        doorsOpen <= 1'b1;
                        status <= 1'b0;
                        siren <= 1'b0;
                        startTimer <= 1'b0;
                        nextState <= OffDisarmed;
                    end
                end
            end

            OffArmed: begin
                if (ignition) begin
                    status <= 1'b0;
                    siren <= 1'b0;
                    startTimer <= 1'b0;
                    nextState <= OnDisarmed;
                end
                else if (~driver) begin
                    interval <= 2'b01;
                    startTimer <= 1'b1;
                    status <= 1'b1;
                    siren <= 1'b0;
                    nextState <= TimeWait;
                end
                else if (~passenger) begin
                    interval <= 2'b10;
                    startTimer <= 1'b1;
                    status <= 1'b1;
                    siren <= 1'b0;
                    nextState <= TimeWait;
                end
                else begin
                    status <= clock2s;
                    siren <= 1'b0;
                    startTimer <= 1'b0;
                    nextState <= OffArmed;
                end
            end

            OnDisarmed: begin
                if (systemReset) begin
                    doorsOpen <= 1'b0;
                    status <= clock2s;
                    startTimer <= 1'b0;
                    siren <= 1'b0;
                    nextState <= OffArmed;
                end
                else if (~ignition) begin
                    status <= 1'b0;
                    siren <= 1'b0;
                    startTimer <= 1'b0;
                    nextState <= OffDisarmed;
                end
                else begin
                    status <= 1'b0;
                    siren <= 1'b0;
                    startTimer <= 1'b0;
                    nextState <= OnDisarmed;
                end
            end

            Siren: begin
                if (driver & passenger) begin
                    interval <= 2'b11;
                    startTimer <= 1'b1;
                    status <= 1'b1;
                    siren <= 1'b1;
                    nextState <= TimeWait;
                end
                else begin
                    status <= 1'b1;
                    siren <= 1'b1;
                    startTimer <= 1'b0;
                    nextState <= Siren;
                end
            end

            TimeWait: begin
                startTimer <= 1'b0;
                if (expired) begin
                    case (interval)
                        2'b00, 2'b11: begin
                            status <= clock2s;
                            siren <= 1'b0;
                            nextState <= OffArmed;
                        end
                        2'b01, 2'b10: begin
                            status <= 1'b1;
                            siren <= 1'b1;
                            nextState <= Siren;
                        end
                    endcase
                end
                else begin
                    case (interval)
                        2'b00: begin
                            if (~(driver & passenger)) begin
                                status <= 1'b0;
                                siren <= 1'b0;
                                nextState <= OffDisarmed;
                            end
                            else if (ignition) begin
                                status <= 1'b0;
                                siren <= 1'b0;
                                nextState <= OnDisarmed;
                            end
                            else begin
                                nextState <= TimeWait;
                            end
                        end

                        2'b01, 2'b10: begin
                            if (ignition) begin
                                status <= 1'b0;
                                siren <= 1'b0;
                                nextState <= OnDisarmed;
                            end
                            else begin
                                nextState <= TimeWait;
                            end
                        end

                        2'b11: begin
                            nextState <= TimeWait;
                        end
                    endcase
                end
            end

            default: begin
                status <= clock2s;
                siren <= 1'b0;
                startTimer <= 1'b0;
                nextState <= OffArmed;
            end
        endcase

        state <= nextState;
    end

endmodule
