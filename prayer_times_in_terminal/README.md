# get prayer times right in your terminal 

## dependencies    
- ruby 3.3.0 
- bundler 
- terminal-table gem 

## How  
- make it executable run `chmod -x script_name.rb` 
- define function in your `shell configuration file`  (`.bashrc`, `.zshrc`)
```shell 
salah() { 
    ruby your_actual_script_path "$@"
} 
```
- save the file and restart your shell `source /.zshrc`, just call the function `salah` in your terminal. 


