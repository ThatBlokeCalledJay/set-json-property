Trace-VstsEnteringInvocation $MyInvocation 

$jsonFile  = Get-VstsInput -Name JsonFile -Require
$propertyPath  = Get-VstsInput -Name PropertyPath -Require
$propertyValue = Get-VstsInput -Name PropertyValue -Require

Write-Output "JSONFile             : $($jsonFile)"
Write-Output "PropertyPath         : $($propertyPath)"
Write-Output "PropertyValue        : $($propertyValue)"

Write-Host "=============================================================================="

# ---------------------------------------------------------------- Validate 

if(!([System.IO.File]::Exists($jsonFile))){
    Write-Error "Your json file cannot be found at the specified location: $($jsonFile)"
    exit 0
}

if ($null -eq $propertyPath -or $propertyPath.length -lt 1) {
    Write-Error "Please specify a property path."
    exit 0
}

# ---------------------------------------------------------------- Parse

$jsonInput = Get-Content $jsonFile | Out-String | ConvertFrom-Json

$currentValue = Invoke-Expression "`$jsonInput.$propertyPath" 

if($null -eq $currentValue){
    Write-Warning "The current value at path '$($propertyPath)' is null. This indicates the property may not exist.";
}else{
    Write-Host "Current value at '$($propertyPath)': '$currentValue'";
}

Write-Host "Replacing '$($currentValue)' with '$($propertyValue)' at '$($propertyPath)'"

# ---------------------------------------------------------------- Update

try {
    Invoke-Expression "`$jsonInput.$propertyPath = `$propertyValue"
}
catch {
    Write-Error "Sorry about that old bean. It seems there is a problem setting a value at '$($propertyPath)'. Please check to ensure this path exists.";
    exit 0;
}

# ---------------------------------------------------------------- Save

Write-Host "Writing updated json back to file: '$($jsonFile)'"

$jsonOutput = $jsonInput  | ConvertTo-Json -Depth 50 -Compress |  ForEach-Object { [System.Text.RegularExpressions.Regex]::Unescape($_) }

Set-Content -Path $jsonFile -Value $jsonOutput

Write-Host "Update complete."
