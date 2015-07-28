#!../../bin/linux-arm/streamHadcon

< envPaths
#cd ${TOP}

epicsEnvSet("STREAM_PROTOCOL_PATH", "../../protocols")
epicsEnvSet("PATH","${PATH}:../../bin/linux-arm")

## Register all support components
dbLoadDatabase "../../dbd/streamHadcon.dbd"
streamHadcon_registerRecordDeviceDriver (pdbbase)

drvAsynSerialPortConfigure("hadcon2","/dev/ttyUSB0",0,0,0)
   asynSetOption("hadcon2",0,"baud","115200")
   asynSetOption("hadcon2",0,"bits","8")
   asynSetOption("hadcon2",0,"parity","none")
   asynSetOption("hadcon2",0,"stop","1")
   asynSetOption("hadcon2",0,"clocal","Y")
   asynSetOption("hadcon2",0,"crtscts","N")


## Load record instances
##
dbLoadRecords ("../../db/hadcon_global.db",       "HADCON=${HOSTNAME}:1, PREFIX=, SUFFIX=, device=hadcon2")
#dbLoadRecords ("../../db/hadcon_debug_global.db", "HADCON=${HOSTNAME}:1, PREFIX=, SUFFIX=, device=hadcon2")
#dbLoadRecords ("../../db/hadcon_stats.db", "IOC=${HOSTNAME}")

dbLoadRecords ("../../db/hadcon_atmel_register_IO_ports.db", "device=hadcon2, HADCON=${HOSTNAME}")

#cd $(TOP)

## Set this to see messages from streamDev, already while init
## Run this to trace the stages of iocInit
#traceIocInit

#cd ${TOP}/iocBoot/${IOC}
iocInit

