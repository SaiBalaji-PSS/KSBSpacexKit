//
//  ViewController.swift
//  KSBSpacexKit
//
//  Created by ksbalaji2000@outlook.com on 07/25/2020.
//  Copyright (c) 2020 ksbalaji2000@outlook.com. All rights reserved.
//

import UIKit
import KSBSpacexKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        
    
        SpaceXHub.sharedobj.getCapsules { (capsules, error) in
            if error == nil
            {
                print(capsules.first!.id)
                print(capsules.first!.landLandings)
                print(capsules.first!.lastUpdate!)
                print(capsules.first!.reuseCount)
                print(capsules.first!.status)
            }
            
        }
        
        SpaceXHub.sharedobj.getDragons { (daragons, error) in
            if error == nil
            {
                print(daragons.first!.heatShield)
                print(daragons.first!.launchPayloadMass)
                print(daragons.first!.launchPayloadVol)
                print(daragons.first!.returnPayloadMass)
                print(daragons.first!.returnPayloadVol)
            }
        }
        
        SpaceXHub.sharedobj.getCrewMembers { (crew, error) in
            if error == nil
            {
                print(crew.first!.id)
                print(crew.first!.name)
                print(crew.first!.agency)
                print(crew.first!.launches.first!.description)
                print(crew.first!.image)
            }
        }
        
            SpaceXHub.sharedobj.getLandPads { (landpads, error) in
                if error == nil
                {
                    print(landpads.first!.id)
                    print(landpads.first!.fullName)
                    print(landpads.first!.details)
                    print(landpads.first!.landingAttempts)
                    print(landpads.first!.landingSuccesses)
                    print(landpads.first!.launches.first!.description)
                    
                }
            }
            
            
            SpaceXHub.sharedobj.getLaunchPads { (launchpad, error) in
                if error == nil
                {
                    print(launchpad.first!.id)
                    print(launchpad.first!.fullName)
                    print(launchpad.first!.latitude)
                     print(launchpad.first!.longitude)
                     print(launchpad.first!.locality)
                }
            }
            
            SpaceXHub.sharedobj.getRoadster { (roadster, error) in
                if error == nil
                {
                    print(roadster.details)
                    print(roadster.apoapsisAu)
                    print(roadster.earthDistanceKM)
                    print(roadster.epochJd)
                    print(roadster.flickrImages)
                }
            }
        
          
        
       SpaceXHub.sharedobj.getStarlinks { (w, e) in
                   print(w.first!.spaceTrack.countryCode)
                   
                
               }
        
        
        SpaceXHub.sharedobj.getShips{(s,e) in
            print("HOME PORT \(s.first!.homePort.rawValue)")
            print(s.first!.id)
            print(s.first!.active)
            
        }
        
        
        
        
    }
        
           
        
        
        
        
 
        
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


