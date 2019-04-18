build:
	docker build -t soda:latest .
	docker tag soda:latest royge/soda:latest

push:
	docker push royge/soda:latest

prepare:
	curl -LO https://storage.googleapis.com/container-structure-test/latest/container-structure-test-linux-amd64 && chmod +x container-structure-test-linux-amd64 && sudo mv container-structure-test-linux-amd64 /usr/local/bin/container-structure-test

test:
	container-structure-test test \
		--image soda:latest \
		--config test-config.yml
