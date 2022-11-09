#apt 업데이트
sudo apt-get update -y && apt-get upgrade -y;

#git, vim, make 설치
sudo apt-get install -y git vim make;

bash ./srcs/init_docker.sh
make up