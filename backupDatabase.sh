if [ "$EUID" -ne 0 ]
  then echo 'Admin permissions needed to exec docker container.'
  exit
fi


#sudo docker-compose up -d
echo 'Backing up database on container'
docker-compose exec db bash -c 'pg_dump choban > choban.bak -U choban'

echo 'Copying database from docker container to host..'
docker cp db:/choban.bak choban.bak
