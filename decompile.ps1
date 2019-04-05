$files = Get-ChildItem compiled -Recurse -Include *.qb -Exclude keyboard.qb,SK6Ped_UniqueStateLogic.qb,Sk4_PedAnim.qb

foreach ($file in $files)
{
	$outdir = $file.DirectoryName.Replace("compiled", "decompiled")
	$outfile = "$($outdir)\$($file.Basename).txt"
	New-Item -ItemType Directory -Force -Path $outdir | Out-Null
	echo "Decompiling into $($outfile)"
	.\QB2.1.exe -d $file.FullName | Out-File -Encoding ASCII $outfile
}