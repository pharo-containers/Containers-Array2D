accessing
at: aPoint
	| row |
	row := self atRow: aPoint y.
	^ row at: aPoint x