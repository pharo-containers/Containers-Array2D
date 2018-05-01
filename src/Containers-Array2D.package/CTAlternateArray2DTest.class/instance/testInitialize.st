tests-initialize
testInitialize
	| foo |	
	foo := self arrayClass new.
	self assert: foo dimension equals: 0@0