"
This class implements all lattice operations from the join:, meet:, = instance operations that have to be provided by each subclass, and bottom and top class methods that create respectively the bottom and top lattice elements.
"
Class {
	#name : #GenericLattice,
	#superclass : #Object,
	#instVars : [
		'val'
	],
	#category : #Lattice
}

{ #category : #accessing }
GenericLattice class >> bottom [
	"Creates a bottom element"	
	^ self subclassResponsability
]

{ #category : #accessing }
GenericLattice class >> top [
	"Creates a top element"	
	^ self subclassResponsability
]

{ #category : #operations }
GenericLattice >> /\ x [
	"Meet between self's value and x's"	
	(self isBottom | x isTop ) ifTrue: [ ^ self class new val: val ] .
	(x isBottom | self isTop )ifTrue: [ ^ self class new val: x val ] .
	^ self meet: x
]

{ #category : #comparing }
GenericLattice >> < x [
	"Implements lower than"
	^ (self = x ) ifTrue: [ ^false ] ifFalse: [^ self <= x ]
]

{ #category : #comparing }
GenericLattice >> <= x [
	"Implements lower or equal"
	^ (self \/ x = x)
]

{ #category : #comparing }
GenericLattice >> = x [
	"Implement semantics equality, can be changed"	
	^ val = x val
]

{ #category : #comparing }
GenericLattice >> == x [
	"Implement SmallTalk's object equality, should not be changed"	
	^ val == x val
]

{ #category : #comparing }
GenericLattice >> > x [
	"Implements greater than"
	^ (self = x ) ifTrue: [ ^false ] ifFalse: [^ self >= x ]
]

{ #category : #comparing }
GenericLattice >> >= x [
	"Implements greater or equal"
	^ (self \/ x = self)
]

{ #category : #operations }
GenericLattice >> \/ x [
	"Join between self's value and x's"	
	(self isTop | x isBottom) ifTrue: [ ^ self class new val: val].
	( self isBottom | x isTop) ifTrue: [ ^ self class new val: x val ].
	^ self join: x
]

{ #category : #'value testing' }
GenericLattice >> isBottom [
	"True if self is the bottom element of the lattice"	
	^( self class bottom = self )
]

{ #category : #'value testing' }
GenericLattice >> isTop [
	"True if self is the bottom element of the lattice"	
	^( self class top = self )
]

{ #category : #operations }
GenericLattice >> join: x [
	"join if neither self nor x is top/bottom"	
	self subclassResponsibility 
]

{ #category : #operations }
GenericLattice >> meet: x [
	"Meet if neither self nor x is top/bottom"	
	self subclassResponsibility 
]

{ #category : #accessing }
GenericLattice >> val [

	^ val
]

{ #category : #accessing }
GenericLattice >> val: anObject [

	val := anObject
]
