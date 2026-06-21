
##############################################################
#
# LDD
#
##############################################################

LDD_VERSION = f8f9d8b99ca10cac4d42a1775b7ffc4b509332ef
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-mer0vech
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES
LDD_DEPENDENCIES = linux

define LDD_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D)/scull KERNELDIR=$(LINUX_DIR) modules
	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D)/misc-modules KERNELDIR=$(LINUX_DIR) modules
endef

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 $(@D)/scull/scull.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/extra/scull.ko
	$(INSTALL) -D -m 0644 $(@D)/misc-modules/faulty.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/extra/faulty.ko
	$(INSTALL) -D -m 0644 $(@D)/misc-modules/hello.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/extra/hello.ko
endef

$(eval $(generic-package))
