Class {
	#name : #BaselineOfContainersArray2D,
	#superclass : #BaselineOf,
	#category : #BaselineOfContainersArray2D
}

{ #category : #baselines }
BaselineOfContainersArray2D >> baseline: spec [

	<baseline>
	spec package: 'Containers-Array2D'.
	spec
		package: 'Containers-Array2D-Tests'
		with: [ spec requires: #( 'Containers-Array2D' ) ].
	spec
		package: 'Containers-Array2D-Tools'
		with: [ spec requires: #( 'Containers-Array2D' ) ]
]
