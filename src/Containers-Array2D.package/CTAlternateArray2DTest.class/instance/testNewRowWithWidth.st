tests-private
testNewRowWithWidth
	| foo |
	foo := self arrayClass new dimension: 2@2.
	self assert: (foo newRowWithWidth: 2)  equals: #(nil nil)