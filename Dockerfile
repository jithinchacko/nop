FROM ubuntu:20.04 AS builder 
RUN apt update && apt install wget -y && apt install unzip -y 
ADD https://github.com/nopSolutions/nopCommerce/releases/download/release-4.50.2/nopCommerce_4.50.2_NoSource_linux_x64.zip /nop/nopCommerce_4.50.2_NoSource_linux_x64.zip
RUN cd nop
RUN unzip nopCommerce_4.50.2_NoSource_linux_x64.zip


FROM mcr.microsoft.com/dotnet/aspnet:5.0
RUN --FROM builder cd /nop
EXPOSE 80
CMD ["dotnet", "Nop.Web.dll"]
