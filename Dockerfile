FROM ubuntu:20.04 AS builder
RUN apt update && apt install unzip -y 
ADD https://github.com/nopSolutions/nopCommerce/releases/download/release-4.50.2/nopCommerce_4.50.2_NoSource_linux_x64.zip /nop 
RUN cd nop && unzip nopCommerce_4.50.2_NoSource_linux_x64.zip && rm -rf nopCommerce_4.50.2_NoSource_linux_x64.zip

