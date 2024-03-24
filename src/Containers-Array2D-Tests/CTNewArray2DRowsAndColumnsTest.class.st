Class {
	#name : 'CTNewArray2DRowsAndColumnsTest',
	#superclass : 'CTNewArray2DTest',
	#category : 'Containers-Array2D-Tests',
	#package : 'Containers-Array2D-Tests'
}

{ #category : 'tests' }
CTNewArray2DRowsAndColumnsTest >> testAtColumn [
	| foo |
	foo := self arrayClass width2Height3.
	self assert: (foo atColumn: 2) equals: #(2 4 6)
]

{ #category : 'tests' }
CTNewArray2DRowsAndColumnsTest >> testAtColumnAtRow [
	self assert: (self arrayClass width2Height3 atColumn: 1 atRow: 1) equals: 1.
	self assert: (self arrayClass width2Height3 atColumn: 1 atRow: 2) equals: 3.
	self assert: (self arrayClass width2Height3 atColumn: 2 atRow: 3) equals: 6
]

{ #category : 'tests' }
CTNewArray2DRowsAndColumnsTest >> testAtColumnAtRowPut [
	| foo |
	foo := self arrayClass width2Height3.
	foo atColumn: 1 atRow: 1 put: 12.
	self assert: (foo atColumn: 1 atRow: 1) equals: 12
]

{ #category : 'tests' }
CTNewArray2DRowsAndColumnsTest >> testAtColumnNotInBounds [
	| foo |
	foo := self arrayClass width: 3 height: 5.
	self should: [ foo atColumn: 0 ] raise: SubscriptOutOfBounds.
	self should: [ foo atColumn: 6 ] raise: SubscriptOutOfBounds
]

{ #category : 'tests' }
CTNewArray2DRowsAndColumnsTest >> testAtColumnPut [
	| foo |
	foo := self arrayClass width2Height3.
	foo atColumn: 2 put: #(1 1 1).
	1 to: foo height do: [ :rowIndex | self assert: (foo atColumn: 2 atRow: rowIndex) equals: 1 ]
]

{ #category : 'tests' }
CTNewArray2DRowsAndColumnsTest >> testAtRow [
	| foo |
	foo := self arrayClass width2Height3 .
	self assert: (foo atRow: 2) equals: #(3 4)
]

{ #category : 'tests' }
CTNewArray2DRowsAndColumnsTest >> testAtRowNotInBounds [
	| foo |
	foo := self arrayClass width: 3 height: 5.
	self should: [ foo atRow: 0 ] raise: SubscriptOutOfBounds.
	self should: [ foo atRow: 6 ] raise: SubscriptOutOfBounds
]

{ #category : 'tests' }
CTNewArray2DRowsAndColumnsTest >> testAtRowPut [
	| foo |
	foo := self arrayClass width2Height3.
	foo atRow: 2 put: #(1 1).
	self assert: (foo atRow: 2) equals: #(1 1)
]

{ #category : 'tests' }
CTNewArray2DRowsAndColumnsTest >> testColumns [ 
	|foo|
	foo := self arrayClass width2Height3.
	self assert: foo columns equals: #(#(1 3 5) #(2 4 6))
]

{ #category : 'tests' }
CTNewArray2DRowsAndColumnsTest >> testColumnsDo [
	|foo array rowIndex|
	foo := self arrayClass width2Height3.
	array:= Array new: 2.
	rowIndex := 1.
	foo columnsDo: [ :column | array at: rowIndex put: column.
		 rowIndex := rowIndex + 1].
	self assert: array equals: #(#(1 3 5) #(2 4 6))
]

{ #category : 'tests' }
CTNewArray2DRowsAndColumnsTest >> testRows [ 
	|foo|
	foo := self arrayClass width2Height3.
	self assert: foo rows equals: #(#(1 2) #(3 4) #(5 6))
]

{ #category : 'tests' }
CTNewArray2DRowsAndColumnsTest >> testRowsDo [
	|foo array columnIndex|
	foo := self arrayClass width2Height3.
	array:= Array new: 3.
	columnIndex:= 1.
	foo rowsDo: [ :row | array at: columnIndex put: row.
		 columnIndex := columnIndex + 1].
	self assert: array equals: #(#(1 2) #(3 4) #(5 6))
]
