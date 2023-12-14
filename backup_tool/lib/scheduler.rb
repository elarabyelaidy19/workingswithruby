require 'rufus-scheduler'
require_relative '../lib/Backup' 
require_relative '../lib/my_logger' 
require_relative '../lib/compression'

class Scheduler 

    def self.schedule_backup(options) 
        scheduler = Rufus::Scheduler.new 

        scheduler.every(options[:interval]) do 
            Backup.backup(options[:source], options[:destination])
        end 

        scheduler.join
    end 

end 