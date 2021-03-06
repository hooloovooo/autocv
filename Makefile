all: mainimage

pushall: pushmainimage

pushmainimage: mainimage
	sudo docker skill -f autocv beamonlabs/autocv:$(BRANCH)
	sudo docker push beamonlabs/autocv:$(BRANCH)

mainimage:
	sudo docker build --rm -t autocv .

main: bower goget main.go
	go build main.go

npm:
	npm install frontend

goget:
	go get

bower:
	cd frontend; bower --allow-root install

run: mainimage
	sudo docker run --rm --link redis -p 8080:8080 --name autocv autocv

runmongo:
	sudo docker run -d --restart=always --name mongo -p 27030:27017 mvertes/alpine-mongo

runredis:
	sudo docker run -d --restart=always --name redis -p 6379:6379 faisyl/alpine-redis

install_dev:
	sudo apt-get install -y nodejs npm
	sudo npm install -g bower
	sudo ln -s /usr/bin/nodejs /usr/bin/node

clean:
	rm -f main
	rm -rf node_modules
