(define (domain Delivery)
(:requirements :strips :typing :time :numeric-fluents :durative-actions :conditional-effects)
(:types
    place locatable - object
    vehicle truck drone item dronebase - locatable
    drone truck - vehicle
)

(:predicates
    (at ?item - locatable ?loc - place)
    (in ?item - locatable ?v - vehicle)
    (available ?d - drone)
    (link ?x ?y - place)
    (air-link ?x ?y - place)
    (charging ?d - drone)
    (droneBaseAvailable ?db - dronebase)
)

(:functions
  (drivetime ?x ?y - place)
  (flighttime ?x ?y - place)
  (chargerequired ?x ?y - place)
  (chargelevel ?d - drone)
  (loadedpackages ?t - truck)
)

(:durative-action LOAD-TRUCK
  :parameters
    (?item - item ?truck - truck ?loc - place)
  :duration (= ?duration 10)
  :condition
    (and (over all (at ?truck ?loc))
         (at start (at ?item ?loc))
	(at start (< (loadedpackages ?truck) 10))
    )
  :effect
   (and (at start (not (at ?item ?loc)))
        (at end (in ?item ?truck))
	(at end (increase (loadedpackages ?truck) 1))
   )
)

(:durative-action UNLOAD-TRUCK
  :parameters
   (?item - item ?truck - truck ?loc - place)
  :duration (= ?duration 10)
  :condition
   (and (over all (at ?truck ?loc))
        (at start (in ?item ?truck))
	(at start (> (loadedpackages ?truck) 0))
   )
  :effect
   (and (at start (not (in ?item ?truck)))
        (at end (at ?item ?loc))
	(at end (decrease (loadedpackages ?truck) 1))
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
   (?d - drone ?loc-from ?loc-to - place)
  :duration (= ?duration (flighttime ?loc-from ?loc-to))
  :condition
   (and (at start (at ?d ?loc-from))
        (over all (air-link ?loc-from ?loc-to))
        (at start (> (chargelevel ?d) (*2 (chargerequired ?loc-from ?loc-to)))))
  :effect
   (and (at start (not (at ?d ?loc-from)))
        (at end (at ?d ?loc-to)))
)

(:durative-action FLY-DRONEBASE
  :parameters
   (?d - drone ?loc-from ?loc-to - place ?db - dronebase)
  :duration (= ?duration (flighttime ?loc-from ?loc-to))
  :condition
   (and (at start (at ?d ?loc-from))
	      (over all (at ?db ?loc-to))
        (over all (air-link ?loc-from ?loc-to))
        (at start (> (chargelevel ?d) (chargerequired ?loc-from ?loc-to))))
  :effect
   (and (at start (not (at ?d ?loc-from)))
        (at end (at ?d ?loc-to)))
)

(:durative-action RECHARGE-DRONE
 :parameters
  (?d - drone ?l - place ?db - droneBase)
 :duration (= ?duration (- 100 (chargelevel ?d))
 :precondition
   (and (at start (< (chargelevel ?d) 100))
        (at start (available ?d))
        (at start (droneBaseAvailable ?db))
        (over all (at ?d ?l))
        (over all (at ?db ?l)))
  :effect
   (and (at start (not (available ?d)))
        (at start (not (droneBaseAvailable ?db)))
        (at start (charging ?d))
        (increase (chargelevel ?d) (* #t 1)) **NOT SURE ABOUT THIS LINE
        (at end (available ?d))
        (at end (droneBaseAvailable ?db))
        (at end (not (charging ?d))))
 )
)
