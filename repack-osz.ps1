param (
  [Parameter(Mandatory=$true)][string]$source,
  [Parameter(Mandatory=$true)][string]$destination
)

$sources = Get-ChildItem -Path $source -Directory

Add-Type -assembly "system.io.compression.filesystem"

Foreach ($s in $sources)
{
  $finalDestination = Join-path -path $destination -ChildPath "$($s.name).osz"
  
  If(Test-path $finalDestination) {Remove-item $finalDestination}
  [io.compression.zipfile]::CreateFromDirectory($s.fullname, $finalDestination)
}