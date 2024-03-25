"
A simple 2D-Array implementation that is growing down. Therefore the first row is on the top.
Check the numerous tests.

"
Class {
	#name : 'CTArray2D',
	#superclass : 'Object',
	#instVars : [
		'width',
		'contents'
	],
	#category : 'Containers-Array2D',
	#package : 'Containers-Array2D'
}

{ #category : 'instance creation' }
CTArray2D class >> extent: aPoint [
	^ self width: aPoint x height: aPoint y
]

{ #category : 'instance creation' }
CTArray2D class >> fromArray: aCollection width: aSize [
	
	(aCollection size \\ aSize) isZero 
		ifFalse: [ ^ self error: 'There is a mismatch between the collection size and the supposed sized to the 2D array' ].
	
	^ self basicNew setWidth: aSize; setContents: aCollection 

	
]

{ #category : 'instance creation' }
CTArray2D class >> fromRows: rows pad: paddingElement [

	"Allocate an Array2D large enough to accomodate the given rows.
	 paddingElement are used to fill the right end of short rows.
	 If no padding is needed, paddingElement is ignored."

	"(CTArray2D fromRows: #((11 21)()(31)) pad: 0) >>>
	 (CTArray2D fromArray: #(11 21 0 0 31 0) width: 2)"
	
	"(CTArray2D fromRows: { 'aa'. 'bbb'. 'c' } pad: $x) >>>
	 (CTArray2D fromArray: 'aaxbbbcxx' width: 3)"

	"(CTArray2D fromRows: #((11 21)(21 22)) pad: nil) >>>
	 (CTArray2D fromArray: #(11 21 21 22) width: 2)"

	"This method is somewhat the inverse of `rows`:"

	"|tmp| tmp := CTArray2D width2Height3.
	 (CTArray2D fromRows: (tmp rows) pad: nil) >>> tmp"

	"The next example transforms a multi-line text (read from a file for instance) into a CTArray2D:"
	
	"(CTArray2D fromRows: ('aa
bbb
c
' lines) pad: $ ) >>> (CTArray2D fromArray: 'aa bbbc  ' width: 3)"

	| width contents pad |
	width := rows max: [ :row | row size ].
	contents := rows first species new: (width * rows size) streamContents: [ :aStream |
		rows do: [  :row |
			aStream nextPutAll: row.
			pad := width - row size.
			pad > 0 ifTrue: [ aStream next: pad put: paddingElement ].
		]
	].

	^ self fromArray: contents width: width.
]

{ #category : 'instance creation' }
CTArray2D class >> new [

	^ self basicNew
]

{ #category : 'instance creation' }
CTArray2D class >> new: size [
	self error: 'Use >>self width: x height: y<< instead'
]

{ #category : 'examples' }
CTArray2D class >> width2Height3 [
	<sampleInstance>
	"self width2Height3"
	| i |
	i := self width: 2 height: 3.
	i atColumn: 1 atRow: 1 put: 1.
	i atColumn: 2 atRow: 1 put: 2.
	i atColumn: 1 atRow: 2 put: 3.
	i atColumn: 2 atRow: 2 put: 4.
	i atColumn: 1 atRow: 3 put: 5.
	i atColumn: 2 atRow: 3 put: 6.
	^ i
]

{ #category : 'instance creation' }
CTArray2D class >> width: width height: height [
	^ self basicNew width: width height: height type: Array
]

{ #category : 'instance creation' }
CTArray2D class >> width: width height: height tabulate: aTwoArgumentBlock [

	"Answer a new CTArray2D of the given dimensions where
	 result atX: x atY: y is aTwoArgumentBlock value: x value: y"

	| newArray |
	newArray := self basicNew width: width height: height type: Array.
	1 to: newArray width do: [ :x | 
		1 to: newArray height do: [ :y | 
			newArray atX: x atY: y put: (aTwoArgumentBlock value: x value: y) ] ].
	^ newArray
]

{ #category : 'instance creation' }
CTArray2D class >> width: width height: height type: collectionClass [
	^ self basicNew width: width height: height type: collectionClass
]

{ #category : 'comparing' }
CTArray2D >> = anArray2D [
	"Two array2D are equal if
	 (a) they are the same 'kind' of thing.
	 (b) they have the same dimensions (only check width in fact).
	 (c) the contents are ="

	(anArray2D isKindOf: CTArray2D) ifFalse: [^false].
	self width = anArray2D width ifFalse: [^false].
	^ contents = anArray2D contents.
]

{ #category : 'converting' }
CTArray2D >> asArray [
	"return a copy of the receiver"
	^ contents copy
]

{ #category : 'accessing convenience' }
CTArray2D >> at: aPoint [
	"Answer the element at index Point x, Point y."

	^ contents at: (self indexX: aPoint x y: aPoint y)
]

{ #category : 'accessing convenience' }
CTArray2D >> at: aPoint put: value [
	"Store a value at index aPoint x, aPoint y and answer it."

	^ contents at: (self indexX: aPoint x y: aPoint y) put: value
]

{ #category : 'accessing' }
CTArray2D >> atAllPut: anObject [
	"Put anObject at every one of the receiver's indices."

	contents atAllPut: anObject
]

{ #category : 'accessing rows/columns' }
CTArray2D >> atColumn: x [
	"Answer the content of the whole column at index x"

	| column |
	column := contents class new: self height.
	1 to: self height do: [ :index | column at: index put: (self atColumn: x atRow: index) ].
	^ column
]

{ #category : 'accessing rows/columns' }
CTArray2D >> atColumn: x atRow: y [
	"Answer the element at index x, y."

	^ contents at: (self indexX: x y: y)
]

{ #category : 'accessing rows/columns' }
CTArray2D >> atColumn: x atRow: y put: value [
	"Store a value at index x,y and answer it."

	^ contents at: (self indexX: x y: y) put: value
]

{ #category : 'accessing rows/columns' }
CTArray2D >> atColumn: x put: aCollection [
	"Put in a whole column."

	aCollection size = self height ifFalse: [self error: 'wrong column size'].
	aCollection doWithIndex: [:value :y | self atColumn: x atRow: y put: value].
	^ aCollection
]

{ #category : 'accessing rows/columns' }
CTArray2D >> atRow: y [
	"Answer the content of the whole column at y"

	(y < 1 or: [ y > self height ])
		ifTrue: [ self errorSubscriptBounds: y ].
	^ contents copyFrom: (y - 1) * width + 1 to: y * width
]

{ #category : 'accessing rows/columns' }
CTArray2D >> atRow: y put: aCollection [
	"Put in a whole row."

	aCollection size = self width ifFalse: [self error: 'wrong row size'].
	aCollection doWithIndex: [:value :x | self atColumn: x atRow: y put: value].
	^ aCollection
]

{ #category : 'accessing x/y' }
CTArray2D >> atX: x atY: y [
	"Answer the element at index x, y."

	^ contents at: (self indexX: x y: y)
]

{ #category : 'accessing x/y' }
CTArray2D >> atX: x atY: y put: value [
	"Store a value at index x,y and answer it."

	^ contents at: (self indexX: x y: y) put: value
]

{ #category : 'private' }
CTArray2D >> contents [

	^ contents
]

{ #category : 'enumeration' }
CTArray2D >> do: aBlock [
	"Iterate with X varying most quickly."

	contents do: aBlock
]

{ #category : 'accessing' }
CTArray2D >> extent [
	"Answer the receiver's dimensions as point."

	^ self width @ self height
]

{ #category : 'private' }
CTArray2D >> extent: extent fromArray: anArray [
	"Extent the receiver to anArray size and load it with anArray contents "

	extent x * extent y = anArray size
		ifFalse: [ ^ self error: 'dimensions don''t match' ].
	width := extent x.
	contents := anArray
]

{ #category : 'comparing' }
CTArray2D >> hash [

	^ contents hash + width
]

{ #category : 'accessing' }
CTArray2D >> height [
    "Answer the receiver's height, i.e., its number of row/lines or y."

	^ contents size // width
]

{ #category : 'private' }
CTArray2D >> indexX: x y: y [
	"Answer the receiver coordonnate in 1D, for example:
	  foo := #( 0 2 4
					6 8 10 )
		foo indexX: 3 y: 1 gives us the index of the value '4' which is the 3rd value of the array in 1D"
					
					
	(x < 1 or: [ x > width ])
		ifTrue: [ self errorSubscriptBounds: x ].
	^ (y - 1) * width + x
]

{ #category : 'self evaluating' }
CTArray2D >> isSelfEvaluating [

	^ self class == CTArray2D and: [ contents isSelfEvaluating ]
]

{ #category : 'enumerating' }
CTArray2D >> leftToRightFromBottomToTopDo: aBlock [
	"Apply a block to each element following that order left to right but from bottom to top"
	"123
	456
	=> 
	456123
	"
	
	 self height to: 1 by: -1 do: [:row |
		1 to: self width do: [:col |
			aBlock  value: (self atColumn: col atRow: row)]]
]

{ #category : 'accessing - compatibility' }
CTArray2D >> numberOfColumns [
    "Answer the receiver's width, i.e., its number of x"

	^ self width
]

{ #category : 'accessing - compatibility' }
CTArray2D >> numberOfRows [
    "Answer the receiver's height, i.e., its number of row/lines or y."

	^ self height
]

{ #category : 'copying' }
CTArray2D >> postCopy [
	super postCopy. 
	self setContents: contents copy
]

{ #category : 'printing' }
CTArray2D >> printGridOn: aStream [

	"A raw grid-like representation"

	(1 to: self height) 
		do: [ :r | 
				(self atRow: r) 
					do: [ :each | each printOn: aStream ] 
					separatedBy: [ aStream space ].
					aStream cr ].
]

{ #category : 'printing' }
CTArray2D >> printOn: aStream [

	"Self evaluating representation is prefered"
	
	"(CTArray2D fromArray: #(1 2 3 4 5 6) width: 2) printString >>> 'CTArray2D fromArray: #(1 2 3 4 5 6) width: 2'"

	"(CTArray2D fromArray: 'abcdef' width: 3) printString >>> 'CTArray2D fromArray: ''abcdef'' width: 3'"

	self isSelfEvaluating ifTrue: [
		aStream
			nextPutAll: self class name;
			space;
			nextPutAll: #fromArray:;
			space;
			print: contents;
			space;
			nextPutAll: #width:;
			space;
			print: width.
			^ self  ].
	
	aStream nextPutAll: '('; cr.
	self printGridOn: aStream.
	aStream nextPutAll: ')'.
]

{ #category : 'printing' }
CTArray2D >> printRowsOn: aStream [

	self rowsDo: [ :row | 
		row printOn: aStream.
		aStream cr ]
]

{ #category : 'enumeration' }
CTArray2D >> rowAndColumnValuesDo: aBlock [
	"aBlock is expecting three values: row, column and value"
	
	1 to: self width do: [:col |
		1 to: self height do: [:row |
			aBlock value: row value: col value: (self atColumn: col atRow: row)]]
]

{ #category : 'converting' }
CTArray2D >> rows [

	"Returns an array of rows."

	"CTArray2D width2Height3 rows >>> #(#(1 2) #(3 4) #(5 6))"
	"(CTArray2D fromArray: 'ABCDEF' width: 3) rows >>> #('ABC' 'DEF')"

	^ (1 to: self height) collect: [ :rowIndex | self atRow: rowIndex ]
]

{ #category : 'enumeration' }
CTArray2D >> rowsAndColumnsDo: aBlock [
	"rows iteration implies from top to bottom and row elements first, column by column"
	1 to: self width do: [:col |
		1 to: self height do: [:row |
			aBlock value: row value: col]]
]

{ #category : 'enumeration' }
CTArray2D >> rowsAndColumnsPut: aTwoArgumentBlock [
	"Set the value at col,row as the value of aTwoArgumentBlock with row and column as inputs."

	1 to: self width do: [ :col | 
		1 to: self height do: [ :row | 
			contents
				at: (self indexX: col y: row)
				put: (aTwoArgumentBlock value: row value: col) ] ]
]

{ #category : 'enumeration' }
CTArray2D >> rowsDo: aBlock [
	"Iterate on each row. See also `atRow:` and `rows`"

	1 to: self height do: [ :i | aBlock value: (self atRow: i) ]
]

{ #category : 'private' }
CTArray2D >> setContents: aCollection [
	"set the content of the array with aCollection"
	contents := aCollection
]

{ #category : 'private' }
CTArray2D >> setWidth: aSize [
	"Set the width of the receiver. It should be in sync with the size of the internal array used to store the contents, i.e., contents size \\ aSize should always be zero."
	
	width := aSize
]

{ #category : 'accessing' }
CTArray2D >> size [
	^ contents size
]

{ #category : 'enumeration' }
CTArray2D >> topDownDo: aBlock [
	"Iterate with X varying most quickly."

	contents do: aBlock
]

{ #category : 'accessing' }
CTArray2D >> width [
	"Answer the receiver's width, i.e., number of columns or x."

	^ width
]

{ #category : 'private' }
CTArray2D >> width: x height: y type: collectionClass [
	"Set the number of elements in the first and second dimension.
	collectionClass can be Array or String or ByteArray but shouldn't be initialized."

	"contents == nil
		ifFalse: [ self error: 'No runtime size change yet' ]."
		
	"later move all the elements to the new sized array"
	width := x.
	contents := collectionClass new: x * y
]
