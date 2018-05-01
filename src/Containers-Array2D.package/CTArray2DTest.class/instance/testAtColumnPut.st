tests-accessing rows/columns
testAtColumnPut
	| foo |
	foo := self arrayClass width: 3 height: 5.
	foo atColumn: 2 put: #(1 1 1 1 1).
	1 to: foo height do: [ :y | self assert: (foo atColumn: 2 atRow: y) equals: 1 ]