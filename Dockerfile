FROM ubuntu:16.04
MAINTAINER "Andrei Maksimov"

RUN apt-get update && apt-get install -y wget ca-certificates \
    git curl vim python3-dev python3-pip \
    libfreetype6-dev libpng12-dev libhdf5-dev \
    # OpenCV requirements
    build-essential cmake pkg-config \
    libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev \
    libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
    libxvidcore-dev libx264-dev \
    libgtk-3-dev \
    libatlas-base-dev gfortran

RUN wget -O opencv.tar.gz https://github.com/opencv/opencv/archive/3.3.1.tar.gz && \
    tar zxvf opencv.tar.gz && \
    wget -O opencv_contrib.tar.gz https://github.com/opencv/opencv_contrib/archive/3.3.1.tar.gz && \
    tar zxvf opencv_contrib.tar.gz

RUN cd opencv-3.3.1 && \
    mkdir build && \
    cd build && \
    cmake -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=/usr/local \
        -D INSTALL_PYTHON_EXAMPLES=ON \
        -D INSTALL_C_EXAMPLES=OFF \
        -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-3.3.1/modules \
        -D BUILD_EXAMPLES=ON .. && \
    make && \
    make install

RUN ldconfig

RUN cd / && rm -rf opencv-3.3.1 opencv_contrib-3.3.1 opencv.tar.gz opencv_contrib.tar.gz

RUN pip3 install --upgrade pip
RUN pip3 install tensorflow
RUN pip3 install numpy pandas sklearn matplotlib seaborn jupyter pyyaml h5py
RUN pip3 install keras --no-deps

RUN ["mkdir", "notebooks"]
COPY jupyter_notebook_config.py /root/.jupyter/
COPY run_jupyter.sh /

# Jupyter and Tensorboard ports
EXPOSE 8888 6006

# Store notebooks in this mounted directory
VOLUME /notebooks

CMD ["/run_jupyter.sh"]
