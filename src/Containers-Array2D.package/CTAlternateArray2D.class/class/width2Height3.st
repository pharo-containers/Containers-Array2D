examples
width2Height3
	<sampleInstance>
	"self width2Height3"
	| i |
	i := self new dimension: 2@3.
	i at: 1@1 put: 1.
	i at: 2@1 put: 2.
	i at: 1@2 put: 3.
	i at: 2@2 put: 4.
	i at: 1@3 put: 5.
	i at: 2@3 put: 6.
	^ i