module handshake_sync_tb ();
    // signal declaration
    parameter BUS_WIDTH = 8;
    reg clk_tx,clk_rx,rst_tx,rst_rx;
    reg [BUS_WIDTH-1:0] tx_data;
    wire [BUS_WIDTH-1:0] rx_data;
    // module instantiation
    handshake_sync#(BUS_WIDTH) handshake_sync_DUT(clk_tx,clk_rx,rst_tx,rst_rx,tx_data,rx_data);

    // clock generation
    initial begin
        clk_tx= 0;
        forever begin
            #2 clk_tx = ~clk_tx;
        end
    end

    initial begin
        clk_rx = 0;
        forever begin
            #1 clk_rx = ~clk_rx;
        end
    end
    initial begin
        // initialize design
        rst_tx = 1;
        rst_rx = 1;
        tx_data = 8'b10101111;
        #32
        rst_tx = 0;
        rst_rx = 0;
        tx_data = 8'b10011001;
        #32;
        tx_data = 8'b11111111;
        #32
        tx_data = 8'b10011000;
        #32
        tx_data = 8'b11001100;
        #32
        tx_data = 8'b00001111;
        #10
        tx_data = 8'b00000000;
        #6
        tx_data = 8'b10001000;
        #60
        $stop;
    end
endmodule