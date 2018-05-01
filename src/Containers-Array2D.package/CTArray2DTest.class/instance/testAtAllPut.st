tests-accessing
testAtAllPut
	| foo |
	foo := self arrayClass width: 5 height: 20.
	foo atAllPut: 12.
	foo do: [ :each | self assert: each == 12 ]