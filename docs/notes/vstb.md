# AV meeting 17.01.2018
## Key talking points

- Parental Restrictions control
	- How can we confirm it works
	- How do we restrict 1/4 screen 
	- How do we notify Zodiac when parental expires

	** Additional meeting should be setup with Zodiac 
	to discuss further on the parental mappings intergration 

- Pin Input Validation 
	- How can we confirm it works
	
	** Additional meeting should be setup with Zodiac 
	to discuss further on the parental mappings intergration 

- 1/4 Screen Video 
	- What is the exact resolution that you are running video in
	- What is the CSS padding on the Video Container

	** We've reached a consensus to provide an unminified build on the test server 192.168.4.141
	** so the AV devs can debug and position the CSS on the video containers properly

- OnDemand, EPG, Menu buttons
	- Are they passthrough buttons
	- We need the mappings for those buttons

	** There is option called Key Filtering. If that is support it should give is the flexibility 
	** to define which keys are passthrough for the active session.
	** Latest AV Developer Guide should contain necessary info ( >= 10.2.2 )
	** Seems like this is a consern for CBL and Zodiac primeraly, we need to investigate further 
	** in order to confirm that

	?  Start email chain to establish whether or not Minerva should be handling those keypresses
	?  or is that a task for Zodiac
	?  Also what are the keycodes for the fore-mentioned buttons

- Session Swtiching
	- Do we know which or what sticher the current active session is running from
	- How does the stitcher technology work with docker containers
	- Can Docker containers communicate with one another
	- Can data or memory be shared between containers and how much
	
	** There is persistent storage on the physical STB, wchi should work just like
	** the native browser based LocalStorage. That should be accessible in the Minerva App
	** When the session swithes on the stitcher it will use the date from physical STB
	** as some of the startup params to launch the session, ergo some metadata can be saved on the box
	** itself for later use
	** There is no way to know which is the current stitcher.
	** The main premise behind session switching is "Entry Points"
	** The Minerva App must provide different entrypoints for launching in different states

	?  To investigate further and confirm that chosen approach with URI params is acceptable
	?  To investigate how the LocalStorage works and those params are accessible and tranferable
	?  To investigate how entry points on the stitcher work and to support this safely on our side
