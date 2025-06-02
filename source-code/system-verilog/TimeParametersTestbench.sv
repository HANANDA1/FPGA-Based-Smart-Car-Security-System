module TimeParametersTestbench;

    logic [1:0] interval;
    logic [3:0] value;

    TimeParameters TPT (
        .interval(interval),
        .value(value)
    );

    initial begin
        interval = 2'b00;
        #12 interval = 2'b01;
        #12 interval = 2'b10;
        #12 interval = 2'b11;
    end

    initial #48 $finish;

endmodule
