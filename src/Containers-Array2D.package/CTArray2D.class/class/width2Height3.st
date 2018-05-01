examples
width2Height3
	<sampleInstance>
	"self width2Height3"
	| i |
	i := self width: 2 height: 3.
	i atColumn: 1 atRow: 1 put: 1.
	i atColumn: 2 atRow: 1 put: 2.
	i atColumn: 1 atRow: 2 put: 3.
	i atColumn: 2 atRow: 2 put: 4.
	i atColumn: 1 atRow: 3 put: 5.
	i atColumn: 2 atRow: 3 put: 6.
	^ i