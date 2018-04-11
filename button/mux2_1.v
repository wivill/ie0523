module mux2_1(output Out, input i0, input i1, input s0);

   wire and0_or0, and1_or0;
   wire sn0;

   not n0(sn0, s0);
   
   and and0(and0_or0, sn0, i0);
   and and1(and1_or0, s0, i1);

   or or0(Out, and0_or0, and1_or0);

endmodule // mux2_1
