powershell -command 'C:\localVSlayout\vs_BuildTools.exe --noweb --quiet `
--add "Microsoft.VisualStudio.Component.Roslyn.Compiler" `
--add "Microsoft.Component.MSBuild" `
--add "Microsoft.VisualStudio.Component.CoreBuildTools" `
--add "Microsoft.VisualStudio.Workload.MSBuildTools" `
--add "Microsoft.VisualStudio.Component.TestTools.BuildTools"'

$tp = Test-Path 'C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\IDE\Extensions\TestPlatform\vstest.console.exe'

while($tp -eq $false){
    Start-Sleep -Seconds 5
    $tp = Test-Path 'C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\IDE\Extensions\TestPlatform\vstest.console.exe'
}

Write-Host "VSTest Console Found"