module SirenGeneratorTestbench;

    logic clock, siren;
    wire speaker;

    SirenGenerator SGT (
        .clock(clock),
        .siren(siren),
        .speaker(speaker)
    );

    initial begin
        clock = 1'b0;
        siren = 1'b0;
        #10 siren = 1'b1;
    end

    always #4 clock = ~clock;

    initial #1000 $finish;

endmodule
