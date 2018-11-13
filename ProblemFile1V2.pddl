(define (problem amazon)
(:domain Delivery)
(:objects

    truck1 - truck
    drone1 drone2 drone3 - drone
    package1 package2 package3 package4 package5 - item
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
    (available drone1)
    (available drone2)
    (available drone3)

    (air-link PON blue_street)
    (air-link blue_street PON)
    (air-link PON pink_street)
    (air-link pink_street PON)
    (air-link blue_street red_street)
    (air-link red_street blue_street)
    (air-link blue_street orange_street)
    (air-link orange_street blue_street)
    (air-link red_street white_street)
    (air-link white_street red_street)
    (air-link pink_street orange_street)
    (air-link orange_street pink_street)
    (air-link orange_street yellow_street)
    (air-link yellow_street orange_street)
    (air-link green_street turquoise_street)
    (air-link turquoise_street green_street)
    (air-link white_street turquoise_street)
    (air-link turquoise_street white_street)
    (air-link POS green_street)
    (air-link green_street POS)
    
    (link POS WH)
    (link WH POS)
    (link PON WH)
    (link WH PON)
    


    (=(flighttime PON blue_street) 10)
    (=(flighttime blue_street PON) 10)
    (=(flighttime PON pink_street) 17)
    (=(flighttime pink_street PON) 17)
    (=(flighttime blue_street red_street) 16)
    (=(flighttime red_street blue_street) 16)
    (=(flighttime blue_street orange_street) 7)
    (=(flighttime orange_street blue_street) 7)
    (=(flighttime red_street white_street) 9)
    (=(flighttime white_street red_street) 9)
    (=(flighttime pink_street orange_street) 5)
    (=(flighttime orange_street pink_street) 5)
    (=(flighttime orange_street yellow_street) 5)
    (=(flighttime yellow_street orange_street) 5)
    (=(flighttime turquoise_street white_street) 10)
    (=(flighttime white_street turquoise_street) 10)
    (=(flighttime POS green_street) 20) 
    (=(flighttime green_street POS) 20)
    (=(flighttime green_street turquoise_street) 9)
    (=(flighttime turquoise_street green_street) 19)


    (=(drivetime PON WH) 25)
    (=(drivetime WH PON) 25)
    (=(drivetime WH POS) 25)
    (=(drivetime POS WH) 25)


    
)

(:goal
   (and (at package1 yellow_street) 
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
