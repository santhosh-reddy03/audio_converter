# Convert FLAC files to ALAC files

## Requirements

This following scripts only works on **Linux/Unix** environments and requires **ffmpeg** to be isntalled on your system
Follow the below steps to install the requirements

### On Mac systems

`brew install ffmpeg`

### On Linux systems

`sudo apt install ffmpeg`

if using fedora based systems

`sudo dnf install ffmpeg`

## App Installation

Download the **main.sh** file from this repo and make it executable by using **chmod +x main.sh**

## Usage

Once you download the file and made it executable, you run it on terminal using `./main.sh` or `bash main.sh` depending on your respective shell environment, it will promopt to enter the path of the folder containing your flac files, then the program starts creating the alac files for the respective flacs.
