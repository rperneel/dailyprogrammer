$services = Get-Service "SOMESTRING*" | Where-Object { $_.Status -eq "Running" }
if ($services) {
  foreach ($service in $services) {
    # kill the process for this service
    $id = Get-WmiObject -Class win32_service -Filter "name = '$($service.Name)'"
    Write-Output "Killing PID $id for $($service.Name)"
    Stop-Process -Id $id -Force
  }
}