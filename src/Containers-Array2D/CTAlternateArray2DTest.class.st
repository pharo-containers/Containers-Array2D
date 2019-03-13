Class {
	#name : #CTAlternateArray2DTest,
	#superclass : #TestCase,
	#category : 'Containers-Array2D'
}

{ #category : #'tests converting' }
CTAlternateArray2DTest >> arrayClass [ 

	^ CTAlternateArray2D
]

{ #category : #'tests-iterate' }
CTAlternateArray2DTest >> testAllPositionsDo [
	| count |
	count := 0.
	self arrayClass width2Height3
		allPositionsDo: [ :each | 
			(self arrayClass width2Height3 at: each) even
				ifTrue: [ count := count + 1 ] ].
	self assert: count equals: 3
]

{ #category : #'tests-iterate' }
CTAlternateArray2DTest >> testAllPositionsWithinFrom [
	| foo ordColl |
	foo := self arrayClass width2Height3 allPositionsWithin: 1 @ 0 from: 2 @ 2.
	"we want to get all the positions at a distance of x-1 to x+1 of the point 2@2
	 and since the dimension of width2Height3 is 2@3, we can get the point 1@2 but
	there is no point 3@2 so the result should be: anOrderedCollection((1@2)(2@2))"
	
	ordColl := OrderedCollection new.
	ordColl add: 1 @ 2.
	ordColl add: 2 @ 2.
	
	self assert: foo equals: ordColl
]

{ #category : #'tests-accessing' }
CTAlternateArray2DTest >> testAt [

	self assert: (self arrayClass width2Height3 at: 2@3) equals: 6.
	self assert: (self arrayClass width2Height3 at: 1@1) equals: 1.
]

{ #category : #'tests-accessing' }
CTAlternateArray2DTest >> testAtPut [
	| foo |
	
	foo := self arrayClass new dimension: 2@3.
	foo at: 1@3 put: 12.
	
	self assert: (foo at: 1 @ 3) equals: 12
]

{ #category : #'tests-accessing' }
CTAlternateArray2DTest >> testAtRow [
		self assert: (self arrayClass width2Height3 atRow: 2) equals: #( 3 4).
]

{ #category : #'tests-accessing' }
CTAlternateArray2DTest >> testCannotAccessWithWrongCoordinates [

	self should: [self arrayClass width2Height3 at: 1@6 ] raise: SubscriptOutOfBounds 
]

{ #category : #'tests-accessing' }
CTAlternateArray2DTest >> testDimension [
	self assert: self arrayClass width2Height3 dimension equals: 2@3
]

{ #category : #'tests-iterate' }
CTAlternateArray2DTest >> testDo [
	| count |
	count := 0.
	
	self arrayClass width2Height3 do: [ :each |  each even ifTrue: [ count := count + 1 ] ].
	self assert: count equals: 3.
]

{ #category : #'tests-initialize' }
CTAlternateArray2DTest >> testEmptyArray2D [

	self assert: self arrayClass new dimension equals: 0@0
]

{ #category : #'tests-accessing' }
CTAlternateArray2DTest >> testFirstPosition [
	self assert: self arrayClass width2Height3 firstPosition equals: 1@1
]

{ #category : #'tests-accessing' }
CTAlternateArray2DTest >> testHeight [
		self assert: (self arrayClass width2Height3 height) equals: 3.
]

{ #category : #'tests-initialize' }
CTAlternateArray2DTest >> testInitialize [
	| foo |	
	foo := self arrayClass new.
	self assert: foo dimension equals: 0@0
]

{ #category : #'tests-initialize' }
CTAlternateArray2DTest >> testInitializeRows [
	| foo |
	foo := self arrayClass new dimension: 2 @ 2.
	self assert: foo rows equals: #( #(nil nil) #(nil nil) ).
]

{ #category : #'tests-private' }
CTAlternateArray2DTest >> testNewRow [
		| foo |
	foo := self arrayClass new dimension: 2 @ 2.
	self assert: (foo newRow) equals: #(nil nil)
]

{ #category : #'tests-private' }
CTAlternateArray2DTest >> testNewRowWithWidth [
	| foo |
	foo := self arrayClass new dimension: 2@2.
	self assert: (foo newRowWithWidth: 2)  equals: #(nil nil)
]

{ #category : #'tests-copying' }
CTAlternateArray2DTest >> testPostCopy [
	| foo cop |
	foo := self arrayClass new dimension: 2 @ 3.
	foo at: 2 @ 2 put: 15.
	cop := foo postCopy.
	self assert: cop width equals: 2.
	self assert: cop height equals: 3.
	self assert: cop rows equals: #(#(nil nil) #(nil 15) #(nil nil)).

]

{ #category : #'tests-accessing' }
CTAlternateArray2DTest >> testRows [
		self assert: (self arrayClass width2Height3 rows) equals: #( #( 1 2) #(3 4) #(5 6)).
]

{ #category : #'tests-iterate' }
CTAlternateArray2DTest >> testRowsDo [
	self arrayClass width2Height3 rowsDo: [ :each | self assert: each size equals: self arrayClass width2Height3 width ]
]

{ #category : #'tests-accessing' }
CTAlternateArray2DTest >> testSize [
		self assert: (self arrayClass width2Height3 size) equals: 6.
]

{ #category : #'tests-private' }
CTAlternateArray2DTest >> testStorageIndexFor [
	
	self assert: (self arrayClass width2Height3 storageIndexFor: 1@3) equals: 5
]

{ #category : #'tests-accessing' }
CTAlternateArray2DTest >> testWidth [
	self assert: self arrayClass width2Height3 width equals: 2
]
