# Use a .NET Framework SDK image that supports RDP or can have it enabled
FROM mcr.microsoft.com/dotnet/framework/sdk:4.8-windowsservercore-ltsc2019

# Set up RDP
# Note: The user 'ContainerAdministrator' is the default user in this base image.
RUN powershell -Command \
    Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -Value 0; \
    Enable-NetFirewallRule -DisplayGroup "Remote Desktop"; \
    net user ContainerAdministrator "AdminP@ssw0rd!"

WORKDIR /app

COPY . .

RUN msbuild "Jantar dos Filosofos.sln" /p:Configuration=Release

EXPOSE 3389

# Keep container running for RDP.
# Start Remote Desktop Service and then open PowerShell to keep the container alive.
CMD powershell -NoProfile -Command "Start-Service TermService; powershell"