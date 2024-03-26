# PSPing - Ping Data Exfiltration using Powershell

This project demonstrates a novel way to transmit data using ICMP packets by encoding and decoding data with ping packet sizes using PowerShell. This tool does not require administrative access to machines which allow Powershell and ping. It includes two main components: an encoder script (psping.ps1) for sending data and a decoder script (decode.ps1) for receiving and decoding it.

## Getting Started

To get started with this project, on the sender machine you'll need a Windows system with PowerShell

On the receiver machine, you'll need Wireshark or tshark for packet capture and PowerShell to decode

I've included a sample PCAP file to decode 'capture.pcap', but if you are doing this yourself replace this file

### Installation

1. Clone or download this repository to your local machine.
2. Make sure you have tshark installed or Wireshark and ensure it's accessible from your system's PATH. Adjust the scripts if you need to specify the full path to tshark.
3. Update the scripts (psping.ps1 and decode.ps1) with the correct file paths and destination IP address as necessary.

### Usage Instructions

Encoding and Sending Data:

1. Prepare the file you wish to send and ensure it's in the same directory as psping.ps1, or update the script with the file's location.
2. Execute psping.ps1 using PowerShell to send the file. The script encodes the data into ping packet sizes and sends them to the target IP.

Capturing and Decoding Data:

1. On the receiving end, start a packet capture to save incoming ICMP packets into a .pcap file.
2. Run decode.ps1 with PowerShell, pointing it to the .pcap file. The script will decode the packet sizes back into the original data and reconstruct the file.
