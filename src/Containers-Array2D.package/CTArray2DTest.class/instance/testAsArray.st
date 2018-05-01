tests-converting
testAsArray
	| foo |
	foo := self arrayClass width: 3 height: 3.
	foo atAllPut: 0.
	self assert: foo asArray equals: #(0 0 0 0 0 0 0 0 0)