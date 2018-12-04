(define (problem amazon)
(:domain Delivery)
(:objects

    truck1 - truck
    drone1 drone2 drone3 - drone
    package1 package2 package3 package4 package5 - item
    DroneBase1 DroneBase2 - dronebase
    PON blue_street red_street WH pink_street orange_street yellow_street white_street POS green_street turquoise_street  - place
)
(:init

    (at truck1 WH)
    (at drone1 PON)
    (at drone2 PON)
    (at drone3 POS)
    (at package1 WH)
    (at package2 WH)
    (at package3 WH)
    (at package4 WH)
    (at package5 WH)
    (at DroneBase1 POS)
    (at DroneBase2 PON)
    (available drone1)
    (available drone2)
    (available drone3)
    (drone-base-available DroneBase1)
    (drone-base-available DroneBase2)
    


    (air-link PON blue_street)
    (air-link blue_street PON)
    (air-link PON pink_street)
    (air-link pink_street PON)
    (air-link PON red_street)
    (air-link red_street PON)
    (air-link PON orange_street)
    (air-link orange_street PON)
    (air-link POS orange_street)
    (air-link orange_street POS)
    (air-link POS white_street)
    (air-link white_street POS)
    (air-link PON yellow_street)
    (air-link yellow_street PON)
    (air-link PON turquoise_street)
    (air-link turquoise_street PON)
    (air-link POS turquoise_street)
    (air-link turquoise_street POS)
    (air-link POS green_street)
    (air-link green_street POS)


    (link POS WH)
    (link WH POS)
    (link PON WH)
    (link WH PON)

    (=(loaded-packages truck1) 0) 

    (=(flight-time PON blue_street) 10)
    (=(flight-time blue_street PON) 10)
    (=(flight-time PON pink_street) 17)
    (=(flight-time pink_street PON) 17)
    (=(flight-time PON red_street) 16)
    (=(flight-time red_street PON) 16)
    (=(flight-time POS orange_street) 7)
    (=(flight-time orange_street POS) 7)
    (=(flight-time POS white_street) 9)
    (=(flight-time white_street POS) 9)
    (=(flight-time PON orange_street) 5)
    (=(flight-time orange_street PON) 5)
    (=(flight-time PON yellow_street) 5)
    (=(flight-time yellow_street PON) 5)
    (=(flight-time turquoise_street POS) 10)
    (=(flight-time POS turquoise_street) 10)
    (=(flight-time POS green_street) 20)
    (=(flight-time green_street POS) 20)
    (=(flight-time PON turquoise_street) 19)
    (=(flight-time turquoise_street PON) 19)
    (=(flight-time PON POS) 9)
    (=(flight-time POS PON) 9)




    (=(drive-time PON WH) 25)
    (=(drive-time WH PON) 25)
    (=(drive-time WH POS) 25)
    (=(drive-time POS WH) 25)


    (=(charge-required PON blue_street) 20)
    (=(charge-required blue_street PON) 20)
    (=(charge-required PON pink_street) 34)
    (=(charge-required pink_street PON) 34)
    (=(charge-required PON red_street) 32)
    (=(charge-required red_street PON) 32)
    (=(charge-required POS orange_street) 14)
    (=(charge-required orange_street POS) 14)
    (=(charge-required POS white_street) 18)
    (=(charge-required white_street POS) 18)
    (=(charge-required PON orange_street) 10)
    (=(charge-required orange_street PON) 10)
    (=(charge-required PON yellow_street) 10)
    (=(charge-required yellow_street PON) 10)
    (=(charge-required turquoise_street POS) 20)
    (=(charge-required POS turquoise_street) 20)
    (=(charge-required POS green_street) 40)
    (=(charge-required green_street POS) 40)
    (=(charge-required PON turquoise_street) 38)
    (=(charge-required turquoise_street PON) 38)
    (=(charge-required PON POS) 18)
    (=(charge-required POS PON) 18)

    (=(charge-level drone1) 100)
    (=(charge-level drone2) 50)
    (=(charge-level drone3) 100)

)

(:goal
   (and (at package1 green_street)
        (at package2 red_street)
	(at package3 blue_street)
	(at package4 pink_street)
        (at package5 turquoise_street)
	(at truck1 WH)
    	(at drone1 PON)
    	(at drone2 POS)
    	(at drone3 POS)

   )
)


)
