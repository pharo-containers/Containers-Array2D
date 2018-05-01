tests-copying
testPostCopy
	| foo cop |
	foo := self arrayClass new dimension: 2 @ 3.
	foo at: 2 @ 2 put: 15.
	cop := foo postCopy.
	self assert: cop width equals: 2.
	self assert: cop height equals: 3.
	self assert: cop rows equals: #(#(nil nil) #(nil 15) #(nil nil)).
