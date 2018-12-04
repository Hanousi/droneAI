(define (problem amazon)
(:domain Delivery)
(:objects

    truck1 truck2 truck3 - truck
    drone1 drone2 drone3 drone4 drone5 drone6 - drone
    package1 package2 package3 package4 package5 package6 package7 package8 package9 package10 package11 package12 package13 package14 package15 package16 package17 package18 package19 package20 - item
    DroneBase1 DroneBase2 - dronebase
   WH PON POS POE POW blue_street red_street pink_street orange_street yellow_street white_street green_street turquoise_street brown_street purple_street black_street bordeaux_street indigo_street lime_street - place )
(:init

    (at truck1 WH)
    (at truck2 WH)
    (at truck3 WH)
    (at drone1 PON)
    (at drone2 PON)
    (at drone3 POS)
    (at drone4 POE)
    (at drone5 POE)
    (at drone6 POW)
    (at package1 WH)
    (at package2 WH)
    (at package3 WH)
    (at package5 WH)
    (at package4 WH)
    (at package6 WH)
    (at package7 WH)
    

    (available drone1)
    (available drone2)
    (available drone3)
    (drone-base-available DroneBase1)
    (drone-base-available DroneBase2)
    


   (air-link PON blue_street)
    (air-link blue_street PON)
    (air-link PON yellow_street)
    (air-link yellow_street PON)
    (air-link PON pink_street)
    (air-link pink_street PON)

    (air-link POE bordeaux_street)
    (air-link bordeaux_street POE)
    (air-link POE indigo_street)
    (air-link indigo_street POE)

    (air-link POS orange_street)
    (air-link orange_street POS)
    (air-link POS purple_street)
    (air-link purple_street POS)
    (air-link POS black_street)
    (air-link black_street POS)
    (air-link POS turquoise_street)
    (air-link turquoise_street POS)

    (air-link POW green_street)
    (air-link green_street POW)
    (air-link POW brown_street)
    (air-link brown_street POW)
    (air-link POW white_street)
    (air-link white_street POW)
    (air-link POW red_street)
    (air-link red_street POW)
    (air-link POW lime_street)
    (air-link lime_street POW)

    (air-link PON POE)
    (air-link POE PON)
    (air-link POE POS)
    (air-link POS POE)
    (air-link POS POW)
    (air-link POW POS)
    (air-link POW PON)
    (air-link PON POW)


    (link POS WH)
    (link WH POS)
    (link PON WH)
    (link WH PON)
    (link POE WH)
    (link WH POE)
    (link POW WH)
    (link WH POW)

    (=(loaded-packages truck1) 0) 
    (=(loaded-packages truck2) 0) 
    (=(loaded-packages truck3) 0) 

   
    (=(flight-time PON blue_street) 15)
    (=(flight-time blue_street PON) 15)
    (=(flight-time PON yellow_street) 16)
    (=(flight-time yellow_street PON) 16)
    (=(flight-time PON pink_street) 20)
    (=(flight-time pink_street PON) 20)

    (=(flight-time POE bordeaux_street) 5)
    (=(flight-time bordeaux_street POE) 5)
    (=(flight-time POE indigo_street) 11)
    (=(flight-time indigo_street POE) 11)

    (=(flight-time POS orange_street) 3)
    (=(flight-time orange_street POS) 3)
    (=(flight-time POS purple_street) 7)
    (=(flight-time purple_street POS) 7)
    (=(flight-time POS black_street) 9)
    (=(flight-time black_street POS) 9)
    (=(flight-time POS turquoise_street) 12)
    (=(flight-time turquoise_street POS) 12)

    (=(flight-time POW green_street) 9)
    (=(flight-time green_street POW) 9)
    (=(flight-time POW brown_street) 8)
    (=(flight-time brown_street POW) 8)
    (=(flight-time POW white_street) 12)
    (=(flight-time white_street POW) 12)
    (=(flight-time POW red_street) 12)
    (=(flight-time red_street POW) 12)
    (=(flight-time POW lime_street) 23)
    (=(flight-time lime_street POW) 23)

    (=(flight-time PON POE) 21)
    (=(flight-time POE PON) 21)
    (=(flight-time POE POS) 21)
    (=(flight-time POS POE) 21)
    (=(flight-time POW POS) 21)
    (=(flight-time POS POW) 21)
    (=(flight-time POW PON) 21)
    (=(flight-time PON POW) 21)


    (=(drive-time PON WH) 50)
    (=(drive-time WH PON) 50)
    (=(drive-time WH POS) 50)
    (=(drive-time POS WH) 50)
    (=(drive-time POE WH) 70)
    (=(drive-time WH POE) 70)
    (=(drive-time WH POW) 70)
    (=(drive-time POW WH) 70)

    (=(charge-required PON blue_street) 30)
    (=(charge-required blue_street PON) 30)
    (=(charge-required PON yellow_street) 32)
    (=(charge-required yellow_street PON) 32)
    (=(charge-required PON pink_street) 40)
    (=(charge-required pink_street PON) 40)

    (=(charge-required POE bordeaux_street) 10)
    (=(charge-required bordeaux_street POE) 10)
    (=(charge-required POE indigo_street) 22)
    (=(charge-required indigo_street POE) 22)

    (=(charge-required POS orange_street) 6)
    (=(charge-required orange_street POS) 6)
    (=(charge-required POS purple_street) 14)
    (=(charge-required purple_street POS) 14)
    (=(charge-required POS black_street) 18)
    (=(charge-required black_street POS) 18)
    (=(charge-required POS turquoise_street) 24)
    (=(charge-required turquoise_street POS) 24)

    (=(charge-required POW green_street) 18)
    (=(charge-required green_street POW) 18)
    (=(charge-required POW brown_street) 16)
    (=(charge-required brown_street POW) 16)
    (=(charge-required POW white_street) 24)
    (=(charge-required white_street POW) 24)
    (=(charge-required POW red_street) 24)
    (=(charge-required red_street POW) 24)
    (=(charge-required POW lime_street) 46)
    (=(charge-required lime_street POW) 46)

    (=(charge-required PON POE) 42)
    (=(charge-required POE PON) 42)
    (=(charge-required POE POS) 42)
    (=(charge-required POS POE) 42)
    (=(charge-required POW POS) 42)
    (=(charge-required POS POW) 42)
    (=(charge-required POW PON) 42)
    (=(charge-required PON POW) 42)

    (=(charge-level drone1) 100)
    (=(charge-level drone2) 50)
    (=(charge-level drone3) 98)
    (=(charge-level drone4) 75)
    (=(charge-level drone5) 75)
    (=(charge-level drone6) 30)




)

(:goal (and

 	(at package1 green_street)
        (at package2 green_street)
	(at package3 turquoise_street)
	(at package4 purple_street)
        (at package5 indigo_street) 
	

   
   )
)


)
