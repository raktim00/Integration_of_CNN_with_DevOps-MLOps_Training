FROM centos:latest

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

RUN yum update -y
RUN yum install -y wget
RUN mkdir /root/ws/
VOLUME /root/ws/

COPY cnn_dataset /root/ws/cnn_dataset
COPY Task3.py /root/ws

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 
RUN conda --version
RUN conda install tensorflow -y
RUN conda install keras -y
RUN conda install pillow -y
WORKDIR /root/ws/

CMD ["bin/bash"]
CMD ["python3","Task3.py"]
