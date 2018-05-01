private
indexX: x y: y
	"Answer the receiver coordonnate in 1D, for example:
	  foo := #( 0 2 4
					6 8 10 )
		foo indexX: 3 y: 1 gives us the index of the value '4' which is the 3rd value of the array in 1D"
					
					
	(x < 1 or: [ x > width ])
		ifTrue: [ self errorSubscriptBounds: x ].
	^ (y - 1) * width + x