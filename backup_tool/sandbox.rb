require 'zlib'
require 'stringio' 

data = 'data to be compressed'  
# compressed_io = StringIO.new 
# compressed_data = Zlib::GzipWriter.wrap(compressed_io) { |gzib| gzib.write data } 

# # puts compressed_io.string
# decompressed_io = StringIO.new(compressed_io.string) 
# decompressed_data = Zlib::GzipReader.wrap(decompressed_io) { |gzib| line = gzib.read; puts line }  


# file compression 
file = 'test.txt' 
File.open(file, 'w') { |f| f.write data } 

compressed_file = 'test.gz' 

Zlib::GzipWriter.open(compressed_file) do |gz| 
    gz.write(IO.binread(file))
end 


decompressed_file = 'new_test.txt'

Zlib::GzipReader.open(compressed_file) do |gz| 
    File.write(decompressed_file, gz.read) 
end 

