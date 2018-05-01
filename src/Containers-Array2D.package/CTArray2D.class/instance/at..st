accessing-convenience
at: aPoint
	"Answer the element at index Point x, Point y."

	^ contents at: (self indexX: aPoint x y: aPoint y)