initialize
initializeRows
	| newRows |
	newRows := (1 to: self height) collect: [ :each | self newRow ].
	self rows: newRows asArray 