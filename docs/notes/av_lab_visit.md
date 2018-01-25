# OnDemand, Guide and Menu buttons are pass-through when Minerva session is running
	## Navigating into OnDemand page uses different entry point

	[1/25/18, 11:29:10] Metodi Deriban0xff: quick question regarding the OnDemand Button and session switching between stitchers:

When the user opens the Minerva app they go to Guide or Landing page by default. If after that point the user want to navigate into the OnDemand Section then we should switch to the GX stitcher. 

Now with the current configuration of the OnDemand being a pass-through key we can handle that internally and invoke a handoff request to the different entry point for the GX. This is current plan of action

Now the problem with this is that Minerva app being single page and having no way to tell which is the current stitcher that it’s running on, might be hard do distinguish between pressing OnDemand button while in EPG section or pressing OnDemand Button while already on the GX stitcher

I hope this makes sense so far because here is the quiestion
[1/25/18, 11:30:52] Metodi Deriban0xff: How hard is for you to make that distinction between Minerva app running on Normal vs GX stitcher so you can handle the on demand button when running on normal stitcher and leave it passthrough on the GX


	## OnDemand and session switching are handled properly amond the different stitchers

# Parental Input works for VOD

# Parental Input works for Live TV

# Parental Input works as a separate page

# Parental Settings are mapped correctly to the Zodiac Platform

	## When launching Minerva session
	## When Parental Expires automatically
	## When User locks/unlocks parental controle manually
	## When Operator changes parental level on a certain content


# Session switching from inside the Minerva app when selecting VOD header ( soft navigation )

# History and parental timeout after session swtich





**** TODO

Mark this biuld as Stable
