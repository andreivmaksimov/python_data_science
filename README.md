# Python Data Science container

[![CircleCI](https://circleci.com/gh/andreivmaksimov/python_data_science.svg?style=svg)](https://circleci.com/gh/andreivmaksimov/python_data_science)

This is fully ready Docker container with:
 - NumPy
 - Pandas
 - Sklearn
 - Matplotlib
 - Seaborn
 - pyyaml
 - h5py
 - Jupyter
 - Tensorflow
 - Keras
 - OpenCV 3

We're building this container on top of [Ubuntu 16.04 Docker container](https://hub.docker.com/_/ubuntu/) ([Dockerfile](https://github.com/andreivmaksimov/python_data_science/blob/master/Dockerfile)) and [Anaconda Docker container](https://hub.docker.com/r/continuumio/anaconda3/) ([Dockerfile](https://github.com/andreivmaksimov/python_data_science/blob/master/Dockerfile.anaconda))

### Running container

We'll use ```notebooks``` forlder to store Jupyter Notebooks:
```sh
mkdir notebooks
```

Run Docker container with the following command:
```sh
docker run -it -p 8888:8888 -p 6006:6006 -d -v $(pwd)/notebooks:/notebooks amaksimov/python_data_science
```
We're using following parameters:
- ```-p 8888:8888``` to export Jupyter Web interface
- ```-p 6006:6006``` to export TensorflowDashboard Web interface
- ```-d``` to run Docker container in background
- ```-v notebooks:/notebooks``` to mount just created *notebooks* folder Docker inside container

&copy; [Andrei Maksimov](https://www.linkedin.com/in/avmaksimov/) / [ProgKids.ru](https://progkids.ru/)
