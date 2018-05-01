tests-accessing rows/columns
testAtRowPut
	| foo |
	foo := self arrayClass width: 5 height: 3.
	foo atRow: 2 put: #(1 1 1 1 1).
	1 to: foo width do: [ :x | self assert: (foo atColumn: x atRow: 2) equals: 1 ]