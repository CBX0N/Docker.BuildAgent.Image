# CBXON (On-Premise) Build Agent Docker Host Image
# For creating multiple containerised on-prem build agents for Azure DevOps pipelines.
FROM azuredevopsbaseagent:latest AS base
WORKDIR /temp
COPY localVSlayout.zip .
RUN powershell -Command "Expand-Archive -Path 'localVSlayout.zip' -DestinationPath 'C:\localVSlayout'"
COPY Install-BuildTools.ps1 /localVSlayout/Install-BuildTools.ps1

FROM azuredevopsbaseagent:latest
LABEL maintainer "CBXON"

COPY --from=base /localVSlayout /localVSlayout
WORKDIR /localVSlayout
RUN powershell -Command ".\Install-BuildTools.ps1"

WORKDIR /azp
CMD powershell .\start.ps1