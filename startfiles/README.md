# Start Files

Depending on the OS, different files must be used to properly, quickly, and easily start up the server. 

## Windows 
If you are on Windows, simply move the `start.bat` file from the `windows` directory into the main server directory, and double click it to start the server.  

## Linux

If you are on Linux, take a look in the `linux` directory. It contains its own `README` with some very helpful information, as well as two functional scripts: `start.sh` and `restart.sh`. 

### To get started right away:

1. Move both `start.sh` and `restart.sh` into the main server directory.
2. In `spigot.yml`, label the following:
```yaml
settings:
      restart-script: ./restart.sh
```
3. Mark the scripts as executable by running `chmod +x *.sh`
4. Run `./start.sh`, and the server should start!
> It is good practice to look into using `tmux` or `screen` to be able to keep the server running when you close out of the terminal. As this is not a comprehensive Linux tutorial, you can find more information using Google. If you want to know which to go with, `screen` is simple and easy, and worth looking into.  