tests-converting
testCannotAccessWithWrongCoordinates
	self should: [ self arrayClass width2Height3 atColumn: 6 atRow: 1 ] raise: SubscriptOutOfBounds