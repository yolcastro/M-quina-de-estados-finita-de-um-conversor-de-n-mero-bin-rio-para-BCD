parameter VALOR_TESTE = 54;
module tb_binparabcd;
  logic clk, rst, start;
  logic [7:0] bin;
  logic ready, done_tick;
  logic [11:0] bcd;


  binparabcd uut(
    clk,
    rst,
    start,
    bin,
    ready,
    done_tick,
    bcd
  );

  initial begin
      $dumpfile("waveform.vcd");
      $dumpvars(0, tb_binparabcd);

      clk = 0;
      rst = 1;
      #5 rst = 0;

      bin = VALOR_TESTE;
      start = 1;

      do
      begin
        #10 clk = 1;
        start = 0;
        #10 clk = 0;
      end while (done_tick==0);

      #50 $finish;

  end
endmodule