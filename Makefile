all:
	docker-compose build
again:
	docker-compose build --no-cache
sh:
	docker-compose run --rm --service-ports dev
