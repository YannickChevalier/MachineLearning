Class {
	#name : #FiniteSetLattice,
	#superclass : #GenericLattice,
	#category : #Lattice
}

{ #category : #accessing }
FiniteSetLattice class >> bottom [
	"Top element, with a nil value"
	^self new val: (Set new) ; yourself
]

{ #category : #'instance creation' }
FiniteSetLattice class >> newFrom: c [
	"Creates a set from a collection"
	^self new val: (Set newFrom: c) ; yourself
]

{ #category : #accessing }
FiniteSetLattice class >> top [
	"Top element, with a nil value"
	^self new val: nil ; yourself
]

{ #category : #comparing }
FiniteSetLattice >> = x [
	""	
	(self isTop & x isTop ) ifTrue: [ ^ true ].	
	(self isTop | x isTop ) ifTrue: [ ^ false ].
	^ (val = x val)
]

{ #category : #'value testing' }
FiniteSetLattice >> isBottom [
	"test if this is the empty set"
	^val isEmpty
]

{ #category : #'value testing' }
FiniteSetLattice >> isTop [
	"test if this is the empty set"
	^ val isNil
]

{ #category : #operations }
FiniteSetLattice >> join: x [
	"Union of two proper sets"
	^ self class newFrom: (self val union: (x val) )
	
]

{ #category : #operations }
FiniteSetLattice >> meet: x [
	"Intersection of two proper sets"
	^ self class newFrom: (self val union: (x val) )
	
]
