Extension { #name : #CTNewArray2D }

{ #category : #'*Containers-Array2D-Tools' }
CTNewArray2D >> basicPrintOnInspector [
	<inspectorPresentationOrder: 35 title: 'Array2D'>

	^ SpTextPresenter new 
		text: self printString;
		yourself
]

{ #category : #'*Containers-Array2D-Tools' }
CTNewArray2D >> inspectionGrid [
	<inspectorPresentationOrder: 35 title: 'Column/Row'>

	^ SpTextPresenter new 
		text: (String streamContents: [ :aStream | self printGridOn: aStream ]);
		yourself

]
