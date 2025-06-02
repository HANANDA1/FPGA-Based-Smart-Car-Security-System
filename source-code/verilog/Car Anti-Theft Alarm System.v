module CarAntiTheftAlarmSystem (input clock, systemReset, ignition, brake, hidden, driver, passenger, output fuelPumpPower, statusIndicator, siren);

    wire startTimer, clock1Hz, expired, sysReset, ign, brk, hid, drv, pas;
    wire [1:0] interval;
    wire [3:0] value;

    Debouncer D1 (clock, systemReset, sysReset);
    Debouncer D2 (clock, ignition, ign);
    Debouncer D3 (clock, brake, brk);
    Debouncer D4 (clock, hidden, hid);
    Debouncer D5 (clock, driver, drv);
    Debouncer D6 (clock, passenger, pas);
    FuelPumpLogic FPL (clock, ign, brk, hid, fuelPumpPower);
    AntiTheftFSM ATFSM (clock, sysReset, ign, drv, pas, clock1Hz, expired, statusIndicator, siren, startTimer, interval);
    TimeParameters TP (interval, value);
    Timer1Hz T1Hz (clock, startTimer, value, clock1Hz, expired);

endmodule