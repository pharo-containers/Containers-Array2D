tests-private
testFromArray
	
	| a2 |
	a2 := self arrayClass fromArray: #( 0 2 4
					6 8 10 ) width: 3.
	self assert: a2 width equals: 3.
	self assert: a2 height equals: 2.
	self assert: (a2 atRow: 1) equals: #(0 2 4). 
	self assert: (a2 atRow: 2) equals: #(6 8 10). 
	