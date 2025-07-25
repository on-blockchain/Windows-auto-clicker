# Windows-auto-clicker
Left Click mouse auto clicker for Windows

# How to use:

1- Open PowerShell as Administrator and paste the following command:  
`Set-ExecutionPolicy RemoteSigned`  
This will allow you to run scripts that are either locally created or signed by a trusted publisher.

2- Download `autoclicker.ps1`. You can edit it using notepad.

3- You can customize both the minimum and maximum click rates, and the sleep time is randomized to help avoid detection by auto-clicker detectors.

4- Open PowerShell again, and run `autoclicker.ps1`, then switch to your browser and position your mouse accordingly.

5- To stop the script, go back to PowerShell and press `Ctrl + C`, you might have to press it several times cause of the auto clicks.

6- (Optional) If you are running it inside a VirtualBox VM, like I am, run the script and minimize the VM using:  
`Ctrl + M`.

7- You can reverse `Set-ExecutionPolicy RemoteSigned` from #1 by entering `Set-ExecutionPolicy Restricted`.
