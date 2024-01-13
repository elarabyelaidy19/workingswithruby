# get prayer times right in your terminal 

## dependencies    
- ruby 3.3.0 
- bundler 
- terminal-table gem 

## How 
- copy the script make to your machine 
- make it excutable run `chmod -x script_name.rb` replace the script name with the actual name of your script. 
- open your shell configuration file `.zshrc` or `.bashrc`  
- define the function in your `shell configuration file` 
```shell 
pray() { 
    ruby your_actual_script_path "$@"
} 
```
- save the file and restart your shell `source /.zshrc` 
- now you can use the function in your shell just run `function_name` 


