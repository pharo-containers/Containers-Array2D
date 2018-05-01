tests-private
testWidthHeightType
	| foo |
	foo := self arrayClass new.
	foo width: 3 height: 2 type: Array.
	self assert: foo width equals: 3.
	self assert: foo size equals: 3 * 2.
	foo do: [ :each | self assert: each equals: nil ]