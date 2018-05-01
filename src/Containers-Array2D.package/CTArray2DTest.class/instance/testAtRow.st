tests-accessing rows/columns
testAtRow
	| foo |
	foo := self arrayClass width: 5 height: 3.
	foo atRow: 2 put: #(1 2 3 4 5).
	self assert: (foo atRow: 2) equals: #(1 2 3 4 5)