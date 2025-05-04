# PowerShell script to start both frontend and backend servers
Write-Host "EWS-DDoSNet - Development Environment" -ForegroundColor Cyan
Write-Host "----------------------------------------" -ForegroundColor Cyan
Write-Host "Starting development servers..." -ForegroundColor Yellow

# Define current directory
$projectRoot = $PSScriptRoot
$frontendPath = "$projectRoot\frontend"
$backendPath = "$projectRoot\backend"

# Start backend server
Write-Host "Starting backend server (Flask)..." -ForegroundColor Blue
Start-Process -FilePath "powershell" -ArgumentList "-ExecutionPolicy Bypass -Command cd '$backendPath'; python app.py"

# Wait for backend to initialize
Start-Sleep -Seconds 3

# Start frontend server
Write-Host "Starting frontend server (React)..." -ForegroundColor Green
Start-Process -FilePath "powershell" -ArgumentList "-ExecutionPolicy Bypass -Command cd '$frontendPath'; npm start"

Write-Host "`nApplication is now running:" -ForegroundColor Cyan
Write-Host "- Frontend: http://localhost:3000" -ForegroundColor White
Write-Host "- Backend:  http://localhost:5000" -ForegroundColor White
Write-Host "`nClose the terminal windows to stop the servers." -ForegroundColor Yellow
Write-Host "`nNOTE: This window can be closed, the application will continue running in the other windows." -ForegroundColor Gray 