module FuelPumpLogic (
    input  logic clock,
    input  logic ignition,
    input  logic brake,
    input  logic hidden,
    output logic fuelPumpPower
);

    logic fuelPumpPowerReg;

    always_ff @(posedge clock)
        fuelPumpPowerReg <= fuelPumpPower;

    always_comb
        fuelPumpPower = (ignition && fuelPumpPowerReg) || (ignition && brake && hidden);

endmodule
