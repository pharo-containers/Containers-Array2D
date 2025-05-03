Class {
	#name : 'CTAlternateArray2D',
	#superclass : 'Object',
	#instVars : [
		'contents',
		'width',
		'height'
	],
	#category : 'Containers-Array2D',
	#package : 'Containers-Array2D'
}

{ #category : 'instance creation' }
CTAlternateArray2D class >> new [
	^ self basicNew initialize
]

{ #category : 'instance creation' }
CTAlternateArray2D class >> width: aWidth height: aHeight [
	^ self new
		dimension: aWidth @ aHeight;
		yourself
]

{ #category : 'instance creation' }
CTAlternateArray2D class >> width2Height3 [
	^ self fromArray: #(1 2 3 4 5 6) width: 2
]

{ #category : 'instance creation' }
CTAlternateArray2D class >> fromArray: anArray width: aWidth [
	| height |
	height := anArray size // aWidth.
	^ self new
		dimension: aWidth @ height;
		setContents: anArray;
		yourself
]

{ #category : 'accessing' }
CTAlternateArray2D >> at: aPoint [
	^ contents at: (self storageIndexFor: aPoint)
]

{ #category : 'accessing' }
CTAlternateArray2D >> at: aPoint put: aValue [
	^ contents at: (self storageIndexFor: aPoint) put: aValue
]

{ #category : 'accessing' }
CTAlternateArray2D >> atRow: rowIndex [
	(rowIndex < 1 or: [ rowIndex > self height ])
		ifTrue: [ self errorSubscriptBounds: rowIndex ].
	^ contents copyFrom: (rowIndex - 1) * width + 1 to: rowIndex * width
]

{ #category : 'iterating' }
CTAlternateArray2D >> allPositionsDo: aBlock [
	1 to: self width do: [ :x |
		1 to: self height do: [ :y |
			aBlock value: x @ y ] ]
]

{ #category : 'iterating' }
CTAlternateArray2D >> allPositionsWithin: aPoint from: anotherPoint [
	| result minX maxX minY maxY |
	result := OrderedCollection new.
	minX := (anotherPoint x - aPoint x) max: 1.
	maxX := (anotherPoint x + aPoint x) min: self width.
	minY := (anotherPoint y - aPoint y) max: 1.
	maxY := (anotherPoint y + aPoint y) min: self height.
	minX to: maxX do: [ :x |
		minY to: maxY do: [ :y |
			result add: x @ y ] ].
	^ result
]

{ #category : 'accessing' }
CTAlternateArray2D >> dimension [
	^ width @ height
]

{ #category : 'accessing' }
CTAlternateArray2D >> dimension: aPoint [
	width := aPoint x.
	height := aPoint y.
	contents := Array new: width * height
]

{ #category : 'iterating' }
CTAlternateArray2D >> do: aBlock [
	contents do: aBlock
]

{ #category : 'accessing' }
CTAlternateArray2D >> firstPosition [
	^ 1 @ 1
]

{ #category : 'accessing' }
CTAlternateArray2D >> height [
	^ height
]

{ #category : 'initialization' }
CTAlternateArray2D >> initialize [
	width := 0.
	height := 0.
	contents := #().
]

{ #category : 'private' }
CTAlternateArray2D >> newRow [
	^ Array new: width
]

{ #category : 'private' }
CTAlternateArray2D >> newRowWithWidth: aWidth [
	^ Array new: aWidth
]

{ #category : 'copying' }
CTAlternateArray2D >> postCopy [
	contents := contents copy
]

{ #category : 'accessing' }
CTAlternateArray2D >> rows [
	^ (1 to: self height) collect: [ :rowIndex | self atRow: rowIndex ]
]

{ #category : 'iterating' }
CTAlternateArray2D >> rowsDo: aBlock [
	1 to: self height do: [ :i | aBlock value: (self atRow: i) ]
]

{ #category : 'private' }
CTAlternateArray2D >> setContents: anArray [
	contents := anArray copy
]

{ #category : 'accessing' }
CTAlternateArray2D >> size [
	^ width * height
]

{ #category : 'private' }
CTAlternateArray2D >> storageIndexFor: aPoint [
	(aPoint x < 1 or: [ aPoint x > width or: [ aPoint y < 1 or: [ aPoint y > height ] ] ])
		ifTrue: [ self errorSubscriptBounds: aPoint ].
	^ (aPoint y - 1) * width + aPoint x
]

{ #category : 'accessing' }
CTAlternateArray2D >> width [
	^ width
]