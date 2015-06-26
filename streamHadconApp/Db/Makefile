TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#----------------------------------------------------
#  Optimization of db files using dbst (DEFAULT: NO)
#DB_OPT = YES

#----------------------------------------------------
# Create and install (or just install)
# databases, templates, substitutions 

DB += hadcon_global.db
DB += hadcon_debug_global.db

DB += hadcon_atmel_register_IO_ports.db

#ioc_atmel_registers_no := dreamp06 
#DB += $(foreach ioc, $(ioc_atmel_registers_no), hadcon_atmel_register_IO_ports_$(ioc).db)

DB += hadcon_stats.db

#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_TEMPLATE = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

