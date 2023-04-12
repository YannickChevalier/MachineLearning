Class {
	#name : #FiniteSetLattice,
	#superclass : #GenericLattice,
	#category : #Lattice
}

{ #category : #accessing }
FiniteSetLattice class >> bottom [
	"Returns the bottom of the lattice, an empty set"
	^ self new val: (Set new) ; yourself 
]

{ #category : #'instance creation' }
FiniteSetLattice class >> fromCollection: c [
	"Creates a new set"
	^ self new val: ( Set newFrom c) ; yourself
]

{ #category : #accessing }
FiniteSetLattice class >> top [
	"Returns the top of the lattice, an interval that contains all possible values"
	^self new val: nil
]

{ #category : #comparing }
FiniteSetLattice >> = x [
	(self isTop & x isTop ) ifTrue: [^ true].
	(self isTop | x isTop ) ifTrue: [^ false].
	^ (self val) = (x val)
]


{ #category : #'value testing' }
IntervalLattice >> isBottom [
	"Test if the value is an empty set"
	^ val = Set new
]

{ #category : #operations }
FiniteSetLattice >> join: x [
	"join if neither self nor x is top/bottom"	
	^ self class newFrom: ( (self val) union: (x val) )
]

{ #category : #operations }
FiniteSetLattice >> meet: x [
	"meet if neither self nor x is top/bottom"	
	^ self class newFrom: ( (self val) intersection: (x val) )
]

{ #category : #accessing }
IntervalLattice >> to [
	"Returns the end of the interval"	
	^ val at: 'max'
]
