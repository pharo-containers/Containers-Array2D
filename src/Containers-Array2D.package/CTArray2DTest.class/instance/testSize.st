tests-accessing
testSize
	| foo |
	foo := self arrayClass width: 5 height: 20.
	self assert: foo size equals: foo width * foo height