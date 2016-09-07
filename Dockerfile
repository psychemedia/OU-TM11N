FROM andrewosh/binder-base

USER root

RUN apt-get update
RUN apt-get install -y libgeos-dev musescore && apt-get clean

RUN wget http://download.linuxaudio.org/lilypond/binaries/linux-64/lilypond-2.18.2-1.linux-64.sh && sh lilypond-2.18.2-1.linux-64.sh --batch

USER main

#Py3 installs
RUN /home/main/anaconda2/envs/python3/bin/pip install folium shapely descartes seaborn ggplot git+https://github.com/psychemedia/Localization.git pyknon music21
#Py2.7 installs
RUN pip install folium shapely seaborn ggplot pyknon music21
