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
	foo := self arrayClass width: 3 heigth: 3.
	foo atAllPut: 0.
	self assert: foo asArray equals: #(0 0 0 0 0 0 0 0 0)
]
