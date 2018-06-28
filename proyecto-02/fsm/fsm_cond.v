module fsm_cond (
  // Entradas de la máquina de estados
  input wire CLK,
  input wire sReset,
  input wire sInit,
  input wire [3:0] sEmpty,
  input wire [3:0] sFull,
  input wire [3:0] sPause,
  input wire [3:0] sContinue,

  // Salidas de la máquinas de estados
  output reg oInit,
  output reg oIdle,
  output reg [3:0] oError,
  output reg [3:0] stbPause,
  output reg [3:0] stbContinue,

  output reg [7:0] State, nState
  );

  // Variables auxiliares de la maquina de estados
  reg [3:0] pausa, continuar;
  reg [7:0] state, nextState;

  // Declaración de los estados
  parameter [7:0] steReset = 8'd0,
                  steInit = 8'd2,
                  steIdle = 8'd4,
                  steActive = 8'd8,
                  stePause = 8'd16,
                  steContinue = 8'd32,
                  // steError = 8'd128;
                  stePauCont = 8'd64,
                  steError = 8'd128;

  // Lógica combinacional
  always @ ( * ) begin
    case (state)
        steReset:
        begin
          if (!sReset) begin
            nextState = steReset;
          end else begin
            nextState = steInit;
          end
        end
      steInit:
        begin
          if (sInit) begin
            nextState = steInit;
          end else begin
            nextState = steIdle;
          end
        end

      steIdle:
        begin
          if (&(sEmpty)) begin
            nextState = steIdle;
          end else begin
            nextState = steActive;
          end
        end

      steActive:
        begin
          if(|sPause && |sContinue && sPause!=pausa && sContinue!=continuar) begin
            nextState = stePauCont;
          end else if (|sPause && sPause != pausa) begin
            nextState = stePause;
          end else if (|sPause && sPause != pausa) begin
            nextState = stePause;
          end else if (|sContinue && sContinue != continuar) begin
            nextState = steContinue;
          end else if (|(sFull)) begin
            nextState = steError;
          end else begin
            nextState = steActive;
          end
        end

      stePause:
        begin
          if (|sPause && sPause != pausa) begin
            nextState = stePause;
          end else if (|sContinue && sContinue != continuar) begin
            nextState = steContinue;
          end else if(|sPause && |sContinue && sPause!=pausa && sContinue!=continuar) begin
      	    nextState = stePauCont;
          end else if (|(sFull)) begin
            nextState = steError;
          end else begin
            nextState = steActive;
          end
        end

      steContinue:
      begin
        if (|sPause && sPause != pausa) begin
          nextState = stePause;
        end else if (|sContinue && sContinue != continuar) begin
          nextState = steContinue;
        end else if(|sPause && |sContinue && sPause!=pausa && sContinue!=continuar) begin
  			  nextState = stePauCont;
        end else if (|(sFull)) begin
          nextState = steError;
        end else begin
          nextState = steActive;
        end
      end

      stePauCont:
      begin
        if(|sPause && sPause!=pausa) begin
          nextState = stePause;
        end else if(|sContinue && sContinue!=continuar) begin
          nextState = steContinue;
        end else if(|sPause && |sContinue && sPause!=pausa && sContinue!=continuar) begin
          nextState = stePauCont;
        end else if(|(sFull)) begin
          nextState = steError;
        end else begin
          nextState = steActive;
        end
      end

      steError:
        begin
          if (!sReset) begin
            nextState = steReset;
          end else begin
            nextState = steError;
          end
        end

      default:
        begin
          nextState = steInit;
        end
    endcase
  end



// Lógica para el reset
  always @ ( posedge CLK ) begin
    if (!sReset) begin
      state <= 8'd0;
    end
    else begin
      state <= nextState;
    end
  end

// Lógica de Salidas
  always @ ( posedge CLK ) begin
    if (!sReset) begin
      oInit <= 0;
      oIdle <= 0;
      oError <= 4'd0;
      stbContinue <= 4'd0;
      stbPause <= 4'd0;
      pausa <= 4'd0;
      continuar <=4'd0;
    end else begin
      oInit <= 0;
      oIdle <= 0;
      oError <= 4'd0;
      stbContinue <= 4'd0;
      stbPause <= 4'd0;
      pausa <= sPause;
      continuar <= sContinue;

      case (nextState)
        steInit:
          begin
            oIdle <= 0;
            oError <= 4'd0;
            stbContinue <= 4'd0;
            stbPause <= 4'd0;
            pausa <= sPause;
            continuar <= sContinue;
            if (sInit) begin
              oInit <= 1;
            end else begin
              oInit <= 0;
            end
          end
        steIdle:
          begin
            oInit <= 0;
            oError <= 4'd0;
            stbContinue <= 4'd0;
            stbPause <= 4'd0;
            pausa <= sPause;
            continuar <= sContinue;
            if (&(sEmpty)) begin
              oIdle <= 1;
            end else begin
              oIdle <= 0;
            end
          end
        stePause:
          begin
            oInit <= 0;
            oIdle <= 0;
            oError <= 4'd0;
            stbContinue <= 4'd0;
            if (sPause != pausa) begin
              stbPause <= sPause;
            end else begin
              stbPause <= 4'd0;
            end
            pausa <= sPause;
            continuar <= sContinue;
          end

        steContinue:
          begin
            oInit <= 0;
            oIdle <= 0;
            oError <= 4'd0;
            stbPause <= 4'd0;
            if (sContinue != continuar) begin
              stbContinue <= sContinue;
            end else begin
              stbContinue <= 4'd0;
            end
            pausa <= sPause;
            continuar <= sContinue;
          end

        stePauCont:
          begin
            oInit <= 0;
            oIdle <= 0;
            oError <= 4'd0;
            if (sContinue != continuar && sPause != continuar) begin
              stbPause <= sPause;
              stbContinue <= sContinue;
              end else begin
              stbPause <= 4'd0;
              stbContinue <= 4'd0;
            end
            continuar <= sContinue;
            pausa <= sPause;
          end

        steError:
          begin
            oInit <= 0;
            oIdle <= 0;
            oError <= 4'd0;
            stbPause <= 4'd0;
            stbContinue <= 4'd0;
            pausa <= sPause;
            continuar <= sContinue;
            if (|sFull) begin
              oError <= sFull;
            end else begin
              oError <=  4'd0;
            end
          end
        default:
          begin
            oInit <= 0;
            oIdle <= 0;
            oError <= 4'd0;
            stbPause <= 4'd0;
            stbContinue <= 4'd0;
            pausa <= sPause;
            continuar <= sContinue;
          end
      endcase
    end
  end

  always @ ( * ) begin
    State = state;
    nState = nextState;
  end

endmodule
