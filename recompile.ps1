$files = Get-ChildItem decompiled -Recurse -Include *.txt

foreach ($file in $files)
{
	$outdir = $file.DirectoryName.Replace("decompiled", "recompiled")
	$outfile = "$($outdir)\$($file.Basename).qb"
	$infile = "$($file.DirectoryName)\$($file.Basename).txt.qb"
	.\roq.exe -c $file.FullName
	New-Item -ItemType Directory -Force -Path $outdir | Out-Null
	echo "Moving file to $($outfile)"
	Move-Item -Path $infile -Destination $outfile -Force
}