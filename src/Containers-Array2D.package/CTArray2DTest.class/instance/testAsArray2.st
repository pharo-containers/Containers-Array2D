tests-converting
testAsArray2
	self
		assert: self arrayClass width2Height3 asArray
		equals: #(1 2 3 4 5 6)