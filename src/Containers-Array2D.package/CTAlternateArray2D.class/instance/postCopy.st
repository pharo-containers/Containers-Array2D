copying
postCopy
	| newRows |
	super postCopy.
	newRows := self rows collect: [  :each | each copy ].
	self rows: newRows