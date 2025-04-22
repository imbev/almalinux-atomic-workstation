SUDO = sudo
PODMAN = $(SUDO) podman

MAJOR = 10-kitten
ARCH = x86_64
IMAGE_NAME ?= localhost/almalinux-atomic-workstation

.PHONY: \
    bootc \
    clean

bootc:
	$(PODMAN) build \
        --platform=$(ARCH) \
        --security-opt=label=disable \
        --cap-add=all \
        --device /dev/fuse \
        -t $(IMAGE_NAME) \
        -f $(MAJOR)/Containerfile \
        .

clean:
	-$(PODMAN) rmi $(IMAGE_NAME)
