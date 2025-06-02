module CarAntiTheftAlarmSystem (
    input logic clock,
    input logic systemReset,
    input logic ignition,
    input logic brake,
    input logic hidden,
    input logic driver,
    input logic passenger,
    output logic fuelPumpPower,
    output logic statusIndicator,
    output logic siren
);

    logic startTimer;
    logic clock1Hz;
    logic expired;
    logic sysReset;
    logic ign;
    logic brk;
    logic hid;
    logic drv;
    logic pas;
    logic [1:0] interval;
    logic [3:0] value;

    Debouncer D1 (.clock(clock), .signalIn(systemReset), .signalOut(sysReset));
    Debouncer D2 (.clock(clock), .signalIn(ignition),    .signalOut(ign));
    Debouncer D3 (.clock(clock), .signalIn(brake),       .signalOut(brk));
    Debouncer D4 (.clock(clock), .signalIn(hidden),      .signalOut(hid));
    Debouncer D5 (.clock(clock), .signalIn(driver),      .signalOut(drv));
    Debouncer D6 (.clock(clock), .signalIn(passenger),   .signalOut(pas));
    FuelPumpLogic FPL (.clock(clock), .ign(ign), .brk(brk), .hid(hid), .fuelPumpPower(fuelPumpPower));
    AntiTheftFSM ATFSM (
        .clock(clock),
        .reset(sysReset),
        .ign(ign),
        .drv(drv),
        .pas(pas),
        .clock1Hz(clock1Hz),
        .expired(expired),
        .statusIndicator(statusIndicator),
        .siren(siren),
        .startTimer(startTimer),
        .interval(interval)
    );
    TimeParameters TP (.interval(interval), .value(value));
    Timer1Hz T1Hz (.clock(clock), .startTimer(startTimer), .value(value), .clock1Hz(clock1Hz), .expired(expired));

endmodule
