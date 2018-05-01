tests-private
testSetContents
	| foo |
	foo := self arrayClass width: 2 height: 3.
	foo setContents: #(1 1 3 1 1 2).
	self assert: (foo atRow: 1) equals: #(1 1).
	self assert: (foo atRow: 2) equals: #(3 1).
	self assert: (foo atRow: 3) equals: #(1 2).