require_relative '../lib/Backup' 
require_relative '../lib/my_logger' 
require_relative '../lib/compression'
require_relative '../lib/scheduler'

options = { 
    source: '../backups/test_source', 
    destination: '../backups/test_destination', 
    interval: '3s' 
}


Scheduler.schedule_backup(options)



