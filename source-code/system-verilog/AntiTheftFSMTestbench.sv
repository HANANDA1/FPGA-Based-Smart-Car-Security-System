module AntiTheftFSMTestbench;

    logic clock, ignition, driver, passenger, systemReset, expired, clock1Hz;
    logic status, siren, startTimer;
    logic [1:0] interval;

    // Instantiate the DUT (Device Under Test)
    AntiTheftFSM ATFSMT (
        .clock(clock),
        .systemReset(systemReset),
        .ignition(ignition),
        .driver(driver),
        .passenger(passenger),
        .clock1Hz(clock1Hz),
        .expired(expired),
        .status(status),
        .siren(siren),
        .startTimer(startTimer),
        .interval(interval)
    );

    // Clock generation
    initial clock = 0;
    always #4 clock = ~clock;

    // 1Hz Clock generation
    initial clock1Hz = 0;
    always #500 clock1Hz = ~clock1Hz;

    // Stimulus
    initial begin
        expired = 0;
        ignition = 0;
        driver = 1;
        passenger = 1;
        systemReset = 0;

        #20 systemReset = 1;     // Assert system reset
        #10 systemReset = 0;     // Deassert reset

        #20 driver = 0;          // Driver door open
        #36 expired = 1;
        #40 expired = 0;

        #24 driver = 1;          // Driver door closed
        #16 expired = 1;
        #40 expired = 0;
        #40 expired = 1;
        #40 expired = 0;
        #40 expired = 1;
        #40 expired = 0;
        #40 expired = 1;
        #40 expired = 0;
        #40 expired = 1;
        #40 expired = 0;
    end

    // End simulation after enough time
    initial #5200 $finish;

endmodule
