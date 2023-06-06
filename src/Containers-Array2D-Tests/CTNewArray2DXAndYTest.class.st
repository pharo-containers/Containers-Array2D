Class {
	#name : #CTNewArray2DXAndYTest,
	#superclass : #CTNewArray2DTest,
	#category : #'Containers-Array2D-Tests'
}

{ #category : #running }
CTNewArray2DXAndYTest >> arrayClass [

	^ CTNewArray2DXAndY  
]

{ #category : #tests }
CTNewArray2DXAndYTest >> testArrayOfX [ 
	|foo|
	foo := self arrayClass width2Height3.
	self assert: foo arrayOfX equals: #(#(1 3 5) #(2 4 6))
]

{ #category : #tests }
CTNewArray2DXAndYTest >> testArrayOfY [ 
	|foo|
	foo := self arrayClass width2Height3.
	self assert: foo arrayOfY equals: #(#(1 2) #(3 4) #(5 6))
]

{ #category : #tests }
CTNewArray2DXAndYTest >> testAtX [
	| foo |
	foo := self arrayClass width2Height3.
	self assert: (foo atX: 2) equals: #(2 4 6)
]

{ #category : #tests }
CTNewArray2DXAndYTest >> testAtXAtY [
	
	| matrix |
	matrix := self arrayClass width2Height3.
	self assert: (matrix atX: 1 atY: 1) equals: 1.
	self assert: (matrix atX: 1 atY: 2) equals: 3.
	self assert: (matrix atX: 2 atY: 3) equals: 6
]

{ #category : #tests }
CTNewArray2DXAndYTest >> testAtXAtYPut [
	
	| foo |
	foo := self arrayClass width2Height3.
	foo atX: 1 atY: 1 put: 12.
	self assert: (foo atX: 1 atY: 1) equals: 12
]

{ #category : #tests }
CTNewArray2DXAndYTest >> testAtXNotInBounds [
	| foo |
	foo := self arrayClass width: 3 height: 5.
	self should: [ foo atX: 0 ] raise: SubscriptOutOfBounds.
	self should: [ foo atX: 6 ] raise: SubscriptOutOfBounds
]

{ #category : #tests }
CTNewArray2DXAndYTest >> testAtXPut [
	| foo |
	foo := self arrayClass width2Height3.
	foo atX: 2 put: #(1 1 1).
	1 to: foo height do: [ :y | self assert: (foo atX: 2 atY: y) equals: 1 ]
]

{ #category : #tests }
CTNewArray2DXAndYTest >> testAtY [
	| foo |
	foo := self arrayClass width2Height3.
	self assert: (foo atY: 2) equals: #(3 4)
]

{ #category : #tests }
CTNewArray2DXAndYTest >> testAtYNotInBounds [
	| foo |
	foo := self arrayClass width: 3 height: 5.
	self should: [ foo atY: 0 ] raise: SubscriptOutOfBounds.
	self should: [ foo atY: 6 ] raise: SubscriptOutOfBounds
]

{ #category : #tests }
CTNewArray2DXAndYTest >> testAtYPut [
	| foo |
	foo := self arrayClass width2Height3.
	foo atY: 2 put: #(1 1).
	1 to: foo width do: [ :x | self assert: (foo atX: x atY: 2) equals: 1 ]
]

{ #category : #tests }
CTNewArray2DXAndYTest >> testPrinting [

	self 
		assert: self arrayClass width2Height3 printString
		equals: 'CTNewArray2DXAndY fromArray: #(1 2 3 4 5 6) width: 2'
]

{ #category : #tests }
CTNewArray2DXAndYTest >> testXDo [
	|foo array yIndex|
	foo := self arrayClass width2Height3.
	array:= Array new: 2.
	yIndex := 1.
	foo xDo: [ :x | array at: yIndex put: x.
		 yIndex := yIndex + 1].
	self assert: array equals: #(#(1 3 5) #(2 4 6))
]

{ #category : #tests }
CTNewArray2DXAndYTest >> testYDo [
	|foo array xIndex|
	foo := self arrayClass width2Height3.
	array:= Array new: 3.
	xIndex := 1.
	foo yDo: [ :y | array at: xIndex put: y.
		 xIndex := xIndex + 1].
	self assert: array equals: #(#(1 2) #(3 4) #(5 6))
]
