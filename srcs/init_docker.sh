
#apt 업데이트
sudo apt-get update -y && apt-get upgrade -y;

#도커 구버전 삭제
sudo apt-get remove docker docker-engine docker.io containerd runc;
#도커 & 컴포즈 설치 
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release;
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get install -y docker docker.io docker-compose && sudo chmod 666 /var/run/docker.sock
docker --version
docker compose version
# ubuntu 유저를 docker 그룹에 추가 
sudo groupadd docker
sudo usermod -a -G docker