iterate
allPositionsDo: aBlock
	"Execute a Block on all the positions (points) of the receiver."
	self firstPosition pointTo: self dimension do: aBlock