sudo rm -rf ./gitlab-data
mkdir -p ./gitlab-data/{config,logs,data}
sudo chown -R alecgriffin:staff ./gitlab-data
sudo chmod -R 777 ./gitlab-data