tests-private
testNewRow
		| foo |
	foo := self arrayClass new dimension: 2 @ 2.
	self assert: (foo newRow) equals: #(nil nil)