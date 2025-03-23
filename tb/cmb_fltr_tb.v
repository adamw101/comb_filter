`timescale 1ns/1ps

module cmb_fltr_tb ();
   
   
parameter T =10;
reg clk =0; 
reg [15:0]spi_input[4:0]={16'habcd,16'h1437,16'haa44,16'8787};
reg ADC_SCLK;
reg ADC_CS_N;
reg ADC_SADDR;
reg ADC_SDAT;
reg [7:0] dac_out;

  comb_filter cf(
  .ADC_SCLK(ADC_SCLK),
  .ADC_CS_N(ADC_CS_N),
  .ADC_SADDR(ADC_SADDR),
  .ADC_SDAT(ADC_SDAT),
  .dac_out(dac_out)
  );

    always @(#T/2) clk = ~clk;

    always @(posedge clk) begin
        
    end
endmodule