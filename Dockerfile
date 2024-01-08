FROM ubuntu:latest
 
# Basic Update
RUN apt-get -y update
 
# Dependancies (take note of python)
RUN apt-get install -y \
wget \
vim \
gawk \
bison \
byacc \
gcc \
make \
git

RUN apt-get install -y \
python3.9 \
python3-pip

# # Install Golang 1.21.5
RUN wget https://go.dev/dl/go1.21.5.linux-amd64.tar.gz
RUN tar -xvf go1.21.5.linux-amd64.tar.gz
RUN mv go /usr/local
ENV GOPATH $HOME/go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

# git clone IRIS DB-API
RUN git clone https://github.com/intersystems-community/iris-driver-distribution
RUN cd iris-driver-distribution/DB-API && pip install intersystems_irispython-3.2.0-py3-none-any.whl

# git clone pyODBCtest repo  https://github.com/martyn0022/pyODBCtest.git
RUN git clone https://github.com/martyn0022/pyODBCtest.git

# Keep Running
CMD tail -f /dev/null