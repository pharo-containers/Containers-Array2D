tests-accessing
testAtPut
		| foo |
	foo := self arrayClass width: 5 height: 20.
	foo at: 1@1 put: 12.
	self assert: (foo at: 1@1) equals: 12