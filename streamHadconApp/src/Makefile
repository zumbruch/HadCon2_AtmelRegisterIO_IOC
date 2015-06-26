TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#=============================
# Build the IOC support library

PROD_LIBS += stream
PROD_LIBS += asyn
#PROD_LIBS += calc

LIBRARY_IOC += streamHadconSupport

# Link locally-provided code into the support library,
# rather than directly into the IOC application.
streamHadconSupport_SRCS += initTrace.c
streamHadconSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
# Build the IOC application

PROD_IOC = streamHadcon
# streamHadcon.dbd will be created and installed
DBD += streamHadcon.dbd

# streamHadcon.dbd will be made up from these files:
streamHadcon_DBD += base.dbd
streamHadcon_DBD += asyn.dbd
streamHadcon_DBD += stream.dbd
streamHadcon_DBD += streamHadconInclude.dbd
streamHadcon_DBD += initTrace.dbd

# streamHadcon_registerRecordDeviceDriver.cpp derives from streamHadcon.dbd
streamHadcon_SRCS += streamHadcon_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
streamHadcon_SRCS_DEFAULT += streamHadconMain.cpp
streamHadcon_SRCS_vxWorks += -nil-

# Link in the code from the support library
streamHadcon_LIBS += streamHadconSupport

# Finally link to the EPICS Base libraries
streamHadcon_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
ifneq ($(findstring linux-arm,$(T_A)),)
BIN_INSTALLS += $(EPICS_BASE_BIN)/caRepeater
LIB_INSTALLS += $(ASYN)/lib/linux-arm/libasyn.so
LIB_INSTALLS += $(STREAM)/lib/linux-arm/libstream.so
LIB_INSTALLS += $(SNCSEQ)/lib/linux-arm/libseq.so
LIB_INSTALLS += $(SNCSEQ)/lib/linux-arm/libpv.so
endif

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

#ifdef T_A
#ifeq($(T_A), linux-cris_v10)
#deploy: build.$(T_A)	
#	echo scp $(TOP) hadaq@lxhadesdaq:/var/diskless/etrax/EPICS/epics_apps
#else
#
#endif
#endif
