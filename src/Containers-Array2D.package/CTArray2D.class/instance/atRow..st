accessing rows/columns
atRow: y
	"Answer the content of the whole column at index x"

	(y < 1 or: [ y > self height ])
		ifTrue: [ self errorSubscriptBounds: y ].
	^ contents copyFrom: (y - 1) * width + 1 to: y * width