#membuat docker image dari docker file biasanya menggunakan parameter -t untuk menambah nama/tag
docker build
docker build -t agung/app:1.0.0 pathfolder
#bisa membuat 2 nama yang berbeda
docker build -t agung/app:1.0.0 -t agung/app:latest pathfolder

#Instruction ditulis dengan uppercase

#From instruction, instruksi awal saat membuat dockerfile
FROM image:version
FROM alpine:latest

#RUN instruction, instruksi untuk mengeksekusi perintah di dalam image pada saat build stage saja
RUN commandmu
RUN mkdir hello

#display output nya, --progress=plain --no-cache
docker build -t agung/app:tag pathfolder --progress=plain --no-cache

#Command Instruction, CMD instruksi yang digunakan ketika docker container berjalan
CMD command parameter parameter
#akan dijalankan saat docker container berjalan bukan saat build image seperti RUN
CMD cat "hello/world.txt"

#LABEL instruction, menambahkan metadata pada docker image, nama pembuat lisensi dll
LABEL <key>=<value>
LABEL pembuat="agung bahtiar" dan="seterusnya"

#ADD Instruction, menambahkan file dari source ke dalam folder destination dalam folder image
ADD pathsource pathdestination
ADD world.txt hello
ADD *.txt hello



