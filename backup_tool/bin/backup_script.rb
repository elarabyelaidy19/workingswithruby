require_relative '../lib/Backup' 
require_relative '../lib/logger' 
require_relative '../lib/compression'


options = { 
    source: '../compress/test.txt', 
    destination: '../compress/compressed_test'
}

# Backup.versioned_backup(options[:source], options[:destination])

compressed_file = Compression.compress(options[:source], options[:destination])
Compression.decompress(compressed_file, options[:destination])
