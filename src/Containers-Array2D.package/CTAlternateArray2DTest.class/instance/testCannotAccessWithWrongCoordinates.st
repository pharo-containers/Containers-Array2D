tests-accessing
testCannotAccessWithWrongCoordinates

	self should: [self arrayClass width2Height3 at: 1@6 ] raise: SubscriptOutOfBounds 