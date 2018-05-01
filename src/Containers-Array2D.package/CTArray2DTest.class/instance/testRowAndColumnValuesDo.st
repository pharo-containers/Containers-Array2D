tests
testRowAndColumnValuesDo
	| foo array |
	array := #(1 2 3 4 5 6).
	foo := self arrayClass width2Height3.   
	foo rowAndColumnValuesDo: [ :y :x :value |
		self assert: (array at: ((y-1) * 2 + x))
			equals: value 
		 ]
