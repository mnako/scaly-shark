REGION ?= nrt

build:
	docker build --platform linux/amd64 --tag scaly-shark:latest .

up: build
	docker run \
		--rm \
		-it \
        --env TS_AUTH_KEY="${TS_AUTH_KEY}" \
        --env TS_HOSTNAME="dev-fly-vpn" \
		--name scaly-shark \
		scaly-shark:latest

deploy:
	flyctl secrets set TS_AUTH_KEY="${TS_AUTH_KEY}" --stage
	flyctl machine run \
		--machine-config machine.json \
		--env TS_HOSTNAME="$(REGION)-fly-vpn" \
		--name scaly-shark-$(REGION)-machine1 \
		--region $(REGION) \
		--vm-memory 512 \
		.

logs:
	flyctl logs

destroy:
	flyctl machine destroy --force $(shell flyctl machine list -q) || true
