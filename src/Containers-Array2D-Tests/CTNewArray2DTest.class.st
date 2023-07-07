Class {
	#name : #CTNewArray2DTest,
	#superclass : #TestCase,
	#category : #'Containers-Array2D-Tests'
}

{ #category : #running }
CTNewArray2DTest >> arrayClass [

	^ CTNewArray2D 
]

{ #category : #running }
CTNewArray2DTest >> testAsArray [
	| foo |
	foo := self arrayClass width: 3 height: 3.
	foo atAllPut: 0.
	self assert: foo asArray equals: #(0 0 0 0 0 0 0 0 0)
]

{ #category : #running }
CTNewArray2DTest >> testAt [
	
	self assert: (self arrayClass width2Height3 at: 1@1) equals: 1.
	self assert: (self arrayClass width2Height3 at: 1@2) equals: 3.
	self assert: (self arrayClass width2Height3 at: 2@3) equals: 6
]

{ #category : #running }
CTNewArray2DTest >> testAtAllPut [
	| foo |
	foo := self arrayClass width: 2 height: 3.
	foo atAllPut: 12.
	foo do: [ :each | self assert: each equals: 12 ]
]

{ #category : #tests }
CTNewArray2DTest >> testAtPut [
	
	| foo |
	foo := self arrayClass width2Height3.
	foo at: 1@3 put: 12.
	self assert: (foo at: 1@3) equals: 12
]

{ #category : #tests }
CTNewArray2DTest >> testCollect [

	| foo bar newArray|
	foo := self arrayClass width2Height3.
	newArray := self arrayClass fromArray: #( 3 4 5 6 7 8 ) width: 2.
	bar := foo collect: [ :each | each + 2 ].

	self assert: bar equals: newArray
]

{ #category : #tests }
CTNewArray2DTest >> testCopy [
	| foo cop |
	foo := self arrayClass width2Height3.
	cop := foo copy.
	self assert: cop width equals: 2.
	self assert: cop height equals: 3.
	cop withIndexes: [ :x :y | self assert: (cop at: x@y) = (foo at: x@y)].
	self deny: cop identicalTo: foo
]

{ #category : #tests }
CTNewArray2DTest >> testDo [

	| foo nb |
	foo := self arrayClass width2Height3.
	foo atAllPut: 0.
	foo atColumn: 2 atRow: 2 put: 1.
	nb := 0.

	"foo looks like that: #( 0 0 
									0 1
									0 0 )"
	foo do: [ :each | each = 0 ifFalse: [ nb := each ] ].

	"nb should be equal to 1"
	self assert: nb equals: 1
]

{ #category : #tests }
CTNewArray2DTest >> testExtent [
	
	self assert: (self arrayClass width2Height3) extent equals: 2 @ 3
]

{ #category : #tests }
CTNewArray2DTest >> testExtentFromArray [
	| foo |
	foo := self arrayClass width2Height3 .
	foo extent: 3 @ 2 fromArray: #(1 2 3 4 5 6).
	self assert: foo width equals: 3.
	self assert: (foo at: 1 @ 1) equals: 1.
	self assert: (foo at: 2 @ 1) equals: 2.
	self assert: (foo at: 3 @ 1) equals: 3.
	self assert: (foo at: 1 @ 2) equals: 4.
	self assert: (foo at: 2 @ 2) equals: 5.
	self assert: (foo at: 3 @ 2) equals: 6
]

{ #category : #tests }
CTNewArray2DTest >> testFromArray [
	
	| a2 |
	a2 := self arrayClass fromArray: #( 0 2 4
					6 8 10 ) width: 3.
	self assert: a2 width equals: 3.
	self assert: a2 height equals: 2.
	self assert: (a2 atRow: 1) equals: #(0 2 4). 
	self assert: (a2 atRow: 2) equals: #(6 8 10). 
	
]

{ #category : #tests }
CTNewArray2DTest >> testFromBottomToTopFromLeftToRightDo [
	|foo res|
	foo := self arrayClass width2Height3.
	res := OrderedCollection new.
	foo fromBottomToTopFromLeftToRightDo: [ :each | res add: each ].
	self assert: res equals: #(5 3 1 6 4 2) asOrderedCollection
]

{ #category : #tests }
CTNewArray2DTest >> testFromBottomToTopFromRightToLeftDo [
	|foo res|
	foo := self arrayClass width2Height3.
	res := OrderedCollection new.
	foo fromBottomToTopFromRightToLeftDo: [ :each | res add: each ].
	self assert: res equals: #(6 4 2 5 3 1) asOrderedCollection
]

{ #category : #tests }
CTNewArray2DTest >> testFromLeftToRightFromBottomToTopDo [
	|foo res|
	foo := self arrayClass width2Height3.
	res := OrderedCollection new.
	foo fromLeftToRightFromBottomToTopDo: [ :each | res add: each ].
	self assert: res equals: #(5 6 3 4 1 2) asOrderedCollection
]

{ #category : #tests }
CTNewArray2DTest >> testFromLeftToRightFromTopToBottomDo [
	|foo res|
	foo := self arrayClass width2Height3.
	res := OrderedCollection new.
	foo fromLeftToRightFromTopToBottomDo: [ :each | res add: each ].
	self assert: res equals: #(1 2 3 4 5 6) asOrderedCollection
]

{ #category : #tests }
CTNewArray2DTest >> testFromRightToLeftFromBottomToTopDo [
	|foo res|
	foo := self arrayClass width2Height3.
	res := OrderedCollection new.
	foo fromRightToLeftFromBottomToTopDo: [ :each | res add: each ].
	self assert: res equals: #(6 5 4 3 2 1) asOrderedCollection
]

{ #category : #tests }
CTNewArray2DTest >> testFromRightToLeftFromTopToBottomDo [
	|foo res|
	foo := self arrayClass width2Height3.
	res := OrderedCollection new.
	foo fromRightToLeftFromTopToBottomDo: [ :each | res add: each ].
	self assert: res equals: #(2 1 4 3 6 5) asOrderedCollection
]

{ #category : #tests }
CTNewArray2DTest >> testFromTopToBottomFromLeftToRightDo [
	|foo res|
	foo := self arrayClass width2Height3.
	res := OrderedCollection new.
	foo fromTopToBottomFromLeftToRightDo: [ :each | res add: each ].
	self assert: res equals: #(1 3 5 2 4 6) asOrderedCollection
]

{ #category : #tests }
CTNewArray2DTest >> testFromTopToBottomFromRightToLeftDo [
	|foo res|
	foo := self arrayClass width2Height3.
	res := OrderedCollection new.
	foo fromTopToBottomFromRightToLeftDo: [ :each | res add: each ].
	self assert: res equals: #(2 4 6 1 3 5) asOrderedCollection
]

{ #category : #tests }
CTNewArray2DTest >> testHeight [

	self assert: (self arrayClass width2Height3) height equals: 3.
]

{ #category : #tests }
CTNewArray2DTest >> testIndexOfXY [
	| foo |
	foo := self arrayClass width2Height3.

	self assert: (foo indexOfX: 2 y: 3) equals: (3-1)*(foo width)+2 
]

{ #category : #tests }
CTNewArray2DTest >> testPrinting [

	self 
		assert: self arrayClass width2Height3 printString
		equals: 'CTNewArray2DRowsAndColumns fromArray: #(1 2 3 4 5 6) width: 2'
]

{ #category : #tests }
CTNewArray2DTest >> testReject [

	| foo bar |
	foo := self arrayClass width2Height3.

	bar := foo reject: [ :each | each even ].

	self assert: bar equals: #( 1 3 5 )
]

{ #category : #tests }
CTNewArray2DTest >> testRotateLeft [ 

	|foo bar|
	foo := self arrayClass width2Height3.
	bar := foo rotateLeft.
	self assert: bar width equals: 3.
	self assert: bar asArray equals: #( 2 4 6 1 3 5) asOrderedCollection
]

{ #category : #tests }
CTNewArray2DTest >> testRotateRight [

	| foo bar |
	foo := self arrayClass width2Height3.
	bar := foo rotateRight.
	self assert: bar width equals: 3.
	self assert: bar asArray equals: #( 5 3 1 6 4 2 ) asOrderedCollection
]

{ #category : #tests }
CTNewArray2DTest >> testSelect [

	| foo bar |
	foo := self arrayClass width2Height3.

	bar := foo select: [ :each | each even ].

	self assert: bar equals: #( 2 4 6 )
]

{ #category : #tests }
CTNewArray2DTest >> testSetContents [
	| foo |
	foo := self arrayClass width2Height3.
	foo setContents: #(1 1 3 1 1 2).
	self assert: (foo at: 1 @ 1) equals: 1.
	self assert: (foo at: 2 @ 1) equals: 1.
	self assert: (foo at: 1 @ 2) equals: 3.
	self assert: (foo at: 2 @ 2) equals: 1.
	self assert: (foo at: 1 @ 3) equals: 1.
	self assert: (foo at: 2 @ 3) equals: 2
]

{ #category : #tests }
CTNewArray2DTest >> testSetHeight [
	| foo |
	foo := self arrayClass width2Height3.
	foo setHeight: 2.
	self assert: foo height equals: 2
]

{ #category : #tests }
CTNewArray2DTest >> testSetWidth [
	| foo |
	foo := self arrayClass width2Height3.
	foo setWidth: 3.
	self assert: foo width equals: 3
]

{ #category : #tests }
CTNewArray2DTest >> testSize [
	| foo |
	foo := self arrayClass width2Height3.
	self assert: foo size equals: foo width * foo height
]

{ #category : #tests }
CTNewArray2DTest >> testWidth [

	self assert: (self arrayClass width2Height3) width
 equals: 2
]

{ #category : #tests }
CTNewArray2DTest >> testWidthHeightTabulate [

	| foo array |
	foo := self arrayClass
		       width: 2
		       height: 3
		       tabulate: [ :column :row | row * 10 + column ].
	array := #( 11 12 21 22 31 32 ).
	foo withIndexes: [ :columnIndex :rowIndex | 
		self
			assert: (foo at: columnIndex @ rowIndex)
			equals: (array at: rowIndex - 1 * 2 + columnIndex) ]
]

{ #category : #tests }
CTNewArray2DTest >> testWidthHeightType [
	| foo |
	foo := self arrayClass new.
	foo width: 3 height: 2 type: Array.
	self assert: foo width equals: 3.
	self assert: foo size equals: 3 * 2.
	foo do: [ :each | self assert: each equals: nil ]
]

{ #category : #tests }
CTNewArray2DTest >> testWithIndexes [
	| foo value|
	value:= 1.
	foo := self arrayClass width2Height3.   
	foo withIndexes: [ :columnIndex :rowIndex |
		self assert: (foo contents at: ((rowIndex - 1) * 2 + columnIndex))
			equals: value.
		value := value + 1 
		 ]

]

{ #category : #tests }
CTNewArray2DTest >> testWithIndexesDo [
	| foo array |
	array := #(1 2 3 4 5 6).
	foo := self arrayClass width2Height3.   
	foo withIndexesDo: [ :columnIndex :rowIndex :value |
		self assert: (array at: ((rowIndex - 1) * 2 + columnIndex))
			equals: value 
		 ]

]

{ #category : #tests }
CTNewArray2DTest >> testWithIndexesDoPut [

	|array|
	array := self arrayClass width2Height3.
	array withIndexesDoPut: [ :column :row :each | (column * 100) + (row * 10) + each ].
	self assert: array contents equals: #(111 212 123 224 135 236)
]

{ #category : #tests }
CTNewArray2DTest >> testwithIndexesPut [

	| foo array |
	foo := self arrayClass width2Height3.
	self
		shouldnt: [ foo withIndexesPut: [ :columnIndex :rowIndex | rowIndex * 10 + columnIndex ] ]
		raise: Error.
	array := #( 11 12 21 22 31 32 ).
	foo withIndexes: [ :columnIndex :rowIndex | 
		self
			assert: (foo at: columnIndex @ rowIndex )
			equals: (array at: rowIndex - 1 * 2 + columnIndex) ]
]
