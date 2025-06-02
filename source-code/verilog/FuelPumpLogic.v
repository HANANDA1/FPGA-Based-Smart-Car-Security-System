module FuelPumpLogic (input clock, ignition, brake, hidden, output reg fuelPumpPower);

    reg fuelPumpPowerReg;

    always @ (posedge clock)
        fuelPumpPowerReg <= fuelPumpPower;

    always @ (ignition, brake, hidden, fuelPumpPowerReg)
        fuelPumpPower <= (ignition & fuelPumpPowerReg) | (ignition & brake & hidden);

endmodule