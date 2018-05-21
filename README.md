# Nvidia gpu autofans mod2
Nvidia gpu automatic fan speed new mod script for HiveOS Ubuntu. Tested with Nvidia GTX 1060 / 1070 / 1080.
In this modification, you must set the GPU temperature which you want (MAX_TEMP) and the script will try to keep it.

# Disclaimer
Use and change at your own risk! Not responsible for any damages or issues, changing temperature controls, fan speed, etc. might damage your computer hardwares.

# Run
Impotant: be very careful!!!

 - Put autofan2.sh and xinit.user.sh to ```/home/user/``` folder. 
 - Change permissions to ```-rwxr-xr-x (755)``` (chmod +x /home/user/autofan.sh and chmod +x /home/user/xinit.user.sh)
 - Test:
     ```
     root@rig: ./autofan.sh
     ```
     Terminate process Ctrl+C
     
 - do command ```screen -dmS autofan2 /home/user/autofan2.sh``` or reboot system
 - Test:  
     ```
     screen -ls
     ```
     You must see autofan2 process. 
     
     Or (from console, not over ssh):
     ```
     screen -r autofan
     ```
     and watch the script work. 
     
     Now autofan2.sh will work in background after boot system. 
     
If you want kill the script autofan2.sh:
```      
root@rig: pkill autofan2.sh
```
and apply your HiveOS OC settings from your account (restore your default fan settings)!

If you want start the script again do command:

```
root@rig: screen -dmS autofan2 /home/user/autofan2.sh
```
or  just reboot.

# Donate

Nicehash: ```3JKA47P98c9JGCy3GN7qXFC2FzeuJmXuph```

Zec: ```t1fP9jWyqFEni2p4i9t3byqtimsMKv1y95T```

ETH: ```0xe835a7d5605a370e4750279b28f9ce0926061ea2```
