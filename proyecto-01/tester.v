`timescale 1ns / 100ps

module tester(      output reg  [7:0]   IN_COM, IN_PAD, IN_SKP, IN_STP, IN_SDP, IN_END, IN_EDB, IN_FTS, IN_IDL, IN_TLP,
                    output reg          CLK_2MHz,
                    output reg  [3:0]   IN_CTRL,
                    output reg          ENB,
                    output reg          reset
                    );

  initial begin
    $dumpfile("pcie.vcd");
    $dumpvars;
  end

  initial begin
    CLK_2MHz = 1'b0;
    ENB = 1'b0;
    reset = 1'b0;
    // CTR = 3'b110;
    #500
    repeat(2) #250 CLK_2MHz = ~CLK_2MHz;
    ENB = 1'b1;
    reset = 1'b1;
    forever #250 CLK_2MHz = ~CLK_2MHz;
  end

  initial begin
    @(posedge ENB)
    // repeat(8) @(posedge CLK_2MHz);
    IN_CTRL = 0;      // Agarra un TLP
    IN_TLP = 8'hFF;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 1;      // Agarra un COM
    IN_TLP = 8'h0A;
    IN_COM = 8'hF2;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 2;      // Agarra un PAD
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'hC7;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 3;     // Agarra un TLP
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'hAC;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 4;     // Agarra un STP
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'hAA;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 5;     // Agarra un SDP
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'hE5;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 6;     // Agarra un END
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'hF6;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 7;     // Agarra un EDB
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'hDF;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;
    #1000
    IN_CTRL = 8;     // Agarra un FTS
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'hA8;
    IN_IDL = 8'h0A;
    #1000
    IN_CTRL = 9;     // Agarra un IDL
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'hAE;
    //
    IN_CTRL = 0;      // Agarra un TLP
    IN_TLP = 8'hFF;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 1;      // Agarra un COM
    IN_TLP = 8'h0A;
    IN_COM = 8'hF2;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 2;      // Agarra un PAD
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'hC7;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 3;     // Agarra un TLP
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'hAC;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 4;     // Agarra un STP
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'hAA;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 5;     // Agarra un SDP
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'hE5;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 6;     // Agarra un END
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'hF6;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 7;     // Agarra un EDB
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'hDF;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;
    #1000
    IN_CTRL = 8;     // Agarra un FTS
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'hA8;
    IN_IDL = 8'h0A;
    #1000
    IN_CTRL = 9;     // Agarra un IDL
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'hAE;
    //
    IN_CTRL = 0;      // Agarra un TLP
    IN_TLP = 8'hFF;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 1;      // Agarra un COM
    IN_TLP = 8'h0A;
    IN_COM = 8'hF2;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 2;      // Agarra un PAD
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'hC7;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 3;     // Agarra un TLP
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'hAC;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 4;     // Agarra un STP
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'hAA;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 5;     // Agarra un SDP
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'hE5;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 6;     // Agarra un END
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'hF6;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 7;     // Agarra un EDB
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'hDF;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;
    #1000
    IN_CTRL = 8;     // Agarra un FTS
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'hA8;
    IN_IDL = 8'h0A;
    #1000
    IN_CTRL = 9;     // Agarra un IDL
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'hAE;
    //
    IN_CTRL = 0;      // Agarra un TLP
    IN_TLP = 8'hFF;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 1;      // Agarra un COM
    IN_TLP = 8'h0A;
    IN_COM = 8'hF2;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 2;      // Agarra un PAD
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'hC7;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 3;     // Agarra un TLP
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'hAC;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 4;     // Agarra un STP
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'hAA;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 5;     // Agarra un SDP
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'hE5;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 6;     // Agarra un END
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'hF6;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;

    #1000
    IN_CTRL = 7;     // Agarra un EDB
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'hDF;
    IN_FTS = 8'h0A;
    IN_IDL = 8'h0A;
    #1000
    IN_CTRL = 8;     // Agarra un FTS
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'hA8;
    IN_IDL = 8'h0A;
    #1000
    IN_CTRL = 9;     // Agarra un IDL
    IN_TLP = 8'h0A;
    IN_COM = 8'h0A;
    IN_PAD = 8'h0A;
    IN_SKP = 8'h0A;
    IN_STP = 8'h0A;
    IN_SDP = 8'h0A;
    IN_END = 8'h0A;
    IN_EDB = 8'h0A;
    IN_FTS = 8'h0A;
    IN_IDL = 8'hAE;
    // 
    #1000 $finish;
  end

endmodule
