tests-accessing rows/columns
testAtColumn
	| foo |
	foo := self arrayClass width: 3 height: 5.
	foo atColumn: 2 put: #(1 2 3 4 5).
	self assert: (foo atColumn: 2) equals: #(1 2 3 4 5)