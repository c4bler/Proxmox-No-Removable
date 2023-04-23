$location = "HKLM:\SYSTEM\CurrentControlSet\Enum\PCI"
$ourRegKeys = Get-ChildItem $location

ForEach ($regKey in $ourRegKeys){
    $ourSubKeys = Get-ChildItem -Path $regKey.PSPath
    
    ForEach ($subKey in $ourSubKeys){
        $capValue = $subKey.GetValue("Capabilities")
        if ($capValue -is [int] -and $capValue -gt 0){
            $binValue = [convert]::ToString([int32]$capValue,2).PadLeft(8,'0')
            if (($binValue -band 4) -ne '0'){
                $newCapValue = $capValue - 4
                Set-ItemProperty -Path $subKey.PSPath -Name "Capabilities" -Value $newCapValue
                Write-Host "Setting $($subKey) to no longer appear as a removable device ('$($capValue)' ==> '$($newCapValue)')"
            }
        }
    }    
}
