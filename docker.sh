#download image
docker image pull namaimage:tag

#menghapus image
docker image rm namaimage:tag

#list image
docker image ls

#list container all
docker container ls -a

#list container yang sedang aktif
docker container ls

#membuat container
docker container create --name namakontainer namaimage:tag

#menjalankan container yang sudah di buat
docker container start namakontainer/idkontainer

#melihat log
docker container logs namakontainer

#mengeksekusi bash yang ada dalam kontainer (-i = argumen interaktif menjaga input agar tetap aktif) (-t = terminal akeses)
docker container exec -i -t namakontainer
docker container exec -i -t namakontainer /bin/bash

#port forwarding -p == --publish bisa tambhakan 2 port / lebih, -p porthost1:port -p porthost2:port
docker container create --name namakontainer -p portuntukhost:portkontainer namaimage:tag

#environmet variabel buat user dan password,variabel user dan pw cari di dockerhub
docker container create --name namakontainer -p portuntukhost:portkontainer --env user=usermu --env password=passwordmu namaimage:tag

#container stats
docker container stats

#file sharing / mounting ingat "mounting" folderkontainer cari di dockerhub
docker container create --name namakontainer --mount "type=bind,source=folderhost,destination=folderkontainer,readonly(optional)" namaimage

#membuat volume
docker volume create namavolume

#list volume
docker volume ls

#menghapus volume (pastikan volume tidak digunakan)
docker volume rm namavolume 

#memasang volume dengan container folderkontainer cari di dockerhub
docker container create --name namakontainer --mount "type=volume,source=namavolume,destination=folderkontainer,readonly(optional)" namaimage

#code backup dengan container run
docker container run --rm --name ubuntu --mount "type=bind,source=folderhost,destination=foldercontainer,readonly(optional)" --mount "type=volume,source=volume,destination=foldercontainer" namaimage:tag tar cvf /backup/backup.gz /data

#melihat list network docker
docker network ls

#membuat network docker
docker network create --dirver drivermode(bridge,host,none) namanetwork

#meghapaus network docker
docker network rm namanetwork

#network container
docker container create --name namacontianer --network namanetwork namaimage:tag

#menghapus network dari container
docker network disconnect namanetwork namacontainer

#menambahkan container ke dalam network
docker network connect namanetwork namacontainer

#inspect
docker image/container/volume/network inspect namaimage/container/volume/netowrk

#prune menghapus semua yang tidak digunakan
docker container prune
docker image prune
docker network prune
docker volume prune

#menghapus semua di atas
docker system prune
