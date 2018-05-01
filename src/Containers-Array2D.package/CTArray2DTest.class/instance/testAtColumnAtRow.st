tests-accessing
testAtColumnAtRow
	self assert: (self arrayClass width2Height3 atColumn: 1 atRow: 1) equals: 1.
	self assert: (self arrayClass width2Height3 atColumn: 1 atRow: 2) equals: 3.
	self assert: (self arrayClass width2Height3 atColumn: 2 atRow: 3) equals: 6