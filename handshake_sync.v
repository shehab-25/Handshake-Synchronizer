module handshake_sync (clk_tx,clk_rx,rst_tx,rst_rx,tx_data,rx_data);
    parameter BUS_WIDTH = 8;
    input clk_tx,clk_rx,rst_tx,rst_rx;
    input [BUS_WIDTH-1:0] tx_data;
    output reg [BUS_WIDTH-1:0] rx_data;
    reg req,req_flopped1,req_flopped2 , EN_tx;
    reg ack,ack_flopped1,ack_flopped2 , EN_rx;
    reg [BUS_WIDTH-1:0] tx_data_flopped;

    // TX Source
    always @(posedge clk_tx , posedge rst_tx) begin
        if (rst_tx) begin
            tx_data_flopped <= 0;
            req <= 0;
            EN_tx <= 1;
        end
        else begin
            if (!ack_flopped2) begin
                req <= 1;
                EN_tx <= 0;
            end
            else if(ack_flopped2) begin
                req <= 0;
                EN_tx <= 1;
            end
            if (EN_tx && !req) begin
                tx_data_flopped <= tx_data;
            end
        end
    end

    // handshake synchronizer (request)
    always @(posedge clk_rx , posedge rst_rx) begin
        if (rst_rx) begin
            req_flopped1 <= 0;
            req_flopped2 <= 0;
        end
        else begin
            req_flopped1 <= req;
            req_flopped2 <= req_flopped1;
        end
    end

    // handshake synchronizer (ack)
    always @(posedge clk_tx , posedge rst_tx) begin
        if (rst_tx) begin
            ack_flopped1 <= 0;
            ack_flopped2 <= 0;
        end
        else begin
            ack_flopped1 <= ack;
            ack_flopped2 <= ack_flopped1;
        end
    end

    // RX Destination
    always @(posedge clk_rx , posedge rst_rx) begin
        if (rst_rx) begin
            rx_data <= 0;
            ack <= 0;
            EN_rx <= 0;
        end
        else begin
            if(req_flopped2 && !EN_rx) begin
                ack <= 1;
                EN_rx <= 1;
                rx_data <= tx_data_flopped;
            end
            else if(!req_flopped2) begin
                ack <= 0;
                EN_rx <= 0;
            end
        end
    end
    
endmodule