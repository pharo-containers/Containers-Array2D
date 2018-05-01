tests-accessing
testAt

	self assert: (self arrayClass width2Height3 at: 2@3) equals: 6.
	self assert: (self arrayClass width2Height3 at: 1@1) equals: 1.