module Timer1Hz (input clock, startTimer, input [3:0] value, output reg clock1Hz, expired);

    reg [26:0] counter = 27'b000000000000000000000000000;
//    reg [3:0] counter = 3'b0000; // only for simulation
    reg [3:0] counter1Hz = 4'b0000;
    reg indicator;

    always @ (startTimer, clock1Hz)
        begin
            if (startTimer & clock1Hz)
                indicator <= 1'b1;
            else
                indicator <= 1'b0;
        end

    always @ (negedge clock)
        begin
            if (counter == 27'b111011100110101100100111111)
//            if (counter == 4'b1001) // only for simulation
                begin
                    clock1Hz <= 1'b1;
                    counter <= 27'b000000000000000000000000000;
//                    counter <= 4'b0000; // only for simulation
                end
            else
                begin
                  	clock1Hz <= 1'b0;
                    counter <= counter + 27'b000000000000000000000000001;
//                    counter <= counter + 4'b0001; // only for simulation
                end

            if (startTimer)
                begin
                    counter <= 27'b111011100110101100100111111;
//                    counter <= 4'b1001; // only for simulation
                    counter1Hz <= 4'b0000;
                    expired <= 1'b0;
                end

            if (clock1Hz)
                begin
                    if (indicator)
                        counter1Hz <= 4'b0000;
                    else if (counter1Hz == value)
                        begin
                            expired <= 1'b1;
                            counter1Hz <= 4'b0000;
                        end
                    else
                        counter1Hz <= counter1Hz + 4'b0001;
                end

            if (expired)
                begin
                    expired <= 1'b0;
                    counter <= 27'b000000000000000000000000000;
//                    counter <= 4'b0000; // only for simulation
                end
        end

endmodule