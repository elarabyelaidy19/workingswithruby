require_relative 'my_logger'
require 'zlib' 

module Compression 

    def self.compress(file, destination)   
        compressed_file = "#{destination}.gz"

        Zlib::GzipWriter.open(compressed_file) do |gz| 
            gz.write(IO.binread(file))
        end 

        MyLogger.log("Compressed #{file} to: #{compressed_file}") 
        compressed_file
    end 


    def self.decompress(compressed_file, destination)  
        decompressed_file = destination 
        
        Zlib::GzipReader.open(compressed_file) do |gz| 
            File.write(decompressed_file, gz.read)
        end 

        MyLogger.log("Decompressed #{compressed_file} to: #{decompressed_file}")
        decompressed_file
    end 
end 