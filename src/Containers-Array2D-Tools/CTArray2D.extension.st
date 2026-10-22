Extension { #name : 'CTArray2D' }

{ #category : '*Containers-Array2D-Tools' }
CTArray2D >> basicPrintOnInspector: aBuilder [
	<inspectorPresentationOrder: 35 title: 'Array2D'>

	^ aBuilder newText
		text: self printString;
		yourself
]

{ #category : '*Containers-Array2D-Tools' }
CTArray2D >> inspectionGrid: aBuilder [
	<inspectorPresentationOrder: 35 title: 'Column/Row'>

	^ aBuilder newText 
		text: (String streamContents: [ :aStream | self printGridOn: aStream ]);
		yourself

]

{ #category : '*Containers-Array2D-Tools' }
CTArray2D >> inspectionRows: aBuilder [
	<inspectorPresentationOrder: 35 title: 'Rows'>

	^ aBuilder newText
		text: (String streamContents: [ :aStream | self printRowsOn: aStream ]);
		yourself
]
