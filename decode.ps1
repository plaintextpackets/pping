# Define the path to the PCAP file
$pcapFilePath = "capture.pcap"
# Define the output path for the decoded message
$outputFilePath = "decodedmessage.txt"

# Path to tshark.exe - adjust if necessary
$tsharkPath = "C:\Program Files\Wireshark\tshark.exe"

# Extracting packet lengths for ICMP type 8 (echo request) messages
$packetSizes = & $tsharkPath -r $pcapFilePath -Y "icmp.type == 8" -T fields -e data.len

# Initialize an empty string for the decoded message
$decodedMessage = ""

foreach ($size in $packetSizes) {
    if ($size -match '^\d+$') { # Ensure the size is a number
        # Convert the packet size back to an ASCII value
        $asciiValue = $size - 128
        if ($asciiValue -ge 0 -and $asciiValue -le 127) {
            # Append the decoded character to the message
            $decodedMessage += [char]$asciiValue
        } else {
            Write-Output "Invalid ASCII value: $asciiValue for packet size: $size"
        }
    }
}

# Output the decoded message to a file
$decodedMessage | Out-File $outputFilePath

Write-Output "Decoded message saved to $outputFilePath"
