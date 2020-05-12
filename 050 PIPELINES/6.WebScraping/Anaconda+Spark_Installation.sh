# Install anaconda(comes with python+all),java,spark set the env path (.bashrc or owner defined) and the  conda install pyspark


#ANACONDA INSTALLATION

1.Visit Anaconda.com/downloads (https://www.anaconda.com/products/individual)
2.Select Linux
3.Copy the bash (.sh file) installer link
4.Use wget to download the bash installer
5.Run the bash script to install Anaconda3
6.source the .bash-rc file to add Anaconda to your PATH
7.Start the Python REPL
8.start jupyter notebook

LINK: https://problemsolvingwithpython.com/01-Orientation/01.05-Installing-Anaconda-on-Linux/#1-visit-the-anaconda-downloads-page



#PYSPARK INSTALLATION
1.Download Spark
  wget https://downloads.apache.org/spark/spark-3.0.0-preview2/spark-3.0.0-preview2-bin-hadoop2.7.tgz

2.Install pyspark
$ conda install pyspark  or
$ pip install pyspark

3.Set up environment variables (to .bashrc)
export SPARK_HOME=/"home/fieldemploye/opt/spark-3.0.0"
export PATH=$PATH:$SPARK_HOME/bin
export PYSPARK_PYTHON="/home/fieldemploye/anaconda3/bin/python3"
export PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.8.1-src.zip:$PYTHONPATH   (MAKE SURE THE VERSIONS MATCHES)

export JAVA_HOME="/home/fieldemploye/opt/jdk1.8.0_221"
export PATH=$PATH:$JAVA_HOME/bin

   
LINK: https://mortada.net/3-easy-steps-to-set-up-pyspark.html


