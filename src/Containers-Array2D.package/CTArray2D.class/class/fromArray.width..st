instance creation
fromArray: aCollection width: aSize
	
	(aCollection size \\ aSize) isZero 
		ifFalse: [ ^ self error: 'There is a mismatch between the collection size and the supposed sized to the 2D array' ].
	
	^ self basicNew setWidth: aSize; setContents: aCollection 

	