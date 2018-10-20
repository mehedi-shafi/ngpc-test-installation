check_command()
{
    some_command
    if [ $? -eq 0 ]; then
        echo $1
    else
        echo $2
    fi
}

# Update index
sudo apt-get update >> log.txt
check_command "Index Update Success" "Update Failed"

# install G++
sudo apt install g++ -y >> log.txt
check_command "C++ compiler Installed" "C++ installation failed"

# Install CodeBlocks
sudo apt install codeblocks -y >> log.txt
check_command "CodeBlocks installed" "CodeBlocks Installed Failed"

# install java
sudo apt install default-jre -y >> log.txt
check_command "JRE Installed" "JRE installation failed"
sudo apt install default-jdk -y >> log.txt
check_command "JDK Installed" "JDK installation failed"

# test java installation
java -version
javac -version

# install python
sudo apt install python-minimal >> log.txt
check_command "Python 2 installed" "Python installation failed"

# install sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-add-repository "deb https://download.sublimetext.com/ apt/stable/" 
sudo apt update >> log.txt
sudo apt install sublime-text -y >> log.txt
check_command "Sublime installed" "Sublime installation failed"

# install kate
sudo apt install kate -y >> log.txt
check_command "Kate installed" "Kate installation failed"

# install chrome
# sudo apt install gdebi-core -y >> log.txt
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo gdebi google-chrome-stable_current_amd64.deb

mkdir output

# test c
gcc testc.c -o output/testc
./output/testc

# test C++
c++ testcpp.cpp -o output/testcpp
./output/testcpp

# test java
javac Main.java -d output/
cd output
java Main
cd ..

# test python 2
python2 testpy2.py

# test python 3
python testpy3.py

# setting wallpaper
cp bg.png ~/Pictures/bg.png