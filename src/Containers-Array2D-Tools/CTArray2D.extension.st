Extension { #name : #CTArray2D }

{ #category : #'*Containers-Array2D-Tools' }
CTArray2D >> basicPrintOnInspector [
	<inspectorPresentationOrder: 35 title: 'Array2D'>

	^ SpTextPresenter new 
		text: self printString;
		yourself
]

{ #category : #'*Containers-Array2D-Tools' }
CTArray2D >> inspectionGrid [
	<inspectorPresentationOrder: 35 title: 'Column/Row'>

	^ SpTextPresenter new 
		text: (String streamContents: [ :aStream | self printGridOn: aStream ]);
		yourself

]

{ #category : #'*Containers-Array2D-Tools' }
CTArray2D >> inspectionRows [
	<inspectorPresentationOrder: 35 title: 'Rows'>

	^ SpTextPresenter new 
		text: (String streamContents: [ :aStream | self printRowsOn: aStream ]);
		yourself
]
