# Makefile for rtthread-lab

BSP ?= qemu-vexpress-a9
BSP_WORKDIR = rt-thread/bsp/$(BSP)/
BOOT_CMD = qemu-nographic.sh

ifeq ($(G),1)
  BOOT_CMD := qemu.sh
endif

help:
	@echo "Usage:"
	@echo
	@echo "init  -- download or update rt-thread"
	@echo "build -- compile rt-thread"
	@echo "boot  -- boot rt-thread on qemu"
	@echo
init:
	git submodule update --init --remote .

build:
	scons -C $(BSP_WORKDIR)

boot:
	cd $(BSP_WORKDIR) && bash $(BOOT_CMD)
