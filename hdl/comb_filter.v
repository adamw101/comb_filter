module comb_filter (input ADC_SCLK,
input ADC_CS_N,
input ADC_SADDR,
input ADC_SDAT,
output [7:0] dac_out
);
reg [15:0] spi_data;
reg [5:0] data_counter =0;
reg [15:0] data_matrix [100:0] =0;
  always @(negedge ADC_SCLK) begin
    if (!ADC_CS_N) begin
        spi_data <= {ADC_SDAT,spi_data[14:0]};
        if (data_counter < 16) begin
            data_counter <= data_counter+1;
        end
        else begin
            data_counter <=0;
        end
    end
    else begin
        data_counter <=0;
        spi_data <=0;
    end
  end

always @(data_counter ==0) begin
    data_matrix <= {spi_data,data_matrix[99:0 ]};
end
endmodule