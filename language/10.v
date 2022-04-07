module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

    wire abc, def, ab, cd;
    assign abc = p1a & p1c & p1b;
    assign def = p1f & p1e & p1d;
    assign p1y = abc | def;
    
    assign ab = p2a & p2b;
    assign cd = p2c & p2d;
    assign p2y = ab | cd;

endmodule