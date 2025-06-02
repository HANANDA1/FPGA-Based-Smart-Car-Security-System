module TimeParameters (input [1:0] interval, output reg [3:0] value);

    always @ (interval)
        begin
            case (interval)
                2'b00 :
                    value = 4'b0110;
                2'b01 :
                    value = 4'b1000;
                2'b10 :
                    value = 4'b1111;
                2'b11 :
                    value = 4'b1010;
            endcase
        end

endmodule