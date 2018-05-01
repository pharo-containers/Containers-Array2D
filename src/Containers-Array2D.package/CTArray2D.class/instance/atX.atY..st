accessing-convenience
atX: x atY: y
	"Answer the element at index x, y."

	^ contents at: (self indexX: x y: y)