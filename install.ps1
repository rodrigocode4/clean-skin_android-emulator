
$files = Get-ChildItem "$env:LOCALAPPDATA\Android\Sdk\skins\pixel_4\*" | 
Sort-Object -Property {
  if ($_.Name -contains ".old") {$_}
}
$isFileNotExists = [bool]0
foreach ($file in $files) {
  if ($file.BaseName -Contains ".old") {
    $global:isFileNotExists = [bool]1
    break
  }

  Rename-Item -Path $file $newFileName
}

if ($global:isFileNotExists) {
  Copy-Item -Path ".\pixel_4\*" -Destination "$env:LOCALAPPDATA\Android\Sdk\skins\pixel_4\" -Recurse
} else {
  Write-Output "Backup Existente"
}