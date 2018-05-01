tests-accessing
testAtPut
	| foo |
	
	foo := self arrayClass new dimension: 2@3.
	foo at: 1@3 put: 12.
	
	self assert: (foo at: 1 @ 3) equals: 12