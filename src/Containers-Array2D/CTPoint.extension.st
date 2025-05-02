Extension { #name : #Point }

{ #category : #'iteration' }
Point >> pointTo: endPoint do: aBlock [
	"Iterate over all integer points from self to endPoint (inclusive), applying aBlock to each.
	Iterate in row-major order: y from self y to endPoint y, x from self x to endPoint x within each y."
	(self y to: endPoint y) do: [ :y |
		(self x to: endPoint x) do: [ :x |
			aBlock value: x@y ] ]
]