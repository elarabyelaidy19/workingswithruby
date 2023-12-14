require_relative 'my_logger'
require 'fileutils'


module Backup
    extend FileUtils 

    def self.backup(source, destination) 
        create_backup_directory(destination) 

        source_files = Dir.glob("#{source}/**/*") 
        source_files.each do |f| 
            next unless File.file?(f) 

            relative_path = f.gsub("#{source}/", "") 
            destination_path = "#{destination}/#{relative_path}" 
            backup_file = File.join(destination, relative_path)
            backup_single_file(f, backup_file)
        end 
    end 

    def self.versioned_backup(source, destination) 
        time = Time.now.strftime("%Y-%m-%d_%H-%M-%S") 
        versioned_destination = "#{destination}_#{time}" 
        backup(source, versioned_destination)
    end 


    private 

    def self.create_backup_directory(destination) 
        FileUtils.mkdir_p(destination) unless Dir.exists?(destination)
    end 


    def self.backup_single_file(source_file, backup_file) 
        FileUtils.mkdir_p(File.dirname(backup_file)) unless Dir.exists?(File.dirname(backup_file)) 
        FileUtils.cp(source_file, backup_file) 
        MyLogger.log("Copied #{source_file} to #{backup_file}")
    end 
end 