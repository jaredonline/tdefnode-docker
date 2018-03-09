FROM debian:jessie

RUN apt-get update
RUN apt-get install -y gfortran clang wget make

RUN mkdir -p /var/src/TDEFNODE

WORKDIR /var/src

RUN wget -O /var/src/TDEFNODE.tar.gz http://www.web.pdx.edu/~mccaf/defnode/TDEFNODE.source.20171112.tar.gz
RUN tar -xvzf TDEFNODE.tar.gz -C /var/src/TDEFNODE

WORKDIR /var/src/TDEFNODE

RUN chown -R root:root ./*
COPY tdefcom1.h.tmp tdefcom1.h

RUN make
ENV PATH="/var/src/TDEFNODE:${PATH}"

RUN mkdir -p /var/app
WORKDIR /var/app

ENTRYPOINT ["tdefnode"]
