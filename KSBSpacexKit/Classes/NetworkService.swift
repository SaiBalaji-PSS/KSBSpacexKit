//
//  NetworkService.swift
//  KSBSpacexKit
//
//  Created by Sai Balaji on 25/07/20.
//

import Foundation



public class NetworkService
{
    public static var sharedobj = NetworkService()
    
     let capsuleurl = URL(string: "https://api.spacexdata.com/v4/capsules")
      let session = URLSession(configuration: .default)
    
   
    
 func getCapsules(onCompletion :@escaping(Capsules) -> Void)
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
    
    
    
}




struct Capsule: Codable {
    let reuseCount, waterLandings, landLandings: Int
    let lastUpdate: String?
    let launches: [String]
    let serial: String
    let status: Status
    let id: String

    enum CodingKeys: String, CodingKey {
        case reuseCount = "reuse_count"
        case waterLandings = "water_landings"
        case landLandings = "land_landings"
        case lastUpdate = "last_update"
        case launches, serial, status, id
    }
}

enum Status: String, Codable {
    case active = "active"
    case destroyed = "destroyed"
    case retired = "retired"
    case unknown = "unknown"
}

typealias Capsules = [Capsule]



