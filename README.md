# PIPEPE

Why don't we create a cloud sync picture frame displaying some Pepe ?

This is an adaptation of existing projects. 

Bill of material :

    Picture frame
    7" touch LCD screen
    USB right angle cable
    HDMI right angle cable
    Raspberry Pi


Start by installing PiOS (with desktop) on your Pi (you can use Raspberry Pi Imager), create a dropBox account and add the "fakeDrop" shared folder to your account. 


1/ Install rclone on the Rpi

  Open the Terminal and type :
  
    sudo -v ; curl https://rclone.org/install.sh | sudo bash
  
  In the Terminal, verify the installation of rclone by typing :
  
    rclone --version
  
  
 2/ Configure rclone 
 
  In the Terminal type :
  
    rclone config 
    
  Then :
  
    choose "n" (New remote)
    write "piPepeCloud" (for name>)
    choose "13" for the dropBox option (for Storage>)
    leave client_id and client_secret blank
    choose "no" for advanced config
    choose "yes" for auto config
    
  A dropBox window will open, log in and allow rclone to connect
  
  Then (back on the Terminal with rclone) :
  
    choose "yes"
    Type "q" to quit
    
    
 3/ Configure the Rpi (synchronise a folder with dropBox)
 
  In the Terminal type :
  
    rclone sync piPepeCloud:/fakeDrops /home/pi/Pictures/
    
  It should download the content of the dropBox folder
  
  Now we want to create a script for this task
  
  In the Terminal type :
  
    nano get_pictures.sh
    
  Copy the content of the get_picture file then save and quit nano
  
  In the Terminal type :
  
    chmod +x get_pictures.sh
    
    
  4/ Let's create a "cron job" (automatisation of the synchronisation)  
  
   In the Terminal type :
    
      crontab -e 
      
   Tap enter to choose "nano" and type the following at the end of the file (sync with dropBox every 5 minutes) :
    
    */5 * * * * /home/pi/get_pictures.sh >/dev/null 2>&1
    
   Save and exit nano
    
    
  5/ Now we need to install a pictures displaying program 
  
   In the terminal type :
    
      sudo apt-get install fbi
      
   In order to auto start the display we are going to create an auto start script
    
   In the Terminal type :
    
      nano fbi_start.sh
      
   Copy the content of the fbi_start file then save and quit nano
    
   In the Terminal type :
  
      chmod +x fbi_start.sh
      
    
  6/ We want this to start at boot so
  
   In the Terminal type :
    
      cd /etc/xdg/lxsession/LXDE-pi
      
   Then type :
    
      sudo nano autostart 
      
   In the opened file type :
    
      /home/pi/fbi_start.sh 
      
   Save and quit nano 
    
    
  7/ Restart the pi and see if the pictures start showing (it might take a minute to start) 
    
      
      
    
    



    
 
 
    
    
    
    
    
  
  
    
    
    
  
    
    
  
    
    
    
    
    
    
    
 
 
