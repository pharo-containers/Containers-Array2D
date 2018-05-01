accessing
at: aPoint put: anObject
	| row |
	row := self atRow: aPoint y.
	row atWrap: aPoint x put: anObject