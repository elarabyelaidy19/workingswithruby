module MyLogger 
    LOG_FILE = 'backups/backups_log.txt'.freeze 

    def self.log(message) 
        time = Time.now.strftime("%Y-%m-%d %H:%M:%S") 
        log_entry = "[#{time}] #{message}\n" 

        puts log_entry 
        File.open(LOG_FILE, 'a') { |f| f.puts log_entry }
    end 


end 