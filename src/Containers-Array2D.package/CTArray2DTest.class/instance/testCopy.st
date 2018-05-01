tests-copying
testCopy
	| foo cop |
	foo := self arrayClass width: 5 height: 3.
	foo atAllPut: 0.
	cop := foo copy.
	self assert: cop width equals: 5.
	self assert: cop height equals: 3.
	1 to: cop width do: [ :x | 1 to: cop height do: [ :y | self assert: (cop atColumn: x atRow: y) equals: 0 ] ].
	self deny: cop == foo