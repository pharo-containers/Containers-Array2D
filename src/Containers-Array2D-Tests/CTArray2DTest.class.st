Class {
	#name : #CTArray2DTest,
	#superclass : #TestCase,
	#category : #'Containers-Array2D-Tests'
}

{ #category : #running }
CTArray2DTest >> arrayClass [

	^ CTArray2D
]

{ #category : #running }
CTArray2DTest >> classUnderTest [

	^ CTArray2D
]

{ #category : #'tests-converting' }
CTArray2DTest >> testAsArray [
	| foo |
	foo := self arrayClass width: 3 height: 3.
	foo atAllPut: 0.
	self assert: foo asArray equals: #(0 0 0 0 0 0 0 0 0)
]

{ #category : #'tests-converting' }
CTArray2DTest >> testAsArray2 [
	self
		assert: self arrayClass width2Height3 asArray
		equals: #(1 2 3 4 5 6)
]

{ #category : #'tests-accessing' }
CTArray2DTest >> testAt [
	self assert: (self arrayClass width2Height3 at: 1@1) equals: 1.
	self assert: (self arrayClass width2Height3 at: 1@2) equals: 3.
	self assert: (self arrayClass width2Height3 at: 2@3) equals: 6
]

{ #category : #'tests-accessing' }
CTArray2DTest >> testAtAllPut [
	| foo |
	foo := self arrayClass width: 5 height: 20.
	foo atAllPut: 12.
	foo do: [ :each | self assert: each equals: 12 ]
]

{ #category : #'tests-accessing rows/columns' }
CTArray2DTest >> testAtColumn [
	| foo |
	foo := self arrayClass width: 3 height: 5.
	foo atColumn: 2 put: #(1 2 3 4 5).
	self assert: (foo atColumn: 2) equals: #(1 2 3 4 5)
]

{ #category : #'tests-accessing' }
CTArray2DTest >> testAtColumnAtRow [
	self assert: (self arrayClass width2Height3 atColumn: 1 atRow: 1) equals: 1.
	self assert: (self arrayClass width2Height3 atColumn: 1 atRow: 2) equals: 3.
	self assert: (self arrayClass width2Height3 atColumn: 2 atRow: 3) equals: 6
]

{ #category : #'tests-accessing' }
CTArray2DTest >> testAtColumnAtRowPut [
	| foo |
	foo := self arrayClass width: 5 height: 20.
	foo atColumn: 1 atRow: 1 put: 12.
	self assert: (foo atColumn: 1 atRow: 1) equals: 12
]

{ #category : #'tests-accessing rows/columns' }
CTArray2DTest >> testAtColumnNotInBounds [
	| foo |
	foo := self arrayClass width: 3 height: 5.
	self should: [ foo atColumn: 0 ] raise: SubscriptOutOfBounds.
	self should: [ foo atColumn: 6 ] raise: SubscriptOutOfBounds
]

{ #category : #'tests-accessing rows/columns' }
CTArray2DTest >> testAtColumnPut [
	| foo |
	foo := self arrayClass width: 3 height: 5.
	foo atColumn: 2 put: #(1 1 1 1 1).
	1 to: foo height do: [ :y | self assert: (foo atColumn: 2 atRow: y) equals: 1 ]
]

{ #category : #'tests-accessing' }
CTArray2DTest >> testAtPut [
		| foo |
	foo := self arrayClass width: 5 height: 20.
	foo at: 1@1 put: 12.
	self assert: (foo at: 1@1) equals: 12
]

{ #category : #'tests-accessing rows/columns' }
CTArray2DTest >> testAtRow [
	| foo |
	foo := self arrayClass width: 5 height: 3.
	foo atRow: 2 put: #(1 2 3 4 5).
	self assert: (foo atRow: 2) equals: #(1 2 3 4 5)
]

{ #category : #'tests-accessing rows/columns' }
CTArray2DTest >> testAtRowPut [
	| foo |
	foo := self arrayClass width: 5 height: 3.
	foo atRow: 2 put: #(1 1 1 1 1).
	1 to: foo width do: [ :x | self assert: (foo atColumn: x atRow: 2) equals: 1 ]
]

{ #category : #'tests-accessing' }
CTArray2DTest >> testAtXAtY [
	self assert: (self arrayClass width2Height3 atX: 1 atY: 1) equals: 1.
	self assert: (self arrayClass width2Height3 atX: 1 atY: 2) equals: 3.
	self assert: (self arrayClass width2Height3 atX: 2 atY: 3) equals: 6
]

{ #category : #'tests-accessing' }
CTArray2DTest >> testAtXAtYPut [
	
	| foo |
	foo := self arrayClass width: 5 height: 20.
	foo atX: 1 atY: 1 put: 12.
	self assert: (foo atX: 1 atY: 1) equals: 12
]

{ #category : #'tests-converting' }
CTArray2DTest >> testCannotAccessWithWrongCoordinates [
	self should: [ self arrayClass width2Height3 atColumn: 6 atRow: 1 ] raise: SubscriptOutOfBounds
]

{ #category : #'tests-copying' }
CTArray2DTest >> testCopy [
	| foo cop |
	foo := self arrayClass width: 5 height: 3.
	foo atAllPut: 0.
	cop := foo copy.
	self assert: cop width equals: 5.
	self assert: cop height equals: 3.
	1 to: cop width do: [ :x | 1 to: cop height do: [ :y | self assert: (cop atColumn: x atRow: y) equals: 0 ] ].
	self deny: cop identicalTo: foo
]

{ #category : #'tests-enumeration' }
CTArray2DTest >> testDo [
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
]

{ #category : #'tests-enumeration' }
CTArray2DTest >> testDo2 [
	| count |
	count := 0.
	self arrayClass width2Height3 do: [ :each | each even ifTrue: [ count := count + 1] ].

	self assert: count equals: 3
]

{ #category : #'tests-accessing' }
CTArray2DTest >> testExtent [
	
	self assert: (self arrayClass width: 5 height: 20) extent equals: 5 @ 20
]

{ #category : #'tests-private' }
CTArray2DTest >> testExtentFromArray [
	| foo |
	foo := self arrayClass width: 2 height: 2.
	foo atAllPut: 0.
	foo extent: 3 @ 2 fromArray: #(1 2 3 4 5 6).
	self assert: foo width equals: 3.
	self assert: (foo atColumn: 1 atRow: 1) equals: 1.
	self assert: (foo atColumn: 2 atRow: 1) equals: 2.
	self assert: (foo atColumn: 3 atRow: 1) equals: 3.
	self assert: (foo atColumn: 1 atRow: 2) equals: 4.
	self assert: (foo atColumn: 2 atRow: 2) equals: 5.
	self assert: (foo atColumn: 3 atRow: 2) equals: 6
]

{ #category : #'tests-private' }
CTArray2DTest >> testFromArray [
	
	| a2 |
	a2 := self arrayClass fromArray: #( 0 2 4
					6 8 10 ) width: 3.
	self assert: a2 width equals: 3.
	self assert: a2 height equals: 2.
	self assert: (a2 atRow: 1) equals: #(0 2 4). 
	self assert: (a2 atRow: 2) equals: #(6 8 10). 
	
]

{ #category : #'tests-accessing' }
CTArray2DTest >> testHeight [

	self assert: (self arrayClass width: 5 height: 20) height equals: 20.
]

{ #category : #'tests-private' }
CTArray2DTest >> testIndexXY [
	| foo |
	foo := self arrayClass width: 5 height: 20.

	self assert: (foo indexX: 2 y: 3) equals: (3-1)*(foo width)+2 
]

{ #category : #'tests - printing' }
CTArray2DTest >> testPrinting [

	self 
		assert: self classUnderTest width2Height3 printString
		equals: '(
1 2
3 4
)'
]

{ #category : #tests }
CTArray2DTest >> testRowAndColumnValuesDo [
	| foo array |
	array := #(1 2 3 4 5 6).
	foo := self classUnderTest width2Height3.   
	foo rowAndColumnValuesDo: [ :y :x :value |
		self assert: (array at: ((y-1) * 2 + x))
			equals: value 
		 ]

]

{ #category : #'tests-enumeration' }
CTArray2DTest >> testRowsAndColumnsDo [
	| foo array |
	foo := self arrayClass width2Height3.
	self shouldnt: [ foo rowsAndColumnsDo: [ :row :col |  ] ] raise: Error.
	array := #(1 2 3 4 5 6).
	foo := self arrayClass width2Height3.
	foo rowsAndColumnsDo: [ :y :x | self assert: (foo atColumn: x atRow: y) equals: (array at: (y - 1) * 2 + x) ]
]

{ #category : #'tests-private' }
CTArray2DTest >> testSetContents [
	| foo |
	foo := self arrayClass width: 2 height: 3.
	foo setContents: #(1 1 3 1 1 2).
	self assert: (foo atRow: 1) equals: #(1 1).
	self assert: (foo atRow: 2) equals: #(3 1).
	self assert: (foo atRow: 3) equals: #(1 2).
]

{ #category : #'tests-private' }
CTArray2DTest >> testSetWidth [
	| foo |
	foo := self arrayClass width: 2 height: 3.
	foo setWidth: 3.
	self assert: foo width equals: 3
]

{ #category : #'tests-accessing' }
CTArray2DTest >> testSize [
	| foo |
	foo := self arrayClass width: 5 height: 20.
	self assert: foo size equals: foo width * foo height
]

{ #category : #'tests-accessing' }
CTArray2DTest >> testWidth [

	self assert: (self arrayClass width: 5 height: 20) width
 equals: 5
]

{ #category : #'tests-private' }
CTArray2DTest >> testWidthHeightType [
	| foo |
	foo := self arrayClass new.
	foo width: 3 height: 2 type: Array.
	self assert: foo width equals: 3.
	self assert: foo size equals: 3 * 2.
	foo do: [ :each | self assert: each equals: nil ]
]
