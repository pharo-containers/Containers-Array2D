accessing rows/columns
atColumn: x put: aCollection
	"Put in a whole column."

	aCollection size = self height ifFalse: [self error: 'wrong column size'].
	aCollection doWithIndex: [:value :y | self atColumn: x atRow: y put: value].
	^ aCollection