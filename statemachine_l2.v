module fsm2(
    input wire clk  ,
    input wire rst  ,
    input wire data ,
    output reg flag
);

    parameter S0 = 5'b00001;
    parameter S1 = 5'b00010;
    parameter S2 = 5'b00100;
    parameter S3 = 5'b01000;
    parameter S4 = 5'b10000;
    reg [4:0] state, next;

    // main state
    always@(posedge clk or negedge rst) begin
        if(~rst)
            state <= S0;
        else
            state <= next;
    end
    // sub state and output flag
    always@(*) begin
        if(~rst) begin
            next <= S0;
            flag   <= 0;
        end
        else
            case(state)
                S0: begin
                    next <= data? S1: S0;
                    flag   <= 0;
                end
                S1: begin
                    next <= data? S2: S1;
                    flag   <= 0;
                end
                S2: begin
                    next <= data? S3: S2;
                    flag   <= 0;
                end
                S3: begin
                    next <= data? S4: S3;
                    flag   <= 0;
                end
                S4: begin
                    next <= data? S1: S0;
                    flag   <= data;
                end
                default: begin
                    next <= S0;
                    flag   <= 0;
                end
            endcase
    end
endmodule