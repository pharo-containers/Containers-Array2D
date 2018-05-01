accessing rows/columns
atColumn: x
	"Answer the content of the whole column at index x"

	| column |
	column := contents class new: self height.
	1 to: self height do: [ :index | column at: index put: (self atColumn: x atRow: index) ].
	^ column