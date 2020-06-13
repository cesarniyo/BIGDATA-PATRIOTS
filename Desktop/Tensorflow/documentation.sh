TF object detection API
#-------------------------------------------------------------------------------------------------------------------
#Install Tensorflow (CPU)
conda create -n tensorflow_env tensorflow
conda activate tensorflow_env

#Install Tensorflow (GPU)
conda create -n tensorflow_gpuenv tensorflow-gpu
conda activate tensorflow_gpuenv

#deactivete the env
conda deactivate

#Install other dependencies
pip install pillow
pip install lxml
pip install jupyter
pip install matplotlib
pip install tf_slim
conda install -c conda-forge opencv



#Download:TF source code/github
https://github.com/tensorflow/models

#Download: Protocol buffers
https://github.com/protocolbuffers/protobuf/releases

#Protos folder location inside research folder
/home/fieldemploye/Desktop/Tensorflow/models/research/object_detection/protos

#turn protos into python files (run this command from Tensorflow/models/research)
./bin/protoc object_detection/protos/*.proto --python_out=.
#OR
#Using protocol buffers (save 'use_protobuf.py' into research folder)(run this command from Tensorflow/models/research)
python use_protobuf.py object_detection/protos /home/fieldemploye/Desktop/Tensorflow/bin/protoc


# cd /home/fieldemploye/Desktop/Tensorflow/models/research/object_detection
run jupyter notebook  to test the code

-----------------------------------------------------------------------------------------------------------------------
#TRAIN YOUR OWNER MODEL
https://www.youtube.com/watch?v=HjiBbChYRDw&t=822s
https://gilberttanner.com/blog/creating-your-own-objectdetector

#Collect data
class1,2.....

#Resize the data
resize the data

#create a new folderS
/home/fieldemploye/Desktop/Tensorflow/models/research/object_detection/images(train-test)

#split data
80% in training folder
20% in testing folder

#label data using labaling/annotation tool
sudo apt-get install python3-pip

git clone https://github.com/tzutalin/labelImg
sudo apt-get install pyqt5-dev-tools
sudo pip3 install -r requirements/requirements-linux-python3.txt
make qt5py3
run 'python3 labelImg.py'







































