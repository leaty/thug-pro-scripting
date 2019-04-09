# THUG Pro Scripting
Tools and workflow for scripting THUG Pro.

*This does not include adding completely new animations/custom maps or other graphical things*.

## Todo
* Write CLI tool for extracting/importing into PRX files and remove linked dependency of PreTool.
* Write Auto Merger which will attempt to merge modded files with updated versions and automatically import them into the new PRX.
* Deprecate updt.dll and replace with a better way of disabling updates

## Prerequisites
1. Download http://www.mediafire.com/file/dr4ghaaica9l1ir/QuazzScriptTools.zip
2. Download http://www.mediafire.com/file/nszrchf4glxd364/PreTool1_1.zip
3. Place roq.exe into this directory.
4. Extract PreTool1_1.zip and place PreTool.exe & PreTool.exe.config into this directory.

## Explanation
The code for a lot in THPS games is written in a custom Neversoft bytecode language. THUG Pro devs *might* have better tools for modding than we do, but in that case they are closed source. Below is a brief explanation on things you need to know to get started with scripting THUG Pro.

#### PRE/PRX Files
These files are really just archives of... code? Probably other things too, I haven't looked too deep into it. Think of it like a compressed .tar archive. Both THUG Pro and THUG2 standalone (probably other titles) loads these when running the game.

#### PreTool (PreTool.exe)
Can extract/import and replace files from PRE/PRX.

#### QB Binaries
These are generally compiled script files, think .dll files for example. They exist within PRE/PRX files.

#### ROQ Compiler (roq.exe)
Compiles and decompiles QB Binaries.

#### Blub Syntax
*Something weird...*

*Yeah, just something weeeeird.*

*No but for real though what kind of syntax is this??*

This is the language you will be writing when scripting, as the ROQ compiler decompiles to and compiles from this *weird* thing. How to write code in this language? Well, try using that *weird* code in front of your face to your advantage. That, and this might come in handy http://www.thps-mods.com/forum/viewtopic.php?f=22&t=806

## Tutorial

### Extract PRE/PRX
1. Open PreTool.exe
2. Browse Pre File Input and point it to e.g. "THUG Pro\data\pre\thugpro_qb.prx"
3. Press Load File.
4. Right click left pane and select Extract All.
5. Traverse to the extracted folder and go into qb dir.
6. Copy everything inside the qb dir and paste into ***compiled*** dir.

### Decompile
1. Open Windows ~~Power~~Rotten~~Shell~~Hell and cd to this repo.
2. `> .\decompile.ps1`
3. If you get an error message saying you're not allowed to run PowerShell scripts, even as Administrator. *WHERE'S MY FUCKING SUDO?* https://tecadmin.net/powershell-running-scripts-is-disabled-system/
3. Done, code files now exist in decompiled directory as .txt files.
4. Also, be careful to backup the decompiled directory after changing the code before running *decompile.ps1* again. Both .ps1 scripts will force overwrite.

### Basic code example
1. Open game\skater\walltricks.txt in e.g. Sublime Text.
2. Find a line like this `:i if  ($WallRide_BoostPlant_Count$ > %i(3,00000003))`
3. Replace line with `:i if  ($WallRide_BoostPlant_Count$ > %i(999999999,3b9ac9ff)) `
4. **Boom**, if you follow the next steps you'll have unlimited *(ok technically 999999999)* instead of **THREE** maximum boostplants.

I would like to note that the most interesting files so far have been:

* game\skater\physics.txt
* game\skater\airtricks.txt
* game\skater\manualtricks.txt
* game\skater\tricks.txt
* game\skater\walltricks.txt

### Recompile
1. Open Windows ~~Power~~Rotten~~Shell~~Hell and cd to this repo (unless you've already done so).
2. `> .\recompile.ps1`
3. Done! Check recompiled directory for completely new .qb files.

### Import your changes to the game
1. In PreTool, right click a file in the left pane and select Replace File.
2. Browse and select your own .qb file.
3. Donezo!

### Before you start THUG Pro
*Only has to be done once.*

1. Make a backup of *THUG Pro\updt.dll*
2. Replace with *updt.dll* in this repo.
3. Done, now the game won't patch your modded files.
4. However, once a patch is released for THUG Pro, you basically can't play online properly, so you'll have to revert *updt.dll* and patch THUG Pro. After this you need to recompile your changes, I recommend comparing your modified .txt files with the updated THUG Pro version to make sure you don't accidentally wipe something new they added. I use *Compare Side-By-Side* Sublime Text extension for this. But yeah, you could `diff` if you're on linux.

## To my dear Linux Users
Eww, ~~Power~~Rotten~~Shell~~Hell. I agree. Actually, I hate Microsoft\**wildcard*.

If you get roq.exe and PreTool.exe running on Linux through wine (probably extremely likely), for the love of god, just rewrite my ~~Power~~Rotten~~Shell~~Hell scripts or I won't sleep at night.

## Credit
* http://www.mediafire.com/file/nszrchf4glxd364/PreTool1_1.zip by Robert Archibald aka %.gone. Found here https://thmods.com/forum/viewtopic.php?t=835
* http://www.mediafire.com/file/dr4ghaaica9l1ir/QuazzScriptTools.zip contains roq.exe by morten1337, a modified version of Roq's https://thmods.com/mod_tools/QB2.1.exe which in itself is a modified version of Blub's https://thmods.com/mod_tools/qb.zip which adds e.g. automatic checksum name generation. Uploaded by Quazz, also found here https://thmods.com/forum/viewtopic.php?t=835
* updt.dll from *THUG Pro Plus* mod, I don't know who made it though