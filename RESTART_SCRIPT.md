# What is spigot restart script

Spigot added a feature allowing for server to automatically restart on crashes,
as well as when authorized user executes `/restart` command.

# How it works

When server starts to shut down, it spawns a new process which runs your restart script,
as specified in `spigot.yml` under `settings.restart-script`, which defaults to `./start.sh`.
The idea is that the original server will stop completely, and the new instance will take its place.

# Why is it an issue

Because the new server is created before old one fully stopped, this means:

1. You need enough spare resources, to temporarily run 2 servers at the same time,
  as the old instance haven't freed up CPU/RAM while the new one starts and prepares itself.
2. You might hit `Unable to bind to port` errors, because old server is still occupying the port.
3. You might hit `Is another instance running` error, mentioning that `world/session.lock` is in use

Because the new server is being detached, that means that if you use `tmux` or `screen` to start your server,
it no longer will give you access to server console after restart.

# How can this be fixed

The solution is simple - don't let the restart script start any server,
but instead have it communicate with your start script that when old instance is shut down,
it should start a new one instead.

# How can I do it?

The easiest way is to simply create 2 scripts - `start.sh` which will be the start script,
and `restart.sh` which will be used by Spigot to notify that a restart is needed.

First, configure `spigot.yml` to use your restart script instead:

```yaml
settings:
  restart-script: ./restart.sh
```

Finally, copy the attached to this gist `start.sh` and `restart.sh` scripts
and place them in your server folder from where you start it,
which usually is the same directory where server jar, settings and worlds are in.
Make sure to understand what they do and change memory setting and other flags to your liking.
You'll also need to mark them as executable, by running `chmod +x *.sh`.

Now you can start your `tmux`/`screen` session as usual and run `./start.sh`. That's it!

# But what about Windows?

I haven't used Windows in years, so I don't know batch or PS language well enough.
If someone can rewrite these scripts to Windows equivalents, I'll gladly add them.

# I have questions / issues

If you have questions, feel free to ask them in Syscraft Discord.
You can ping me there `Prof_Bloodstone#0123`.

# Known issues

### Illegal option -o pipefail

Error: `start.sh: 4: set: Illegal option -o pipefail`

It means that the script was started with a shell not supporting `pipefail` option.
This is most common, when you start the script as `sh start.sh` while `sh` is symlinked to `dash` or other minimal shell:

```sh
$ which sh
/bin/sh
$ ls -l /bin/sh
lrwxrwxrwx 1 root root 4 Feb 23 18:52 /bin/sh -> dash
```

Solution: Start it using bash - either use `bash start.sh`,
or first mark the file as executable with `chmod +x start.sh`
and then execute the file directly using `./start.sh`.

### bad substitution

Error: `start.sh: line 55: ${restart_on_crash,,}: bad substitution`

It means that you sucessfully started the script using bash, but it's probably too old.
Run `bash --version` to confirm - I believe required features were added in version `4`.

Solutions:
1. Upgrade bash to more modern version
2. Replace the mentioned substitution to remove the lowercasing (remove the two `,,`).
  From now on you need to make sure that `restart_on_crash` setting is lowercase.
