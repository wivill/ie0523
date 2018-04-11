module button(sluz, iclk, ireset, itoggle);

    //parameter WIDTH = 8;

   output reg sluz;
   input wire iclk, ireset, itoggle;


   always @(posedge iclk)
     if (itoggle == 1) begin
        if (sluz == 1) begin
           sluz <= 1'b0;
        else begin
           sluz <= 1'b1;
        end
          
     end

   always @(ireset)
     if (ireset)
       out <= 0;

endmodule
