tests-iterate
testDo
	| count |
	count := 0.
	
	self arrayClass width2Height3 do: [ :each |  each even ifTrue: [ count := count + 1 ] ].
	self assert: count equals: 3.