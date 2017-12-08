# Python Data Science container

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

## How to use

Create a folder for Jupyter Notebooks:
```sh
mkdir notebooks
```
Run Docker container with the following command:
```sh
docker run -it -p 8888:8888 -p 6006:6006 -d -v notebooks:/notebooks amaksimov/python_data_science
```
We're using following parameters:
- ```-p 8888:8888``` to export Jupyter Web interface
- ```-p 6006:6006``` to export TensorflowDashboard Web interface
- ```-d``` to run Docker container in background
- ```-v notebooks:/notebooks``` to mount just created *notebooks* folder Docker inside container

&copy; [Andrei Maksimov](https://www.linkedin.com/in/avmaksimov/) / [ProgKids.ru](https://progkids.ru/)