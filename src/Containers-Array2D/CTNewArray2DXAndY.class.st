Class {
	#name : #CTNewArray2DXAndY,
	#superclass : #CTNewArray2D,
	#category : #'Containers-Array2D'
}

{ #category : #'instance creation' }
CTNewArray2DXAndY class >> width: width height: height [
	^ CTNewArray2DXAndY basicNew width: width height: height type: Array
]

{ #category : #accessing }
CTNewArray2DXAndY >> arrayOfX [

	"Returns an array of columns."

	"CTArray2D width2Height3 arrayOfX >>> #(#(1 3 5) #(2 4 6))"
	"(CTArray2D fromArray: 'ABCDEF' width: 3) arrayOfX >>> #('AD' 'BE' 'CF')"

	^ (1 to: self width) collect: [ :x | self atX: x ]
]

{ #category : #accessing }
CTNewArray2DXAndY >> arrayOfY [

	"Returns an array of rows."

	"CTArray2D width2Height3 arrayOfY >>> #(#(1 2) #(3 4) #(5 6))"
	"(CTArray2D fromArray: 'ABCDEF' width: 3) arrayOfY >>> #('ABC' 'DEF')"

	^ (1 to: self height) collect: [ :y | self atY: y ]
]

{ #category : #accessing }
CTNewArray2DXAndY >> atX: x [
	"Answer the content of the whole column at index x"

	| column |
	column := contents class new: self height.
	1 to: self height do: [ :index | column at: index put: (self atX: x atY: index) ].
	^ column
]

{ #category : #accessing }
CTNewArray2DXAndY >> atX: x atY: y [
	"Answer the element at index x, y."

	^ contents at: (self indexOfX: x y: y)
]

{ #category : #accessing }
CTNewArray2DXAndY >> atX: x atY: y put: value [
	"Answer the element at index x, y."

	^ contents at: (self indexOfX: x y: y) put: value
]

{ #category : #accessing }
CTNewArray2DXAndY >> atX: x put: aCollection [
	"Put in a whole column."

	aCollection size = self height ifFalse: [self error: 'wrong column size'].
	aCollection doWithIndex: [:value :y | self atX: x atY: y put: value].
	^ aCollection
]

{ #category : #accessing }
CTNewArray2DXAndY >> atY: y [
	"Answer the content of the whole column at y"

	(y < 1 or: [ y > self height ])
		ifTrue: [ self errorSubscriptBounds: y ].
	^ contents copyFrom: (y - 1) * width + 1 to: y * width
]

{ #category : #accessing }
CTNewArray2DXAndY >> atY: y put: aCollection [
	"Put in a whole row."

	aCollection size = self width ifFalse: [self error: 'wrong row size'].
	aCollection doWithIndex: [:value :x | self atX: x atY: y put: value].
	^ aCollection
]

{ #category : #inspector }
CTNewArray2DXAndY >> isSelfEvaluating [

	^ self class == CTNewArray2DXAndY and: [ contents isSelfEvaluating ]
]

{ #category : #inspector }
CTNewArray2DXAndY >> printGridOn: aStream [

	"A raw grid-like representation"

	1 to: self height
		do: [ :y | 
				(self atY: y) 
					do: [ :each | each printOn: aStream ] 
					separatedBy: [ aStream space ].
					aStream cr ].
]

{ #category : #accessing }
CTNewArray2DXAndY >> printXOn: aStream [

	self xDo: [ :x | 
		x printOn: aStream.
		aStream cr ]
]

{ #category : #accessing }
CTNewArray2DXAndY >> printYOn: aStream [

	self yDo: [ :y | 
		y printOn: aStream.
		aStream cr ]
]

{ #category : #accessing }
CTNewArray2DXAndY >> xDo: aBlock [
	"Iterate on each column. See also `atX:` and `arrayOfX`"

	1 to: self width do: [ :x | aBlock value: (self atX: x) ]
]

{ #category : #accessing }
CTNewArray2DXAndY >> yDo: aBlock [
	"Iterate on each row. See also `atY:` and `arrayOfY`"

	1 to: self height do: [ :i | aBlock value: (self atY: i) ]
]
