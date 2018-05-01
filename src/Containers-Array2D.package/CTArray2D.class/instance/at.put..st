accessing
at: aPoint put: value
	"Store a value at index aPoint x, aPoint y and answer it."

	^ contents at: (self indexX: aPoint x y: aPoint y) put: value