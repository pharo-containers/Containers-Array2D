accessing-convenience
atX: x atY: y put: value
	"Store a value at index x,y and answer it."

	^ contents at: (self indexX: x y: y) put: value