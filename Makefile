build:
	buildah bud -tag dci-fake-rhel-agent .

run:
	podman run --rm -ti \
	--env-file $(shell pwd)/dcirc.env \
	-v $(shell pwd)/user-tests.yml:/etc/dci-rhel-agent/hooks/user-tests.yml \
	-v $(shell pwd)/settings.yml:/etc/dci-rhel-agent/settings.yml \
	-v $(shell pwd)/hosts:/etc/dci-rhel-agent/hosts	\
	-v $(shell pwd)/.cache:/var/www/html \
	localhost/dci-fake-rhel-agent

shell:
	podman run --rm -ti \
	--env-file $(shell pwd)/dcirc.env \
	-v $(shell pwd)/user-tests.yml:/etc/dci-rhel-agent/hooks/user-tests.yml \
	-v $(shell pwd)/settings.yml:/etc/dci-rhel-agent/settings.yml \
	-v $(shell pwd)/hosts:/etc/dci-rhel-agent/hosts	\
	-v $(shell pwd)/.cache:/var/www/html \
	localhost/dci-fake-rhel-agent bash