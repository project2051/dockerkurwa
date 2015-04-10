# all comands require elevated permissions

# add variable DOCKER_ID with UID of most recent container
function docker-id
	set -x DOCKER_ID (docker ps -ql); echo $DOCKER_ID
end

# remove all containers
function docker-rmall
	docker stop (docker ps -qa)
	docker rm (docker ps -qa)
	docker rmi (docker images -q)
end

# kill all containers
function docker-killall
	docker kill (docker ps -q)
end

# inspect last container created
function docker-inspect
	docker inspect (docker ps -ql) | less
end

# get ip of container
function docker-ip
	docker inspect -f "{{ .NetworkSettings.IPAddress }}" $argv
end

# docker run -it
function docker-run
	docker run -it $argv
end

# docker exec last container
function docker-exec
	docker exec -it (docker ps -ql) $argv
end