FROM andrewosh/binder-base:latest

RUN mkdir -p /home/main/notebooks
RUN chown main:main /home/main/notebooks
WORKDIR /home/main/notebooks
USER root

RUN apt-get update && apt-get install -y libgeos-dev && apt-get clean

COPY . /home/main/notebooks/
RUN chown -R main:main $HOME/notebooks
USER main

RUN find $HOME/notebooks -name '*.ipynb' -exec jupyter trust {} \;


ADD requirements.txt requirements.txt
ADD handle-requirements.py handle-requirements.py
RUN python handle-requirements.py

USER main
WORKDIR $HOME/notebooks
