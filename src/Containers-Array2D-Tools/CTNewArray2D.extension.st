Extension { #name : 'CTNewArray2D' }

{ #category : '*Containers-Array2D-Tools' }
CTNewArray2D >> basicPrintOnInspector: aBuilder [
	<inspectorPresentationOrder: 35 title: 'Array2D'>

	^ aBuilder newText 
		text: self printString;
		yourself
]

{ #category : '*Containers-Array2D-Tools' }
CTNewArray2D >> inspectionGrid: aBuilder [
	<inspectorPresentationOrder: 35 title: 'Column/Row'>

	^ aBuilder newText 
		text: (String streamContents: [ :aStream | self printGridOn: aStream ]);
		yourself

]
