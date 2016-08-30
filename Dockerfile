FROM andrewosh/binder-base

USER root

RUN apt-get update
RUN apt-get install -y libgeos-dev && apt-get clean

RUN pip install folium seaborn ggplot git+https://github.com/psychemedia/Localization.git shapely

USER main
