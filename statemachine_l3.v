`timescale 1ns/1ns

module statemachine_l3(
    input wire clk  ,
    input wire rst  ,
    input wire data ,
    output reg flag
);
    parameter s0 = 4'b0001;
    parameter s1 = 4'b0010;
    parameter s2 = 4'b0100;
    parameter s3 = 4'b1000;
    reg [3:0] state, next;

    // main state
    always @(posedge clk or negedge rst) begin
        if(rst == 1'b0)
            state <= s0;
        else
            state <= next;
    end
    // sub state
    always @(*) begin
        if(rst == 1'b0)
            next <= s0;
        else
            case(state)
                s0: next <= data?s1:s0;
                s1: next <= data?s2:s1;
                s2: next <= data?s3:s2;
                s3: next <= data?s0:s3;
                default: next = s0;
            endcase
    end
    // output flag
    always @(posedge clk or negedge rst) begin
        if(rst == 1'b0)
            flag <= 1'b0;
        else
            case(state)
                s0: flag <= 1'b0;
                s1: flag <= 1'b0;
                s2: flag <= 1'b0;
                s3: flag <= data;
                default: flag <= 1'b0;
            endcase
    end


endmodule