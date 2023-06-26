# Create the root directory
New-Item -ItemType Directory -Force -Path Home

# Create the "Departments" subdirectory
New-Item -ItemType Directory -Force -Path Home\Departments

# Create the "HR", "Accounting", "Public", "IT", and "Operations" subdirectories
New-Item -ItemType Directory -Force -Path Home\Departments\HR
New-Item -ItemType Directory -Force -Path Home\Departments\Accounting
New-Item -ItemType Directory -Force -Path Home\Departments\Public
New-Item -ItemType Directory -Force -Path Home\Departments\IT
New-Item -ItemType Directory -Force -Path Home\Departments\Operations

# Set owner permissions for the groups IT, HR, Operations, and Accounting
$groups = @("IT", "HR", "Operations", "Accounting")
foreach ($group in $groups) {
    icacls Home\Departments\$group /grant $group:F
}

# Create the users AmyIT, PamOps, MandyAcct, and TimHR
New-User -Name AmyIT -Group IT
New-User -Name PamOps -Group HR
New-User -Name MandyAcct -Group Accounting
New-User -Name TimHR -Group IT

# Give the users read/write/execute permissions in their respective departmental folders
$users = @("AmyIT", "PamOps", "MandyAcct", "TimHR")
foreach ($user in $users) {
    icacls Home\Departments\$user\ /grant $user:F
}

# Explain the syntax for non-technical management
"This script creates the directories Home\Departments, Home\Departments\HR, Home\Departments\Accounting, Home\Departments\Public, Home\Departments\IT, and Home\Departments\Operations. It also sets owner permissions for the groups IT, HR, Operations, and Accounting. Finally, it creates the users AmyIT, PamOps, MandyAcct, and TimHR and gives them read/write/execute permissions in their respective departmental folders."
