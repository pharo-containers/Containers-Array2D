"
A simple 2D-Array implementation that is growing down. Therefore the first row is on the top.

This class has 2 APIs available:
	- One using Columns and Rows (Default)
	- One using X and Y 
	



"
Class {
	#name : #CTNewArray2D,
	#superclass : #Object,
	#instVars : [
		'width',
		'contents'
	],
	#category : #'Containers-Array2D'
}

{ #category : #geometry }
CTNewArray2D class >> extent: aPoint [
	^ self withColumnSize:  aPoint x andRowSize: aPoint y
]

{ #category : #'instance creation' }
CTNewArray2D class >> fromArray: aCollection width: aSize [
	
	(aCollection size \\ aSize) isZero 
		ifFalse: [ ^ self error: 'There is a mismatch between the collection size and the supposed sized to the 2D array' ].
	
	^ CTNewArray2DRowsAndColumns basicNew setWidth: aSize; setContents: aCollection 

	
]

{ #category : #'instance creation' }
CTNewArray2D class >> new [

	^ self basicNew
]

{ #category : #examples }
CTNewArray2D class >> width2Height3 [
	<sampleInstance>
	"self width2Height3"
	| i |
	i := self width: 2 height: 3.
	i at: 1@1 put: 1.
	i at: 2@1 put: 2.
	i at: 1@2 put: 3.
	i at: 2@2 put: 4.
	i at: 1@3 put: 5.
	i at: 2@3 put: 6.
	^ i
]

{ #category : #'instance creation' }
CTNewArray2D class >> width: width height: height [
	^ CTNewArray2DRowsAndColumns basicNew width: width height: height type: Array
]

{ #category : #'instance creation' }
CTNewArray2D class >> width: width height: height tabulate: aTwoArgumentBlock [
	"Answer a new CTNewArray2D of the given dimensions where
	 result at: x @ y is aTwoArgumentBlock value: x value: y"

	| newArray |
	newArray := CTNewArray2DRowsAndColumns basicNew
		            width: width
		            height: height
		            type: Array.
	1 to: newArray height do: [ :rowIndex |
		1 to: newArray width do: [ :columnIndex |
			newArray
				at: columnIndex @ rowIndex
				put: (aTwoArgumentBlock value: columnIndex value: rowIndex) ] ].
	^ newArray
]

{ #category : #'as yet unclassified' }
CTNewArray2D class >> withColumnSize: width andRowSize: height [
	^ CTNewArray2DRowsAndColumns basicNew width: width height: height type: Array
]

{ #category : #geometry }
CTNewArray2D class >> withColumnsAndRowsExtent: aPoint [
	^ self withColumnSize:  aPoint x andRowSize: aPoint y
]

{ #category : #'instance creation' }
CTNewArray2D class >> withColumnsAndRowsFromArray: aCollection width: aSize [
	
	(aCollection size \\ aSize) isZero 
		ifFalse: [ ^ self error: 'There is a mismatch between the collection size and the supposed sized to the 2D array' ].
	
	^ CTNewArray2DRowsAndColumns basicNew setWidth: aSize; setContents: aCollection 

	
]

{ #category : #geometry }
CTNewArray2D class >> withXAndYExtent: aPoint [
	^ self withXSize: aPoint x andYSize: aPoint y
]

{ #category : #'instance creation' }
CTNewArray2D class >> withXAndYFromArray: aCollection width: aSize [
	
	(aCollection size \\ aSize) isZero 
		ifFalse: [ ^ self error: 'There is a mismatch between the collection size and the supposed sized to the 2D array' ].
	
	^ CTNewArray2DXAndY basicNew setWidth: aSize; setContents: aCollection 

	
]

{ #category : #'instance creation' }
CTNewArray2D class >> withXSize: width andYSize: height [
	^ CTNewArray2DXAndY basicNew width: width height: height type: Array
]

{ #category : #comparing }
CTNewArray2D >> = aNewArray2D [
	"Two array2D are equal if
	 (a) they are the same 'kind' of thing.
	 (b) they have the same dimensions (only check width in fact).
	 (c) the contents are ="

	(aNewArray2D isKindOf: CTNewArray2D) ifFalse: [^false].
	self width = aNewArray2D width ifFalse: [^false].
	^ contents = aNewArray2D contents.
]

{ #category : #converting }
CTNewArray2D >> asArray [
	"return a copy of the receiver"
	^ contents copy
]

{ #category : #accessing }
CTNewArray2D >> at: aPoint [
	"Answer the element at index Point x, Point y."

	^ contents at: (self indexOfX: aPoint x y: aPoint y)
]

{ #category : #accessing }
CTNewArray2D >> at: aPoint put: value [
	"Store a value at index aPoint x, aPoint y and answer it."

	^ contents at: (self indexOfX: aPoint x y: aPoint y) put: value
]

{ #category : #accessing }
CTNewArray2D >> atAllPut: anObject [
	"Put anObject at every one of the receiver's indices."

	contents atAllPut: anObject
]

{ #category : #enumerating }
CTNewArray2D >> collect: aBlock [
	"Iterate with X varying most quickly."
	|newArray|
	newArray := contents collect: aBlock.
	^ self class fromArray: newArray width: self width
]

{ #category : #accessing }
CTNewArray2D >> contents [

	^ contents
]

{ #category : #enumerating }
CTNewArray2D >> do: aBlock [
	"Iterate with X varying most quickly."

	contents do: aBlock
]

{ #category : #accessing }
CTNewArray2D >> extent [
	"Answer the receiver's dimensions as point."

	^ self width @ self height
]

{ #category : #accessing }
CTNewArray2D >> extent: extent fromArray: anArray [
	"Extent the receiver to anArray size and load it with anArray contents "

	extent x * extent y = anArray size
		ifFalse: [ ^ self error: 'dimensions don''t match' ].
	width := extent x.
	contents := anArray
]

{ #category : #enumerating }
CTNewArray2D >> fromBottomToTopFromLeftToRightDo: aBlock [
	"Apply a block to each element following that order bottom to top but from left gto right "
	"123
	 456
	=> 
	415263
	"
	
	  1 to: self width do: [:col |
		self height to: 1 by: -1 do: [:row |
			aBlock  value: (self at: col@row)]]
]

{ #category : #enumerating }
CTNewArray2D >> fromBottomToTopFromRightToLeftDo: aBlock [
	"Apply a block to each element following that order bottom to top but from right to left "
	"123
	 456
	=> 
	635241
	"
	
	  self width to: 1 by: -1 do: [:col |
		self height to: 1 by: -1 do: [:row |
			aBlock  value: (self at: col@row)]]
]

{ #category : #enumerating }
CTNewArray2D >> fromLeftToRightFromBottomToTopDo: aBlock [
	"Apply a block to each element following that order left to right but from bottom to top"
	"123
	456
	=> 
	456123
	"
	
	 self height to: 1 by: -1 do: [:row |
		1 to: self width do: [:col |
			aBlock  value: (self at: col@row)]]
]

{ #category : #enumerating }
CTNewArray2D >> fromLeftToRightFromTopToBottomDo: aBlock [
	"Apply a block to each element following that order left to right but from top to bottom"
	"123
	456
	=> 
	123456
	"
	
	  1 to: self height do: [:row |
		1 to: self width do: [:col |
			aBlock  value: (self at: col@row)]]
]

{ #category : #enumerating }
CTNewArray2D >> fromRightToLeftFromBottomToTopDo: aBlock [
	"Apply a block to each element following that order right to left but from bottom to top"
	"123
	456
	=> 
	654321
	"
	
	 self height to: 1 by: -1 do: [:row |
		self width to: 1 by: -1 do: [:col |
			aBlock  value: (self at: col@row)]]
]

{ #category : #enumerating }
CTNewArray2D >> fromRightToLeftFromTopToBottomDo: aBlock [
	"Apply a block to each element following that order right to left but from top to bottom"
	"123
	456
	=> 
	321654
	"
	
	  1 to: self height do: [:row |
		self width to: 1 by: -1 do: [:col |
			aBlock  value: (self at: col@row)]]
]

{ #category : #enumerating }
CTNewArray2D >> fromTopToBottomFromLeftToRightDo: aBlock [
	"Apply a block to each element following that order top to bottom but from left to right "
	"123
	456
	=> 
	142536
	"
	
	  1 to: self width do: [:col |
		1 to: self height do: [:row |
			aBlock  value: (self at: col@row)]]
]

{ #category : #enumerating }
CTNewArray2D >> fromTopToBottomFromRightToLeftDo: aBlock [
	"Apply a block to each element following that order top to bottom but from right to left "
	"123
	456
	=> 
	362514
	"
	
	  self width to: 1 by: -1 do: [:col |
		1 to: self height do: [:row |
			aBlock  value: (self at: col@row)]]
]

{ #category : #comparing }
CTNewArray2D >> hash [

	^ contents hash + width
]

{ #category : #accessing }
CTNewArray2D >> height [ 
	
	^ contents size // width
]

{ #category : #private }
CTNewArray2D >> indexOfX: x y: y [
	"Answer the receiver coordonnate in 1D, for example:
	  foo := #( 0 2 4
					6 8 10 )
		foo indexOfX: 3 y: 1 gives us the index of the value '4' which is the 3rd value of the array in 1D"
					
					
	(x < 1 or: [ x > width ]) | (y < 1 or: [ y > self height ])
		ifTrue: [ self errorSubscriptBounds: x ].
	^ (y - 1) * width + x
]

{ #category : #inspector }
CTNewArray2D >> isSelfEvaluating [

	^ SubclassResponsibility
]

{ #category : #inspector }
CTNewArray2D >> postCopy [
	super postCopy. 
	self setContents: contents copy
]

{ #category : #printing }
CTNewArray2D >> printGridOn: aStream [
	^ SubclassResponsibility 
]

{ #category : #inspector }
CTNewArray2D >> printOn: aStream [

	"Self evaluating representation is prefered"
	
	"(CTNewArray2D fromArray: #(1 2 3 4 5 6) width: 2) printString >>> 'CTNewArray2D fromArray: #(1 2 3 4 5 6) width: 2'"

	"(CTNewArray2D fromArray: 'abcdef' width: 3) printString >>> 'CTNewArray2D fromArray: ''abcdef'' width: 3'"

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

{ #category : #enumerating }
CTNewArray2D >> reject: aBlock [

	^ contents reject: aBlock
]

{ #category : #'as yet unclassified' }
CTNewArray2D >> rotateLeft [ 
	|tmpArray|
	tmpArray := OrderedCollection new.
	
	self fromTopToBottomFromRightToLeftDo: [ :item | tmpArray add: item ].
	^ CTNewArray2D fromArray: tmpArray width: self height
]

{ #category : #'as yet unclassified' }
CTNewArray2D >> rotateRight [

	| tmpArray |
	tmpArray := OrderedCollection new.

	self fromBottomToTopFromLeftToRightDo: [ :item | tmpArray add: item ].
	^ CTNewArray2D fromArray: tmpArray width: self height
]

{ #category : #enumerating }
CTNewArray2D >> select: aBlock [

	^ contents select: aBlock
]

{ #category : #private }
CTNewArray2D >> setContents: aCollection [
	"set the content of the array with aCollection"
	contents := aCollection
]

{ #category : #inspector }
CTNewArray2D >> setHeight: aSize [
	"Set the height of the receiver. It should be in sync with the size of the internal array used to store the contents, i.e., contents size \\ aSize should always be zero."
	
	self setWidth: contents size // aSize 
]

{ #category : #inspector }
CTNewArray2D >> setWidth: aSize [
	"Set the width of the receiver. It should be in sync with the size of the internal array used to store the contents, i.e., contents size \\ aSize should always be zero."
	
	width := aSize
]

{ #category : #accessing }
CTNewArray2D >> size [ 
	^ contents size 
]

{ #category : #accessing }
CTNewArray2D >> width [
	"Answer the receiver's width, i.e., number of columns or x."

	^ width
]

{ #category : #private }
CTNewArray2D >> width: x height: y type: collectionClass [
	"Set the number of elements in the first and second dimension.
	collectionClass can be Array or String or ByteArray but shouldn't be initialized."

	"contents == nil
		ifFalse: [ self error: 'No runtime size change yet' ]."
		
	"later move all the elements to the new sized array"
	width := x.
	contents := collectionClass new: x * y
]

{ #category : #'as yet unclassified' }
CTNewArray2D >> withIndexes: aBinaryBlock [

	^ self withIndexesDo: [ :columnIndex :rowIndex :item |
		  aBinaryBlock value: columnIndex value: rowIndex ]
]

{ #category : #'as yet unclassified' }
CTNewArray2D >> withIndexesDo: aThreeParametersBlock [

	1 to: self height do: [ :rowIndex |
		1 to: self width do: [ :columnIndex |
			aThreeParametersBlock value: columnIndex value: rowIndex value: (self at: columnIndex @ rowIndex ) ] ]
]

{ #category : #'as yet unclassified' }
CTNewArray2D >> withIndexesPut: aTwoArgumentBlock [
	"Set the value at col,row as the value of aTwoArgumentBlock with row and column as inputs."

	1 to: self height do: [ :rowIndex | 
		1 to: self width do: [ :columnIndex | 
			contents
				at: (self indexOfX: columnIndex y: rowIndex)
				put: (aTwoArgumentBlock value: columnIndex value: rowIndex) ] ]
]
