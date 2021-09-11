

$csv=$args[0]
# $csv="table.csv"
# table.csv
$desPath=$args[1]
# $desPath = "/Users/krongkanm/Works/test/woe/"
# format /Users/krongkanm/Works/test/

$jsonObj = Get-Content -path $csv |  ConvertFrom-Csv  | ConvertTo-Json  | ConvertFrom-Json 
$start = "./";
$data = $jsonObj | Sort-Object "id"
$dir = New-Object System.Collections.Generic.List[System.object]

For ($index = 0; $index -lt $jsonObj.Length; $index++) {
    $obj = $data[$index] 
    $path = $obj;

    if ($index -gt 0) {
        $pa = $data[$index - 1].id -eq $data[$index].parent;
            
        if ($pa) {
            $dir.Add($path);
        }
        else {
            $idx = $dir.FindIndex( { $args[0].id -eq $path.parent } ) 
            if ($idx -gt -1) {
                $dir = [System.Collections.Generic.List[System.object]]($dir[0..$idx])
                $dir.Add($path);
            }
        }
    }
    else {
        $dir.Add($path);
    }
    
    # Write-Output $dir
    $arr = [System.Collections.ArrayList]@()
    $arr = $dir |   ForEach-Object { $_.name }
    #$full = $arr -join "/";
	$full = $arr -join "\";
    # Write-Host "Please Provide Proper Log Path"
    # Write-Output $full
    $desName = $desPath  + $full;
	#Write-Output $desName
	
	
	try {
        If (!(Test-Path  $desName)) {
            #Write-Output "FROM FUNCTION"
			#Write-Output $desName
			New-Item -Path $desName -ItemType "directory" -Force
        }
    }
    catch {
        Get-Error reporting/logging
    }
	#New-Item -Path $desName -ItemType "directory" -Force
    #CreateFolder $desName
    #$start = $data[$index].copyFrom+"/"  + "/*.txt"
    #$start = $data[$index].copyFrom + "/*.txt"	
   # Write-Output $start
   # Copy-Item -Path $start  -Destination  $desName

}
function CreateFolder([string]$folderName) { 
#function CreateFolder([object]$folderName) {  

    try {
        #If (!(Test-Path  $folderName)) {
            Write-Output "FROM FUNCTION"
			Write-Output $folderName
			New-Item -Path $folderName -ItemType "directory" -Force
       # }
    }
    catch {
        Get-Error reporting/logging
    }

}


