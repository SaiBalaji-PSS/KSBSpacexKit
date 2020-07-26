//
//  NetworkService.swift
//  KSBSpacexKit
//
//  Created by Sai Balaji on 25/07/20.
//

import Foundation



public class NetworkService
{
   
    public  static  let sharedobj = NetworkService()
    
    let capsuleurl = URL(string: "https://api.spacexdata.com/v4/capsules")
    let crewurl = URL(string: "https://api.spacexdata.com/v4/crew")
    let dragonurl = URL(string: "https://api.spacexdata.com/v4/dragons")
    let landpadurl = URL(string: "https://api.spacexdata.com/v4/landpads")
    
       let session = URLSession(configuration: .default)
    
    
    
   
    
 public func getCapsules(onCompletion :@escaping(Capsules) -> Void)
    {
     let task = session.dataTask(with: capsuleurl!) { (data, response, error) in
            
            DispatchQueue.main.async {
                do
                {
                    let capsules = try JSONDecoder().decode(Capsules.self, from: data!)
                    
                    onCompletion(capsules)
                    
                    
                    
                }
                
                catch
                {
                    print(error.localizedDescription)
                }
            }
        
            
        }
        
        task.resume()
    }
    
    
    
    
    public func getCrewMembers(onCompletion: @escaping(Crews)->Void)
    {
        let task = session.dataTask(with: crewurl!) { (data, response, error) in
            
            DispatchQueue.main.async {
                do
                {
                    let crewmemvers = try JSONDecoder().decode(Crews.self, from: data!)
                    
                    onCompletion(crewmemvers)
                    
                    
                }
                
                catch
                {
                    print(error.localizedDescription)
                }
            }
            
            
            
            
        }
        
        task.resume()
    }
    
    
    public func getDragons(onCompletion :@escaping(Dragonss) -> Void)
       {
        let task = session.dataTask(with: dragonurl!) { (data, response, error) in
               
               DispatchQueue.main.async {
                   do
                   {
                       let dgs = try JSONDecoder().decode(Dragonss.self, from: data!)
                       
                       onCompletion(dgs)
                       
                       
                       
                   }
                   
                   catch
                   {
                       print(error.localizedDescription)
                   }
               }
           
               
           }
           
           task.resume()
       }
       
       
    
    
    
   public func getLandPads(onCompletion:@escaping(Landpads)->Void)
    {
        let task = session.dataTask(with: landpadurl!) { (data, response, error) in
                   
                   DispatchQueue.main.async {
                       do
                       {
                           let lps = try JSONDecoder().decode(Landpads.self, from: data!)
                           
                           onCompletion(lps)
                           
                           
                       }
                       
                       catch
                       {
                           print(error.localizedDescription)
                       }
                   }
                   
                   
                   
                   
               }
               
               task.resume()
        
    }
    
    
    
}







public struct Capsule: Codable {
 public   let reuseCount, waterLandings, landLandings: Int
public     let lastUpdate: String?
public     let launches: [String]
  public  let serial: String
public     let status: Status
 public   let id: String

  public   enum CodingKeys: String, CodingKey {
        case reuseCount = "reuse_count"
        case waterLandings = "water_landings"
        case landLandings = "land_landings"
        case lastUpdate = "last_update"
        case launches, serial, status, id
    }
}

public enum Status: String, Codable {
    case active = "active"
    case destroyed = "destroyed"
    case retired = "retired"
    case unknown = "unknown"
}

public typealias Capsules = [Capsule]



public struct Crew: Codable {
  public  let name, agency: String
   public let image: String
 public    let wikipedia: String
  public   let launches: [String]
   public  let status, id: String
}

public typealias Crews = [Crew]




public struct Dragon: Codable {
   public let heatShield: HeatShield
   public let launchPayloadMass: PayloadMass
  public  let launchPayloadVol: LaunchPayloadVol
  public  let returnPayloadMass: PayloadMass
 public   let returnPayloadVol: LaunchPayloadVol
    let pressurizedCapsule: PressurizedCapsule
    let trunk: Trunk
    let heightWTrunk, diameter: Diameter
    let firstFlight: String
    let flickrImages: [String]
    let name, type: String
    let active: Bool
    let crewCapacity, sidewallAngleDeg, orbitDurationYr, dryMassKg: Int
    let dryMassLB: Int
    let thrusters: [Thruster]
    let wikipedia: String
    let welcomeDescription, id: String

    enum CodingKeys: String, CodingKey {
        case heatShield = "heat_shield"
        case launchPayloadMass = "launch_payload_mass"
        case launchPayloadVol = "launch_payload_vol"
        case returnPayloadMass = "return_payload_mass"
        case returnPayloadVol = "return_payload_vol"
        case pressurizedCapsule = "pressurized_capsule"
        case trunk
        case heightWTrunk = "height_w_trunk"
        case diameter
        case firstFlight = "first_flight"
        case flickrImages = "flickr_images"
        case name, type, active
        case crewCapacity = "crew_capacity"
        case sidewallAngleDeg = "sidewall_angle_deg"
        case orbitDurationYr = "orbit_duration_yr"
        case dryMassKg = "dry_mass_kg"
        case dryMassLB = "dry_mass_lb"
        case thrusters, wikipedia
        case welcomeDescription = "description"
        case id
    }
}

// MARK: - Diameter
public struct Diameter: Codable {
  public  let meters, feet: Double
}

// MARK: - HeatShield
public struct HeatShield: Codable {
   public let material: String
 public   let sizeMeters: Double
 public   let tempDegrees: Int
  public  let devPartner: String

 public   enum CodingKeys: String, CodingKey {
        case material
        case sizeMeters = "size_meters"
        case tempDegrees = "temp_degrees"
        case devPartner = "dev_partner"
    }
}

// MARK: - PayloadMass
public struct PayloadMass: Codable {
   public let kg, lb: Int
}

// MARK: - LaunchPayloadVol
public struct LaunchPayloadVol: Codable {
   public let cubicMeters, cubicFeet: Int

  public  enum CodingKeys: String, CodingKey {
        case cubicMeters = "cubic_meters"
        case cubicFeet = "cubic_feet"
    }
}

// MARK: - PressurizedCapsule
public struct PressurizedCapsule: Codable {
  public  let payloadVolume: LaunchPayloadVol

 public   enum CodingKeys: String, CodingKey {
        case payloadVolume = "payload_volume"
    }
}

// MARK: - Thruster
public struct Thruster: Codable {
  public  let type: String
  public  let amount, pods: Int
  public  let fuel1, fuel2: String
  public  let isp: Int
  public  let thrust: Thrust

  public  enum CodingKeys: String, CodingKey {
        case type, amount, pods
        case fuel1 = "fuel_1"
        case fuel2 = "fuel_2"
        case isp, thrust
    }
}

// MARK: - Thrust
public struct Thrust: Codable {
  public  let kN: Double
  public  let lbf: Int
}

// MARK: - Trunk
public struct Trunk: Codable {
  public  let trunkVolume: LaunchPayloadVol
  public  let cargo: Cargo

 public   enum CodingKeys: String, CodingKey {
        case trunkVolume = "trunk_volume"
        case cargo
    }
}

// MARK: - Cargo
public struct Cargo: Codable {
    let solarArray: Int
    let unpressurizedCargo: Bool

    enum CodingKeys: String, CodingKey {
        case solarArray = "solar_array"
        case unpressurizedCargo = "unpressurized_cargo"
    }
}

public typealias Dragonss = [Dragon]





public struct Landpad: Codable {
 public   let name, fullName, type, locality: String
  public  let region: String
   public let latitude, longitude: Double
  public  let landingAttempts, landingSuccesses: Int
 public   let wikipedia: String
  public  let details: String
  public  let launches: [String]
   public let status, id: String

   public enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
        case type, locality, region, latitude, longitude
        case landingAttempts = "landing_attempts"
        case landingSuccesses = "landing_successes"
        case wikipedia, details, launches, status, id
    }
}

public typealias Landpads = [Landpad]

