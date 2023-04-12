"
Implements a lattice of intervals ordered with subset inclusion

"
Class {
	#name : #IntervalLattice,
	#superclass : #GenericLattice,
	#category : #Lattice
}

{ #category : #accessing }
IntervalLattice class >> bottom [
	"Returns the top of the lattice, an empty interval"
	^ self new val: (Dictionary new at: 'min' put: 0 ; at: 'max' put: '-1' ; yourself )
]

{ #category : #'instance creation' }
IntervalLattice class >> from: a to: b [
	"Creates a new interval"	
	^ self new val: (Dictionary new at: 'min' put: a ; at: 'max' put: b ; yourself)
]

{ #category : #accessing }
IntervalLattice class >> top [
	"Returns the top of the lattice, an interval that contains all possible values"
	^self new val: (Dictionary new at: 'min' put: Float negativeInfinity  ; at: 'max' put: Float infinity ; yourself )
]

{ #category : #comparing }
IntervalLattice >> = x [
	^ (self isBottom & x isBottom) | ( ( self from = x from ) & (self to = x to ) )
]

{ #category : #accessing }
IntervalLattice >> from [
	"Returns the start of the interval"	
	^ val at: 'min'
]

{ #category : #'value testing' }
IntervalLattice >> isBottom [
	"Test if the value is an empty interval"
	^ self from > self to
]

{ #category : #operations }
IntervalLattice >> join: x [
	"join if neither self nor x is top/bottom"	
	|a b|
	a:=(val at: 'min' ) min: (x val at: 'min').
	b:=(val at: 'max' ) max: (x val at: 'max').
	^ self class from: a to: b 
]

{ #category : #operations }
IntervalLattice >> meet: x [
	"meet if neither self nor x is top/bottom"	
	|a b|
	a:=(val at: 'min' ) max: (x val at: 'min').
	b:=(val at: 'max' ) min: (x val at: 'max').
	^ self class new val: (Dictionary new at: 'min' put: a ; at: 'max' put: b  )
]

{ #category : #accessing }
IntervalLattice >> to [
	"Returns the end of the interval"	
	^ val at: 'max'
]
