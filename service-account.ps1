$UserName = $Args[0]
$Password = $Args[1]
$servicename=(gwmi win32_service).Name -match 'vstsagent*'
$svc = gwmi win32_service | Where-Object {$_.Name -eq $servicename}
$svc.StopService()
$svc.change($null,$null,$null,$null,$null,$null,$UserName,$Password,$null,$null,$null)
Restart-Service -Name $servicename -Force -Verbose
