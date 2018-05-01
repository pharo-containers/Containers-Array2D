tests-private
testIndexXY
	| foo |
	foo := self arrayClass width: 5 height: 20.

	self assert: (foo indexX: 2 y: 3) equals: (3-1)*(foo width)+2 