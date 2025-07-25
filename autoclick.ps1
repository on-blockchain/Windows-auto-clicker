# Set the random range for clicks per second (between 1 and 4)
$minClicksPerSecond = 2
$maxClicksPerSecond = 8

# Start the click simulation loop
while ($true) {
    # Randomly pick clicks per second between 1 and 4
    $clicksPerSecond = Get-Random -Minimum $minClicksPerSecond -Maximum ($maxClicksPerSecond + 1)
    $delay = 1000 / $clicksPerSecond  # Convert to milliseconds for Thread.Sleep

    # Load the user32.dll to simulate mouse events
    Add-Type @"
using System;
using System.Runtime.InteropServices;
public class MouseEvent {
    [DllImport("user32.dll")]
    public static extern void mouse_event(uint dwFlags, int dx, int dy, uint dwData, UIntPtr dwExtraInfo);
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern bool SetCursorPos(int x, int y);
}
"@

    # Define constants for mouse events
    $MOUSEEVENTF_LEFTDOWN = 0x02
    $MOUSEEVENTF_LEFTUP = 0x04

    # Load System.Windows.Forms assembly for cursor position
    Add-Type -AssemblyName "System.Windows.Forms"

    # Get the current mouse position
    $cursorPos = [System.Windows.Forms.Cursor]::Position
    $x = $cursorPos.X
    $y = $cursorPos.Y

    # Simulate mouse click at the current cursor position
    [MouseEvent]::mouse_event($MOUSEEVENTF_LEFTDOWN, 0, 0, 0, [UIntPtr]::Zero)
    [MouseEvent]::mouse_event($MOUSEEVENTF_LEFTUP, 0, 0, 0, [UIntPtr]::Zero)

    # Generate a random sleep time (in milliseconds)
    # Random delay within ±25% of the calculated average delay
    $randomDelay = $delay + (Get-Random -Minimum (-$delay * 0.25) -Maximum ($delay * 0.25))

    # Sleep for the random delay
    [System.Threading.Thread]::Sleep([math]::Round($randomDelay))
}
