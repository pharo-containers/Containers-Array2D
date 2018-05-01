*Containers-Array2D
pointTo: aPoint do: aPointExpectingBlock
	"Execute aPointExpectingBlock on all the points between the received and aPoint."
	
	self x to: aPoint x do: 
		[ :eachX | 
			self y to: aPoint y do: [ :eachY | aPointExpectingBlock value: eachX @ eachY ] ]