# Syscraft Starter Server

This is a repository that contains a basic Minecraft server. The server here is *not* intended to be the next Hypixel out of the box, instead it should be seen as an easy way to get an up-to-date Minecraft server quickly, in order to play with some friends in a home-hosted or at least self-hosted environment.

Since it's not intended to be fantastic or comprehensive, it contains just a few plugins:

- LuckPerms
- EssentialsX
- EssentialsXAntiBuild
- EssentialsXChat
- Vault

This is so that out-of-the-box, you get a basic permissions setup, the ability to use Essentials commands as the owner, and a cool prefix as a sort of showcase for what is possible. EssentialsXAntiBuild is included as an easy way to prevent anyone who just joins the server from interacting, as a form of security for those who do not enable the whitelist. **You must add players to the group *trusted* in order for them to build**.

As always, for any help with or questions about the following, feel free to [join our Discord server](https://discord.gg/Dx6SSkx) and we'll do our best to give you a hand.

## How to Get Started

At the moment, this example will be for users who want to run a small server on their own Windows machine. **Please have at least 4GB of usable RAM**.

If you do not have Git installed, please do so before starting. [This is a tutorial for installing Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

1. Open command prompt. This can be done by typing `cmd` into the Windows search bar, or several other methods which you can Google.

2. Navigate to the folder that you want the server's folder to be in. [This is a basic tutorial for navigating in the Windows Command Prompt](https://riptutorial.com/cmd/example/8646/navigating-in-cmd).

3. Run this command once you are at your destination: 

```
git clone https://github.com/syscraft-mc/starter-server.git MCServer 
```

4. Now you have a folder called `MCServer` inside of the folder you navigated to earlier. Open the folder in Windows' File Explorer, open `eula.txt` in any text editor, and change `eula=false` to `eula=true`. Save the file and exit.
> *Note: It's a good idea to read and understand the EULA if you haven't before!*

5. Go to https://papermc.io/downloads and download the latest build of PaperMC. Place it in the MCServer folder. **Rename it to `paper.jar`**

6. Go to https://essentialsx.net/downloads.html and download the following:

- EssentialsX (Core)
- EssentialsXChat
- EssentialsXAntiBuild

  **Place the downloaded JARs in the `plugins` folder that is inside the MCServer folder.**

7. Go to https://luckperms.net/download and click on the download button labelled *Bukkit*. **Place the downloaded JAR inside the `plugins` folder that is inside the MCServer folder.**

8. Go to https://www.spigotmc.org/resources/vault.34315/ and click on the download button. **Place the downloaded JAR inside the `plugins` folder that is inside the MCServer folder.**

9. Double click on `start.bat` to start the server! It will take a few moments longer the first time you do it, as the server needs to create your worlds.

> You can now connect to the server at the IP address of the machine running it - if it's your own computer, you can connect with the address `localhost`.

10. The server console should have appeared when you started the server. Once it's done starting up, you can input commands into it to tell the server what to do. For your first command, add yourself to the `owner` group using LuckPerms:

```
lp user <your minecraft username> parent add owner
```

> Don't worry about creating the group - that's already been done for you. If it says that a player cannot be found for your username, it's because you need to join the server at least once first!

11. Congratulations! You're the owner of a brand new server, and it's time to start playing or get your friends on! They can connect to the server at the IP address of the machine running it. If it's your own machine, and it's a personal computer on a home network, you may need to [port forward](#port-forwarding) it so others can connect. 
> Be careful, allowing public access to your home network and then sharing your public IP address with people you don't trust can be hazardous. If you're doing this, you should probably be using a professional hosting company or a machine dedicated to the task.

## Troubleshooting and FAQ

### The first time I start the server, I get a whole load of errors and cannot connect

Please ensure that when you start the server, you have a connection to the Internet - it's required. 

If that isn't the problem, try deleting the directory with the server in it and following steps 3-7 again.

Also ensure you have at least 4GB of usable RAM for the server.

Should you still get errors the first time you start up the server, feel free to ask for help in the [Syscraft Discord](https://discord.gg/Dx6SSkx).

### My friends cannot connect to my server but I can using `localhost`

Your friends, at least those that are not connected to your home internet network, will not be able to connect using `localhost` and will need to connect using the public IPv4 of your network. To find what that is, go to [this website](https://www.whatismyip.com/) on the computer running the server. 

If they still cannot connect, it is because you need to [port forward](#port-forwarding) your internal IPv4 and server port to your public IPv4. 

### I get a CANNOT BIND TO PORT error

This error is because you've got another Minecraft server running! Make sure to use the `stop` command to close your server before trying to start it up again!

### I port forwarded and it worked for a little while, but it doesn't work anymore

This is most likely because you forgot to ensure that the internal IPv4 of your computer was *reserved*, *static*, or *bound*. The process for doing this is documented under step 4 of [port forwarding](#port-forwarding).

### I do not have permission to interact with anything

This is because you have not given yourself permission to do so via LuckPerms, which is the permissions manager for your server. Both the premade `owner` and `trusted` groups have permission to do this, and to add someone to either of them simply run the following command in your Minecraft server's console:

```
lp user <minecraft username> parent add trusted
```

> You can replace `trusted` in the above example with `owner` to add them to owner. For a very comprehensive wiki on the entire LuckPerms plugin, [click here](https://luckperms.net/wiki/Home). For support with the LuckPerms plugin, [join the discord here](https://discord.gg/luckperms).

## Port Forwarding

Port forwarding is the process of telling your router that attempts to connect to your public IP address at port 25565 should be redirected (forwarded) to your single machine's local IP address at port 25565. Port 25565 is the port (kind of like the name of the door) behind which your Minecraft server is running and can be connected to.

> Port forwarding is a highly varying process from router to router, and the basic processes here will look very different depending on who manufactured your particular router. That said, you will be able to find tons of information for your specific circumstances by using Google effectively - don't be afraid to Google things!

The basic steps of port forwarding are:

1. Find your computer's internal IPv4 and default gateway. Open Windows Command Prompt and run `ipconfig`. The output will look something like this:
```
   Connection-specific DNS Suffix  . : sub.domain.net
   IPv6 Address. . . . . . . . . . . : 2614:3203:1c85:s542::h66
   IPv6 Address. . . . . . . . . . . : 2614:3203:1c85:s542:e6ha:ree:5901:6b53
   Temporary IPv6 Address. . . . . . : 2614:3203:1c85:s542:25f4:5217:601f:1jaa
   Link-local IPv6 Address . . . . . : ft30::13f5:15d:4513:8bf2%19
   IPv4 Address. . . . . . . . . . . : 10.0.0.69
   Subnet Mask . . . . . . . . . . . : 255.255.255.0
   Default Gateway . . . . . . . . . : ab91::213:64fg:aech:425y%19
                                       10.0.0.1
```
> The line labelled `IPv4 Address` is your internal IPv4 address, and it usually looks like `10.0.0.#` or `192.168.#.#`. It will be different for everyone. The line labelled `Default Gateway` is your default gateway, in this case `10.0.0.1`.

2. Open a browser and in the address bar, enter your `Default Gateway` address. In this case, it is `10.0.0.1`.

3. Log in to your router's control panel. 

> The credentials for this will vary depending on the router and if you have changed it. Usually the default information is written somewhere on the router, and some routers have the ability to be reset to that default information via a physical button.

4. Ensure your internal IP is static/bound to your machine. Then: 

      1. Go to your router's list of connected devices (explore the control panel to find it) and locate the one which currently has your internal IPv4 as its IP address.

      2. Find the button for editing or modifying the connection - sometimes this will be a gear, sometimes a button labelled `EDIT`, and sometimes the information to edit will be simply be displayed.

      3. Click the `Bind` button, the `Reserve` button, or toggle your computer from DHCP to Reserved IP. Make sure the bound IP address is the one you found earlier, in step 1, and save the change.  
      > If it's already bound or static, no need to change anything - take note of the IP address your device is bound to, as that's your internal IP.

5. Navigate to the `Port Forwarding` page. 

> Usually this is located under the `Advanced` section - do a little exploring if you can't find it! 

6. Add a port forward. Your target/internal/inbound port will be `25565`, the outbound port will be `25565`, the IP address will be the *internal* IPv4 you found in step 1. There may be a protocol field - leave it if it says `TCP` or `TCP/UDP`, but make sure that `TCP` is part of the protocol. If possible `TCP/UDP` is a better choice than just `TCP`.

7. Save everything and give it a moment to apply - perhaps have a friend try to connect to your server using your *public* IPv4 to make sure everything works!

## What to do now?

Now you have a fully functional Minecraft server! Feel free to play as you'd like with friends, or by yourself - it's your kingdom! 

You can add plugins to this server to change what you can do in it. Spigot plugins, Paper plugins, and any bukkit-based plugins will all work on your server. To add them, simply drag and drop the JAR file of the plugin you downloaded into the plugins folder. 

Most plugins require that you have *permissions* to do things with them. [This is a fantastic resource for understanding and setting up permissions(https://luckperms.net/wiki/Usage). [It also has documentation for prefixes, which are another concept you may want to get into](https://luckperms.net/wiki/Prefixes,-Suffixes-&-Meta).

To add permissions to all of your trusted players, you simply look up what the permission is (this is usually found on the documentation website for the plugin), and add it with:

```
lp group trusted permission set <permission here>
```

To add permissions to the owner only, perhaps to toggle things or take care of admin responsibilities, use:

```
lp group owner permission set <permission here>
```

> Note: By default, Owner group has *all* permissions. This is because we've enable the **LuckPerms AutoOp** system for you and given Owner group the permission `luckperms.autoop`!

If you ever want to expand and take your server public, it's best to use a professional hosting company - you can find providers that specialize in Minecraft servers specifically, or even ones that provide a machine (or virtual machine) that you can connect to and set up entirely on your own. 

> Note: Do not run a public Minecraft server on your home computer. Required uptimes, hardware failures, and most importantly, security, are all considerations that make it nearly always a bad decision.
