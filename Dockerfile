FROM ubuntu:20.04 AS builder
RUN apt update && apt install unzip -y 
ADD https://github.com/nopSolutions/nopCommerce/releases/download/release-4.50.2/nopCommerce_4.50.2_NoSource_linux_x64.zip /nop/nopCommerce_4.50.2_NoSource_linux_x64.zip
RUN cd /nop && unzip nopCommerce_4.50.2_NoSource_linux_x64.zip && rm -rf nopCommerce_4.50.2_NoSource_linux_x64.zip


FROM mcr.microsoft.com/dotnet/aspnet:5.0
COPY --from=builder /nop /nop-new
EXPOSE 80
WORKDIR /nop-new 
CMD [ "dotnet", "/nop-new/Nop.Web.dll" ] 


