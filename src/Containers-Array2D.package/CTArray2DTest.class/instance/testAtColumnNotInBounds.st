tests-accessing rows/columns
testAtColumnNotInBounds
	| foo |
	foo := self arrayClass width: 3 height: 5.
	self should: [ foo atColumn: 0 ] raise: SubscriptOutOfBounds.
	self should: [ foo atColumn: 6 ] raise: SubscriptOutOfBounds