Class {
	#name : #BaselineOfArray2D,
	#superclass : #BaselineOf,
	#category : #BaselineOfArray2D
}

{ #category : #baselines }
BaselineOfArray2D >> baseline: spec [ 
	<baseline>

	spec for: #pharo do: [		
		spec package: 'Containers-Array2D'.
		"spec package: 'Containers-Array2D-Tests' with: [ spec requires: #('Containers-Array2D')] " 
		]
	

]
