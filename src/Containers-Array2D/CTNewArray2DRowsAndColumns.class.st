Class {
	#name : 'CTNewArray2DRowsAndColumns',
	#superclass : 'CTNewArray2D',
	#category : 'Containers-Array2D',
	#package : 'Containers-Array2D'
}

{ #category : 'instance creation' }
CTNewArray2DRowsAndColumns class >> new [

	^ self basicNew
]

{ #category : 'accessing' }
CTNewArray2DRowsAndColumns >> atColumn: columnIndex [
	"Answer the content of the whole column at columnIndex"

	| column |
	column := contents class new: self height.
	1 to: self height do: [ :index | column at: index put: (self atColumn: columnIndex atRow: index) ].
	^ column
]

{ #category : 'accessing' }
CTNewArray2DRowsAndColumns >> atColumn: columnIndex atRow: rowIndex [
	"Answer the element at columnIndex, rowIndex."

	^ contents at: (self indexOfX: columnIndex y: rowIndex )
]

{ #category : 'accessing' }
CTNewArray2DRowsAndColumns >> atColumn: columnIndex atRow: rowIndex put: value [
	"Store a value at columnIndex,rowIndex and answer it."

	^ contents at: (self indexOfX: columnIndex y: rowIndex) put: value
]

{ #category : 'accessing' }
CTNewArray2DRowsAndColumns >> atColumn: columnIndex put: aCollection [
	"Put in a whole column."

	aCollection size = self height ifFalse: [self error: 'wrong column size'].
	aCollection doWithIndex: [:value :rowIndex | self atColumn: columnIndex atRow: rowIndex put: value].
	^ aCollection
]

{ #category : 'accessing' }
CTNewArray2DRowsAndColumns >> atRow: rowIndex [
	"Answer the content of the whole row at rowIndex"

	(rowIndex < 1 or: [ rowIndex > self height ])
		ifTrue: [ self errorSubscriptBounds: rowIndex ].
	^ contents copyFrom: (rowIndex - 1) * width + 1 to: rowIndex * width
]

{ #category : 'accessing' }
CTNewArray2DRowsAndColumns >> atRow: rowIndex put: aCollection [
	"Put in a whole row."

	aCollection size = self width ifFalse: [self error: 'wrong row size'].
	aCollection doWithIndex: [:value :columnIndex | self atColumn: columnIndex atRow: rowIndex put: value].
	^ aCollection
]

{ #category : 'enumerating' }
CTNewArray2DRowsAndColumns >> columns [

	"Returns an array of columns."

	"CTArray2D width2Height3 columns >>> #(#(1 3 5) #(2 4 6))"
	"(CTArray2D fromArray: 'ABCDEF' width: 3) columns >>> #('AD' 'BE' 'CF')"

	^ (1 to: self width) collect: [ :columnIndex | self atColumn: columnIndex ]
]

{ #category : 'enumerating' }
CTNewArray2DRowsAndColumns >> columnsDo: aBlock [
	"Iterate on each column. See also `atColumns:` and `columns`"

	1 to: self width do: [ :i | aBlock value: (self atColumn: i) ]
]

{ #category : 'inspector' }
CTNewArray2DRowsAndColumns >> isSelfEvaluating [

	^ self class == CTNewArray2DRowsAndColumns and: [ contents isSelfEvaluating ]
]

{ #category : 'inspector' }
CTNewArray2DRowsAndColumns >> printColumnsOn: aStream [

	self columnsDo: [ :column | 
		column printOn: aStream.
		aStream cr ]
]

{ #category : 'inspector' }
CTNewArray2DRowsAndColumns >> printGridOn: aStream [

	"A raw grid-like representation"

	1 to: self height 
		do: [ :r | 
				(self atRow: r) 
					do: [ :each | each printOn: aStream ] 
					separatedBy: [ aStream space ].
					aStream cr ].
]

{ #category : 'inspector' }
CTNewArray2DRowsAndColumns >> printRowsOn: aStream [

	self rowsDo: [ :row | 
		row printOn: aStream.
		aStream cr ]
]

{ #category : 'enumerating' }
CTNewArray2DRowsAndColumns >> rows [

	"Returns an array of rows."

	"CTArray2D width2Height3 rows >>> #(#(1 2) #(3 4) #(5 6))"
	"(CTArray2D fromArray: 'ABCDEF' width: 3) rows >>> #('ABC' 'DEF')"

	^ (1 to: self height) collect: [ :rowIndex | self atRow: rowIndex ]
]

{ #category : 'enumerating' }
CTNewArray2DRowsAndColumns >> rowsDo: aBlock [
	"Iterate on each row. See also `atRow:` and `rows`"

	1 to: self height do: [ :i | aBlock value: (self atRow: i) ]
]
