private
extent: extent fromArray: anArray
	"Extent the receiver to anArray size and load it with anArray contents "

	extent x * extent y = anArray size
		ifFalse: [ ^ self error: 'dimensions don''t match' ].
	width := extent x.
	contents := anArray