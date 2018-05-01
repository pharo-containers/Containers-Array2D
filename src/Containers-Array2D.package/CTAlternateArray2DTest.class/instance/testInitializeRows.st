tests-initialize
testInitializeRows
	| foo |
	foo := self arrayClass new dimension: 2 @ 2.
	self assert: foo rows equals: #( #(nil nil) #(nil nil) ).