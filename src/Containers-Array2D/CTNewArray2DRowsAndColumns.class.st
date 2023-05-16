Class {
	#name : #CTNewArray2DRowsAndColumns,
	#superclass : #CTNewArray2D,
	#category : #'Containers-Array2D'
}

{ #category : #accessing }
CTNewArray2DRowsAndColumns >> atColumn: x [
	"Answer the content of the whole column at index x"

	| column |
	column := contents class new: self height.
	1 to: self height do: [ :index | column at: index put: (self atColumn: x atRow: index) ].
	^ column
]

{ #category : #accessing }
CTNewArray2DRowsAndColumns >> atColumn: x atRow: y [
	"Answer the element at index x, y."

	^ contents at: (self indexOfX: x y: y)
]

{ #category : #accessing }
CTNewArray2DRowsAndColumns >> atColumn: x atRow: y put: value [
	"Store a value at index x,y and answer it."

	^ contents at: (self indexOfX: x y: y) put: value
]

{ #category : #accessing }
CTNewArray2DRowsAndColumns >> atColumn: x put: aCollection [
	"Put in a whole column."

	aCollection size = self height ifFalse: [self error: 'wrong column size'].
	aCollection doWithIndex: [:value :y | self atColumn: x atRow: y put: value].
	^ aCollection
]

{ #category : #accessing }
CTNewArray2DRowsAndColumns >> atRow: y [
	"Answer the content of the whole column at y"

	(y < 1 or: [ y > self height ])
		ifTrue: [ self errorSubscriptBounds: y ].
	^ contents copyFrom: (y - 1) * width + 1 to: y * width
]

{ #category : #accessing }
CTNewArray2DRowsAndColumns >> atRow: y put: aCollection [
	"Put in a whole row."

	aCollection size = self width ifFalse: [self error: 'wrong row size'].
	aCollection doWithIndex: [:value :x | self atColumn: x atRow: y put: value].
	^ aCollection
]

{ #category : #enumerating }
CTNewArray2DRowsAndColumns >> columns [

	"Returns an array of columns."

	"CTArray2D width2Height3 columns >>> #(#(1 3 5) #(2 4 6))"
	"(CTArray2D fromArray: 'ABCDEF' width: 3) columns >>> #('AD' 'BE' 'CF')"

	^ (1 to: self width) collect: [ :columnIndex | self atColumn: columnIndex ]
]

{ #category : #enumerating }
CTNewArray2DRowsAndColumns >> columnsDo: aBlock [
	"Iterate on each column. See also `atColumns:` and `columns`"

	1 to: self width do: [ :i | aBlock value: (self atColumn: i) ]
]

{ #category : #inspector }
CTNewArray2DRowsAndColumns >> printColumnsOn: aStream [

	self columnsDo: [ :column | 
		column printOn: aStream.
		aStream cr ]
]

{ #category : #inspector }
CTNewArray2DRowsAndColumns >> printRowsOn: aStream [

	self rowsDo: [ :row | 
		row printOn: aStream.
		aStream cr ]
]

{ #category : #enumerating }
CTNewArray2DRowsAndColumns >> rows [

	"Returns an array of rows."

	"CTArray2D width2Height3 rows >>> #(#(1 2) #(3 4) #(5 6))"
	"(CTArray2D fromArray: 'ABCDEF' width: 3) rows >>> #('ABC' 'DEF')"

	^ (1 to: self height) collect: [ :rowIndex | self atRow: rowIndex ]
]

{ #category : #enumerating }
CTNewArray2DRowsAndColumns >> rowsDo: aBlock [
	"Iterate on each row. See also `atRow:` and `rows`"

	1 to: self height do: [ :i | aBlock value: (self atRow: i) ]
]
