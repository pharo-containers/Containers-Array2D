tests-iterate
testAllPositionsWithinFrom
	| foo ordColl |
	foo := self arrayClass width2Height3 allPositionsWithin: 1 @ 0 from: 2 @ 2.
	"we want to get all the positions at a distance of x-1 to x+1 of the point 2@2
	 and since the dimension of width2Height3 is 2@3, we can get the point 1@2 but
	there is no point 3@2 so the result should be: anOrderedCollection((1@2)(2@2))"
	
	ordColl := OrderedCollection new.
	ordColl add: 1 @ 2.
	ordColl add: 2 @ 2.
	
	self assert: foo equals: ordColl