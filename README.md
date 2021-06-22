# 0ad-Game-Container
Docker container - 0ad Game 
 
0AD Game Docker container

The container under this project is built  so that anyone can “pull” and ‘play it!’ in docker without installing the game in ‘localhost’. “0ad”  is one of the best linux games based on gpu that I have ever come across.  The game is ‘open-source’ and on-par with any of the paid games - "COTS".

Since my school days, I used to play games on the desktop and developed interest in game development. In recent times, I am learning Dev-Sec-Ops and related concepts. Of-course, I am very new to dockerize the containers, especially the applications / games running on gpu, as POC I ‘given’ a try that resulted in this ‘project’.

The prerequisites to run 0ad game in container, the local host... 

First let us look into X server in linux systems….

From wikipedia, it says “X uses a client–server model. An X server program runs on a computer with a graphical display and communicates with various client programs. The X server acts as a go-between for the user and the client programs, accepting requests on TCP port 6000 for graphical output (windows) from the client programs and displaying them to the user (display), and receiving user input (keyboard, mouse) and transmitting it to the client programs.
In X, the server runs on the user's computer, while the clients may run on remote machines. This terminology reverses the common notion of client–server systems, where the client normally runs on the user's local computer and the server runs on the remote computer.  ….”
 
To check in local machine enter command 

		ps -ax | grep X
  
As it lists in the terminal “/usr/lib/xorg/Xorg”  Xorg is an X-server running in localhost. The beauty of linux systems with X server running is that the various X-clients  like browser, xterm on the local host or outside of the localhost (through the network) can interact with X-server and send the output to I/O devices like display, mouse, keyboard connected to local host. Please note that the concept is only applicable to linux systems.
 
With defining environment variables of ‘DISPLAY’ and mounting sockets, the clients, especially in containers can connect / communicate with X-server running in localhost through display port. To know the display port in localhost enter command

		echo $DISPLAY 

With security of linux systems and protocol to be specified, to connect X server the clients should be allowed by entering command in local host

		xhost + 

With which access control will be disabled and clients can connect to X-server from any host.

TEST to run gui based application gimp - CASE  I ‘dockerfile’

		FROM ubuntu
		ENV DEBIAN_FRONTEND=noninteractive
		RUN apt-get update && apt-get install gimp -y
		ENV DISPLAY :0
		CMD ["gimp"]


		docker run --rm -it --name gimp -e DISPLAY=$DISPLAY -v /tmp/.X11.unix:/tmp/.X11.unix:ro gimp:0.1
