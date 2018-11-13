(define (domain Delivery)
(:requirements :strips :typing :numeric-fluents :durative-actions :conditional-effects) 
(:types
    place locatable - object
    vehicle truck drone item - locatable
    drone truck - vehicle
)

(:predicates 
    (at ?item - locatable ?loc - place)
    (in ?item - locatable ?v - vehicle)
    (available ?d - drone)
    (link ?x ?y - place)
    (air-link ?x ?y - place)
)

(:functions
  (drivetime ?x ?y - place)
  (flighttime ?x ?y - place)
)


(:durative-action LOAD-TRUCK
  :parameters
    (?item - item ?truck - truck ?loc - place)
  :duration (= ?duration 10)
  :condition
    (and (over all (at ?truck ?loc))
         (at start (at ?item ?loc))
    )
  :effect
   (and (at start (not (at ?item ?loc)))
        (at end (in ?item ?truck))
   )
)

(:durative-action UNLOAD-TRUCK
  :parameters
   (?item - item ?truck - truck ?loc - place)
  :duration (= ?duration 10)
  :condition
   (and (over all (at ?truck ?loc))
        (at start (in ?item ?truck))
   )
  :effect
   (and (at start (not (in ?item ?truck)))
        (at end (at ?item ?loc))
   )
)

(:durative-action ATTACH-PACKAGE
  :parameters
   (?item - item ?drone - drone ?loc - place)
  :duration (= ?duration 10)
  :condition
   (and (over all (at ?drone ?loc))
        (at start (at ?item ?loc))
	(at start (available ?drone))
   )
  :effect
   (and (at start (not (at ?item ?loc)))
        (at end (in ?item ?drone))
	(at start (not (available ?drone)))
   )
)

(:durative-action RELEASE-PACKAGE
  :parameters
   (?item - item ?drone - drone ?loc - place)
  :duration (= ?duration 10)
  :condition
   (and (over all (at ?drone ?loc))
        (at start (in ?item ?drone))
   )
  :effect
   (and (at start (not (in ?item ?drone)))
        (at end (at ?item ?loc))
	(at start (available ?drone))
   )
)




(:durative-action DRIVE-TRUCK
  :parameters
   (?truck - truck ?loc-from - place ?loc-to - place)
  :duration (= ?duration (drivetime ?loc-from ?loc-to))
  :condition
   (and (at start (at ?truck ?loc-from))
        (over all (link ?loc-from ?loc-to))
   )
  :effect
   (and (at start (not (at ?truck ?loc-from)))
        (at end (at ?truck ?loc-to))
   )
)



(:durative-action FLY-DRONE
  :parameters
   (?drone - drone ?loc-from ?loc-to - place)
  :duration (= ?duration (flighttime ?loc-from ?loc-to))
  :condition
   (and (at start (at ?drone ?loc-from))
        (over all (air-link ?loc-from ?loc-to)))
  :effect
   (and (at start (not (at ?drone ?loc-from)))
        (at end (at ?drone ?loc-to)))
)


 
)
