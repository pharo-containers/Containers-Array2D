tests-private
testSetWidth
	| foo |
	foo := self arrayClass width: 2 height: 3.
	foo setWidth: 3.
	self assert: foo width equals: 3