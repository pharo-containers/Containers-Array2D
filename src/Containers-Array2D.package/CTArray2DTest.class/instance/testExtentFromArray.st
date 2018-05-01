tests-private
testExtentFromArray
	| foo |
	foo := self arrayClass width: 2 height: 2.
	foo atAllPut: 0.
	foo extent: 3 @ 2 fromArray: #(1 2 3 4 5 6).
	self assert: foo width equals: 3.
	self assert: (foo atColumn: 1 atRow: 1) equals: 1.
	self assert: (foo atColumn: 2 atRow: 1) equals: 2.
	self assert: (foo atColumn: 3 atRow: 1) equals: 3.
	self assert: (foo atColumn: 1 atRow: 2) equals: 4.
	self assert: (foo atColumn: 2 atRow: 2) equals: 5.
	self assert: (foo atColumn: 3 atRow: 2) equals: 6