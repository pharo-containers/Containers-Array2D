iterate
allPositionsWithin: someDistance from: someOrigin
	| answer topLeft bottomRight |
	answer := OrderedCollection new.
	topLeft := someOrigin - someDistance max: self firstPosition.
	bottomRight := someOrigin + someDistance min: self dimension.
	topLeft pointTo: bottomRight do: [ :each | answer add: each ].
	^ answer