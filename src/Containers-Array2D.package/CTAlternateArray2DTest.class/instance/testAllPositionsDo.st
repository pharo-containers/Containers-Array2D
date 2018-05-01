tests-iterate
testAllPositionsDo
	| count |
	count := 0.
	self arrayClass width2Height3
		allPositionsDo: [ :each | 
			(self arrayClass width2Height3 at: each) even
				ifTrue: [ count := count + 1 ] ].
	self assert: count equals: 3