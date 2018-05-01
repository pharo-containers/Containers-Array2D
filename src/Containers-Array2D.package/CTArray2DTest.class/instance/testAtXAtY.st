tests-accessing
testAtXAtY
	self assert: (self arrayClass width2Height3 atX: 1 atY: 1) equals: 1.
	self assert: (self arrayClass width2Height3 atX: 1 atY: 2) equals: 3.
	self assert: (self arrayClass width2Height3 atX: 2 atY: 3) equals: 6