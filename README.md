<p align="center">
 <strong>Hone "Deobfuscated"</strong> </br>
</p> 

"Obfuscated" batch files from https://discord.gg/Hone, but deobfuscated (if you can call it that). It's quite simple. <br>
The original file will download another script via Powershell, we're going to use `Anti-Tracking.cmd` as an example.  <br>
`powershell Invoke-WebRequest "https://cdn.discordapp.com/attachments/798652558351794196/870846920778735636/DEOBANTITRACK.cmd" -OutFile "%temp%\DEOBANTITRACK.cmd" >nul 2>&1` - this is downloading `DEOBANTITRACK.cmd` from their Discord.
From `DEOBANTITRACK.cmd` they use certutil as an encoder for their final script. Certutil outputs this script.   <br>
`CERTUTIL -f -decode "%~f0" "%Temp%\Honerandomthingthatyoudontwanttoseeipromisepleasejustgetoutofhere.bat" >nul 2>&1` outputs `Honerandomthingthatyoudontwanttoseeipromisepleasejustgetoutofhere.bat` at your temp directory which is the `Anti-Tracking.cmd` file.   <br>
However, there's some "obfuscation", a bunch of chinese characters. You can remove it via HxD.   <br>

This is their "obfuscation":  <br>
`FF FE 26 63 6C 73 0D 0A FF FE 26 63 6C 73 0D 0A FF FE 26 63 6C 73 0D 0A FF FE 26 63 6C 73 0D 0A FF FE 26 63 6C 73 0D 0A FF FE 26 63 6C 73 0D 0A FF FE 26 63 6C 73 0D 0A FF FE 26 63 6C 73 0D 0A` **or...**  <br>
`ÿþ&cls ÿþ&cls ÿþ&cls ÿþ&cls ÿþ&cls ÿþ&cls ÿþ&cls ÿþ&cls`

Removing those characters from HxD outputs the true script, and thus the truth is revealed.

It's the same thing applied to the obfuscated scripts as of August 2nd, 2021.  <br>
This "challenge" was brought to you by **323170806190440449 / jonathah#1221**
![image](https://user-images.githubusercontent.com/38664452/127923379-ae67a1c6-e42c-4379-b675-fb3568225f16.png)
