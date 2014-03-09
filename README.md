seagullcentury-iOS
==================

- Notes for making the tab bar icons:
	The pixel size for the icons is 32 x 32

- Maps
	Need to implement the user location on the Built in MapKit
	Need to research if we can actually accomplish the task 

	Apple uses the Mercator Map Projection

- Issues
	- I don't think that it is possible to do what we orginally thought about doing in the design pattern
	iOS will not let you pass the file path as a string to the web browser.  Each are mutally exclusive.  
	You can either pass the file path, to which you can not pass a query variable through.  And the URL path you can
	pass with a query variable but you can not access the HTML file stored locally.  In fact you can not pass the file 
	path as a string to the loadrequest function.

