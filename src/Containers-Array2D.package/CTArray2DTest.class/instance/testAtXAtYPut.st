tests-accessing
testAtXAtYPut
		| foo |
	foo := self arrayClass width: 5 height: 20.
	foo atX: 1 atY: 1 put: 12.
	self assert: (foo atX: 1 atY: 1) equals: 12