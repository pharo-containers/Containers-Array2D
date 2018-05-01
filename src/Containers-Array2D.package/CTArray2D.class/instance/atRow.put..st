accessing rows/columns
atRow: y put: aCollection
	"Put in a whole row."

	aCollection size = self width ifFalse: [self error: 'wrong row size'].
	aCollection doWithIndex: [:value :x | self atColumn: x atRow: y put: value].
	^ aCollection