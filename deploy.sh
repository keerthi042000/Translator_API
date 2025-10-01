#!/bin/bash

sudo apt update
# sudo apt install -y libgl1-mesa-glx libglib2.0-0 libsm6 libxrender1 libxext6 ffmpeg
sudo apt install -y libgl1-mesa-glx

if [ -d "Translator_API" ]; then
    cd Translator_API && git pull origin main
else
    git clone https://github.com/keerthi042000/Translator_API.git
fi

cd ~/projects
python3 -m venv venv
source venv/bin/activate

pip install --upgrade pip
pip install -r ~/projects/Translator_API/requirements.txt

nohup python3 ~/projects/Translator_API/app.py > ~/projects/project2.log 2>&1 &
