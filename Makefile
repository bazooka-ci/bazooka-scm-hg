default: docker

docker:
	docker build -t bazooka/scm-hg .

push:
	docker push bazooka/scm-hg
