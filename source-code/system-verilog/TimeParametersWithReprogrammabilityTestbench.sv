module TimeParametersWithReprogrammabilityTestbench;

    logic systemReset, reprogram;
    logic [1:0] interval, timeParameterSelector;
    logic [3:0] timeValue;
    logic [3:0] value;

    TimeParametersWithReprogrammability TPWRT (
        .systemReset(systemReset), 
        .reprogram(reprogram), 
        .interval(interval), 
        .timeParameterSelector(timeParameterSelector), 
        .timeValue(timeValue), 
        .value(value)
    );

    initial begin
        systemReset = 1'b1;
        #12 systemReset = 1'b0;
        reprogram = 1'b0;
        interval = 2'b00;
        timeParameterSelector = 2'bxx; // undefined value for simulation
        timeValue = 4'bxxxx; // undefined value for simulation
        #12 interval = 2'b01;
        #12 interval = 2'b10;
        #12 interval = 2'b11;
        #12 interval = 2'bxx; // undefined value for simulation
        timeParameterSelector = 2'b00;
        timeValue = 4'b0111;
        #12 reprogram = 1'b1;
        #12 reprogram = 1'b0;
        timeParameterSelector = 2'b01;
        timeValue = 4'b0100;
        #12 reprogram = 1'b1;
        #12 reprogram = 1'b0;
        timeParameterSelector = 2'b10;
        timeValue = 4'b1110;
        #12 reprogram = 1'b1;
        #12 reprogram = 1'b0;
        timeParameterSelector = 2'b11;
        timeValue = 4'b1001;
        #12 reprogram = 1'b1;
        #12 reprogram = 1'b0;
        timeParameterSelector = 2'bxx; // undefined value for simulation
        timeValue = 4'bxxxx; // undefined value for simulation
        interval = 2'b00;
        #12 interval = 2'b01;
        #12 interval = 2'b10;
        #12 interval = 2'b11;
    end

    initial #204 $finish;

endmodule
