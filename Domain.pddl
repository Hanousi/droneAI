(define (domain Drones)
(:requirements :typing :durative-actions :fluents :duration-inequalities :equality)

(:types
location locatable - object 
drone - vehicle
package destination vehicle droneBase - locatable )

(:predicates
(at ?o - locatable ?l - location)
(occupied ?d - drone)
(available ?d - drone)
(empty ?d - drone)
(charged ?d - drone)
(in ?p - package ?d - drone)
(delivered ?p - package))

(:functions
(time-to-arrive ?from ?to - location ?d - drone)
(charge-required ?from ?to - location)
(drone-charge ?d - drone)
(recharge-time ?d - drone))

(:durative-action ATTACH-PACKAGE
:parameters (?d - drone ?p - package ?l - location ?db - droneBase)
:duration (= ?duration 1)
:condition (and
(at start (available ?d))
(at start (empty ?d))
(at start (at ?p ?l))
(over all (at ?d ?l))
(over all (at ?db ?l)))
:effect (and
(at end (occupied ?d))
(at end (not (available ?d)))
(at start (not (empty ?d)))
(at start (not (at ?p ?l)))
(at end (in ?p ?d))))

(:durative-action RELEASE-PACKAGE
:parameters (?d - drone ?p - package ?l - location ?de - destination)
:duration (= ?duration 0.5)
:condition (and
(at start (not (empty ?d)))
(at start (occupied ?d))
(over all (at ?de ?l))
(over all (at ?d ?l)))
:effect (and
(at start (not (occupied ?d)))
(at end (not (in ?p ?d)))
(at end (at ?p ?l))
(at end (delivered ?p))
(at end (empty ?d))))

(:durative-action FLY-TO-DESTINATION
:parameters (?p - package ?d - drone ?from ?to - location)
:duration (= ?duration (time-to-arrive ?from ?to ?d))
:condition (and
(at start (available ?d))
(over all (not (= ?from ?to)))
(at start (at ?d ?from)) 
(over all (in ?p ?d))
(at start (charged ?d)))
:effect (and
(at start (not (at ?d ?from)))
(at end (not (charged ?d)))
(at end (at ?d ?to))))

(:durative-action FLY-TO-DRONEBASE
:parameters (?p - package ?d - drone ?from ?to - location)
:duration (= ?duration (time-to-arrive ?from ?to ?d))
:condition (and
(over all (not (= ?from ?to)))
(at start (at ?d ?from))
(over all (not (in ?p ?d))))
:effect (and
(at start (not (at ?d ?from)))
(at end (at ?d ?to))))

(:durative-action RECHARGE-DRONE
:parameters (?d - drone ?l - location ?db - droneBase)
:duration (= ?duration (recharge-time ?d))
:condition (and
(over all (at ?d ?l))
(over all (at ?db ?l))
(at start (available ?d))
(at start (not (charged ?d))))
:effect (and
(at start (not (available ?d)))
(at end (available ?d))
(at end (charged ?d)))))