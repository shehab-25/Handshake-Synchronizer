# Handshake-Synchronizer
The Handshake Synchronizer is a reliable circuit used to safely transfer control signals or data between two different clock domains in digital systems. Unlike single-bit synchronizers that risk metastability when dealing with multi-bit or control signals, the handshake method ensures robust communication by establishing a request-acknowledge protocol.

# Features:
Safe clock domain crossing using a two-phase handshake protocol

Eliminates metastability issues associated with asynchronous communication

Suitable for data transfer and control signaling between different clock domains

Parameterized and modular design for easy integration

# How it works:
The source domain asserts a req (request) signal to initiate communication.

The destination domain detects the request, processes it, and then asserts an ack (acknowledge) signal.

The source waits for the ack before completing the handshake and de-asserting the req.

The destination detects the falling edge of req and de-asserts ack, completing the handshake cycle.

This ensures that both sides are synchronized and no data/control signal is lost or misinterpreted due to timing issues.

## How to Run
1. Clone the repository
2. Open Vivado and load the project
3. Run the design flow:
      Synthesize the design.
      Implement the design.
      Generate the bitstream.
4. Simulation:
       use the Questasim to run simulation easily.

## Contact Me!
- **Email:** shehabeldeen2004@gmail.com
- **LinkedIn:** (https://www.linkedin.com/in/shehabeldeen22)
- **GitHub:** (https://github.com/shehab-25)
