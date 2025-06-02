module Debouncer (input clock, I, output reg O);

    reg [19:0] count = 20'b00000000000000000000;
    reg IReg;

    always @ (posedge clock)
        begin
            if (IReg != I)
                begin
                    IReg <= I;
                    count <= 20'b00000000000000000000;
                end
            else if (count == 1000000)
                O <= IReg;
            else
                count <= count + 1;
        end

endmodule