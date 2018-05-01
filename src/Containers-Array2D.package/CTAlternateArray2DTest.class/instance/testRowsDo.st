tests-iterate
testRowsDo
	self arrayClass width2Height3 rowsDo: [ :each | self assert: each size equals: self arrayClass width2Height3 width ]