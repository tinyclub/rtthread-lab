# Makefile for rtthread-lab

BOARD ?= vexpress-a9
BSP ?= qemu-$(BOARD)
NET_DEV = lan9118

BSP_DIR = rt-thread/bsp/$(BSP)/
BOOT_CMD = qemu-system-arm -M $(BOARD) -net nic,model=$(NET_DEV) -net tap -kernel $(BSP_DIR)/rtthread.elf

ifneq ($(G),1)
  BOOT_CMD += -nographic
endif

help:
	@echo "Usage:"
	@echo
	@echo "init  -- download or update rt-thread"
	@echo "config-- configure rt-thread"
	@echo "build -- compile rt-thread"
	@echo "clean -- clean rt-thread"
	@echo "boot  -- boot rt-thread on qemu, G=1 for graphic"
	@echo
init:
	git submodule update --init --remote .

config:
	scons --menuconfig -C $(BSP_DIR)

build:
	scons -C $(BSP_DIR)

clean:
	scons -c -C $(BSP_DIR)

boot:
	sudo $(BOOT_CMD)
