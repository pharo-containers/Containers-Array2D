tests-accessing
testAtColumnAtRowPut
	| foo |
	foo := self arrayClass width: 5 height: 20.
	foo atColumn: 1 atRow: 1 put: 12.
	self assert: (foo atColumn: 1 atRow: 1) equals: 12