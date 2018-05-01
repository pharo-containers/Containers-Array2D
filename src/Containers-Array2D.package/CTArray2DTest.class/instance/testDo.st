tests-enumeration
testDo
	| foo nb |
	foo := self arrayClass width: 5 height: 3.
	foo atAllPut: 0.
	foo atColumn: 2 atRow: 2 put: 1.
	nb := 0.

	"foo looks like that: #( 0 0 0 0 0 
									0 1 0 0 0
									0 0 0 0 0 )"
	foo
		do: [ :each | 
			each = 0
				ifFalse: [ nb := each ] ].

	"nb should be equal to 1"
	self assert: nb equals: 1