tests-enumeration
testRowsAndColumnsDo
	| foo array |
	foo := self arrayClass width2Height3.
	self shouldnt: [ foo rowsAndColumnsDo: [ :row :col |  ] ] raise: Error.
	array := #(1 2 3 4 5 6).
	foo := self arrayClass width2Height3.
	foo rowsAndColumnsDo: [ :y :x | self assert: (foo atColumn: x atRow: y) equals: (array at: (y - 1) * 2 + x) ]