Extension { #name : #CTArray2D }

{ #category : #'accessing' }
CTArray2D >> at: rowIndex at: columnIndex [
	"Answer the element at rowIndex, columnIndex. Maps to atX:atY:."
	^ self atX: columnIndex atY: rowIndex
]

{ #category : #'accessing' }
CTArray2D >> at: rowIndex at: columnIndex put: value [
	"Store value at rowIndex, columnIndex and answer it. Maps to atX:atY:put:."
	^ self atX: columnIndex atY: rowIndex put: value
]

{ #category : #'accessing' }
CTArray2D >> columnCount [
	"Answer the number of columns in the matrix."
	^ self width
]

{ #category : #'accessing' }
CTArray2D >> rowCount [
	"Answer the number of rows in the matrix."
	^ self height
]

{ #category : #'instance creation' }
CTArray2D class >> rows: numberOfRows columns: numberOfColumns [
	"Create a new CTArray2D instance with the specified number of rows and columns."
	^ self width: numberOfColumns height: numberOfRows
]

{ #category : #'instance creation' }
CTArray2D class >> rows: numberOfRows columns: numberOfColumns contents: anArray [
	"Create a new CTArray2D instance with the specified number of rows, columns, and contents."
	| newArray |
	newArray := self width: numberOfColumns height: numberOfRows.
	1 to: numberOfRows do: [ :row |
		1 to: numberOfColumns do: [ :col |
			| index |
			index := (row - 1) * numberOfColumns + col.
			newArray atX: col atY: row put: (anArray at: index) ] ].
	^ newArray
]