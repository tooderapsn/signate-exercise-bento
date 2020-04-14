FROM jupyter/datascience-notebook:94fdd01b492f

RUN pip install --upgrade pip
RUN pip install pandas-profiling==1.4.1
RUN pip install nbdime
RUN jupyter labextension install @jupyterlab/toc
RUN nbdime extensions --enable

RUN wget https://ipafont.ipa.go.jp/IPAexfont/ipaexg00401.zip
RUN unzip ipaexg00401.zip
RUN cp ipaexg00401/ipaexg.ttf /opt/conda/lib/python3.7/site-packages/matplotlib/mpl-data/fonts/ttf/ipaexg.ttf
RUN sed -i -e '/^#font.family/s/#font.family/font.family/'  -e '/font.family/s/sans-serif/IPAexGothic/' /opt/conda/lib/python3.7/site-packages/matplotlib/mpl-data/matplotlibrc
RUN sed -i -e '/font.sans-serif/s/Arial/IPAexGothic, Arial/' /opt/conda/lib/python3.7/site-packages/pandas_profiling/pandas_profiling.mplstyle
RUN rm -r ./.cache

WORKDIR /workdir

EXPOSE 8888

ENTRYPOINT ["jupyter-lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]

CMD ["--notebook-dir=/workdir"]
