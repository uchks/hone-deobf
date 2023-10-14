# Hone Deobfuscated

This repository contains batch files originally sourced from the [Hone Discord Server](https://discord.gg/Hone), which have been "deobfuscated". <br>
For instance, the file named `Anti-Tracking.cmd` fetches another script through Powershell:

```bash
powershell Invoke-WebRequest "https://cdn.discordapp.com/attachments/798652558351794196/870846920778735636/DEOBANTITRACK.cmd" -OutFile "%temp%\DEOBANTITRACK.cmd" >nul 2>&1
```

The fetched `DEOBANTITRACK.cmd` utilizes `certutil` to encode their final script, outputting it like so:

```bash
CERTUTIL -f -decode "%~f0" "%Temp%\Honerandomthingthatyoudontwanttoseeipromisepleasejustgetoutofhere.bat" >nul 2>&1
```

This produces `Honerandomthingthatyoudontwanttoseeipromisepleasejustgetoutofhere.bat` in your temporary directory, which is essentially the `Anti-Tracking.cmd` file.

## Dealing with "Obfuscation"

The script includes a layer of "obfuscation" consisting of a series of characters, notably in the format:

```
FF FE 26 63 6C 73 0D 0A FF FE 26 63 6C 73 0D 0A FF FE 26 63 6C 73 0D 0A FF FE 26 63 6C 73 0D 0A FF FE 26 63 6C 73 0D 0A FF FE 26 63 6C 73 0D 0A FF FE 26 63 6C 73 0D 0A FF FE 26 63 6C 73 0D 0A
```
Or when translated:
```
ÿþ&cls ÿþ&cls ÿþ&cls ÿþ&cls ÿþ&cls ÿþ&cls ÿþ&cls ÿþ&cls
```

You can remove this layer of "obfuscation" using a hex editor like HxD. Once removed, the actual script is revealed. <br>
This deobfuscation method is applicable to the batch files as of August 2nd, 2021.

## Credits
This "challenge" is presented by **323170806190440449 / jonathah#1221**.

![jonathah Image](https://user-images.githubusercontent.com/38664452/127923379-ae67a1c6-e42c-4379-b675-fb3568225f16.png)
