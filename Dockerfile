FROM andrewosh/binder-base

USER root

RUN apt-get update
RUN apt-get install -y libgeos-dev && apt-get clean

USER main

RUN /home/main/anaconda2/envs/python3/bin/pip install folium shapely seaborn ggplot git+https://github.com/psychemedia/Localization.git
RUN pip install folium shapely seaborn ggplot git+https://github.com/psychemedia/Localization.git
