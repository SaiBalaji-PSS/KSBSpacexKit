//
//  NetworkService.swift
//  KSBSpacexKit
//
//  Created by Sai Balaji on 25/07/20.
//

import Foundation


public class SpaceXHub
{   
	public  static  let sharedobj = SpaceXHub()
	
	let capsulesurl = URL(string: "https://api.spacexdata.com/v4/capsules")
	let crewurl = URL(string: "https://api.spacexdata.com/v4/crew")
	let dragonsurl = URL(string: "https://api.spacexdata.com/v4/dragons")
	let landpadsurl = URL(string: "https://api.spacexdata.com/v4/landpads")
	let launchpadsurl = URL(string: "https://api.spacexdata.com/v4/launchpads")
	let roadsterurl = URL(string: "https://api.spacexdata.com/v4/roadster")
	let shipsurl = URL(string: "https://api.spacexdata.com/v4/ships")
	let starlinkurl = URL(string:"https://api.spacexdata.com/v4/starlink")
	
	let session = URLSession(configuration: .default)
	
	
	
	// Detailed info for serialized dragon capsules
	public func getCapsules(onCompletion: @escaping(Capsules, Error?) -> Void)
	{
		let task = session.dataTask(with: capsulesurl!) { (data, response, error) in
			DispatchQueue.main.async {
				
				do
				{
					let capsules = try JSONDecoder().decode(Capsules.self, from: data!)
					onCompletion(capsules, error)
				}
				
				catch
				{
					print(error.localizedDescription)
				}
			}
		}
		task.resume()
	}
	
	
	//Detailed info on dragon crew members
	public func getCrewMembers(onCompletion: @escaping(Crew, Error?) -> Void)
	{
		let task = session.dataTask(with: crewurl!) { (data, response, error) in
			DispatchQueue.main.async {
				
				do
				{
					let crewmembers = try JSONDecoder().decode(Crew.self, from: data!)
					onCompletion(crewmembers, error)
				}
				
				catch
				{
					print(error.localizedDescription)
				}
			}
		}
		task.resume()
	}
	
	
	// Detailed info about dragon capsule versions
	public func getDragons(onCompletion: @escaping(Dragons, Error?) -> Void)
	{
		let task = session.dataTask(with: dragonsurl!) { (data, response, error) in
			DispatchQueue.main.async {
				
				do
				{
					let dragons = try JSONDecoder().decode(Dragons.self, from: data!)
					nCompletion(dragons, error)
				}
				
				catch
				{
					print(error.localizedDescription)
				}
			}
		}
		task.resume()
	}
	
	
	// Detailed info about landing pads and ships
	public func getLandPads(onCompletion: @escaping(Landpads, Error?) -> Void)
	{
		let task = session.dataTask(with: landpadsurl!) { (data, response, error) in
			DispatchQueue.main.async {
				
				do
				{
					let landpads = try JSONDecoder().decode(Landpads.self, from: data!)
					onCompletion(landpads, error)
				}
				
				catch
				{
					print(error.localizedDescription)
				}
			}
		}
		task.resume()
	}
	
	
	// Detailed info about launchpads
	public func getLaunchPads(onCompletion: @escaping(LaunchPads, Error?) -> Void)
	{
		let task = session.dataTask(with: launchpadsurl!) { (data, response, error) in
			DispatchQueue.main.async {
				
				do
				{
					let launchpads = try JSONDecoder().decode(LaunchPads.self, from: data!)
					onCompletion(launchpads, error)
				}
				
				catch
				{
					print(error.localizedDescription)
				}
			}
		}
		task.resume()
	}
	
	
	// Detailed info about Elon's Tesla roadster's current position
	public func getRoadster(onCompletion: @escaping(Roadster, Error?) -> Void)
	{
		let task = session.dataTask(with: roadsterurl!) { (data, response, error) in
			DispatchQueue.main.async {
				
				do
				{
					let roadster = try JSONDecoder().decode(Roadster.self, from: data!)
					onCompletion(roadster, error)
				}
				
				catch
				{
					print(error.localizedDescription)
				}
			}
		}
		task.resume()
	}
	
	
	// Detailed info about ships in the SpaceX fleet
	public func getShips(onCompletion: @escaping(Ships, Error?) -> Void)
	{
		let task = session.dataTask(with: shipsurl!) { (data, response, error) in
			DispatchQueue.main.async {
				
				do
				{
					let ships = try JSONDecoder().decode(Ships.self, from: data!)
					onCompletion(ships, error)
				}
				
				catch
				{
					print(error.localizedDescription)
				}
			}
		}
		task.resume()
	}
	
	
	// Detailed info about Starlink satellites and orbits
	public func getStarlink(onCompletion: @escaping(Starlink, Error?) -> Void)
	{
		let task = session.dataTask(with: starlinkurl!) { (data, response, error) in
			DispatchQueue.main.async {
				do
				{
					let starlink = try JSONDecoder().decode(Starlink.self, from: data!)
					onCompletion(starlink,error)
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





public struct Crew: Codable {
	public let name, agency: String
	public let image: String
	public let wikipedia: String
	public let launches: [String]
	public let status, id: String
}

public struct Capsule: Codable {
	public let reuseCount, waterLandings, landLandings: Int
	public let lastUpdate: String?
	public let launches: [String]
	public let serial: String
	public let status: Status
	public let id: String
	
	
	public enum Status: String, Codable {
		case active = "active"
		case destroyed = "destroyed"
		case retired = "retired"
		case unknown = "unknown"
	}
	
	public enum CodingKeys: String, CodingKey {
		case reuseCount = "reuse_count"
		case waterLandings = "water_landings"
		case landLandings = "land_landings"
		case lastUpdate = "last_update"
		case launches, serial, status, id
	}
}

public typealias Capsules = [Capsule]

// MARK: - Diameter
public struct Diameter: Codable {
	public  let meters, feet: Double
}

// MARK: - HeatShield
public struct HeatShield: Codable {
	public let material: String
	public let sizeMeters: Double
	public let tempDegrees: Int
	public let devPartner: String
	
	public enum CodingKeys: String, CodingKey {
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
	public let payloadVolume: LaunchPayloadVol
	
	public enum CodingKeys: String, CodingKey {
		case payloadVolume = "payload_volume"
	}
}

// MARK: - Thruster
public struct Thruster: Codable {
	public let type: String
	public let amount, pods: Int
	public let fuel1, fuel2: String
	public let isp: Int
	public let thrust: Thrust
	
	public enum CodingKeys: String, CodingKey {
		case type, amount, pods
		case fuel1 = "fuel_1"
		case fuel2 = "fuel_2"
		case isp, thrust
	}
}

// MARK: - Thrust
public struct Thrust: Codable {
	public let kN: Double
	public let lbf: Int
}

// MARK: - Trunk
public struct Trunk: Codable {
	public let trunkVolume: LaunchPayloadVol
	public let cargo: Cargo
	
	public enum CodingKeys: String, CodingKey {
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

public typealias Dragons = [Dragon]

public struct Landpad: Codable {
	public let name, fullName, type, locality: String
	public let region: String
	public let latitude, longitude: Double
	public let landingAttempts, landingSuccesses: Int
	public let wikipedia: String
	public let details: String
	public let launches: [String]
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

public struct Roadster: Codable {
	public let flickrImages: [String]
	public let name, launchDateUTC: String
	public let launchDateUnix, launchMassKg, launchMassLbs, noradID: Int
	public let epochJd: Double
	public let orbitType: String
	public let apoapsisAu, periapsisAu, semiMajorAxisAu, eccentricity: Double
	public let inclination, longitude, periapsisArg, periodDays: Double
	public let speedKph, speedMph, earthDistanceKM, earthDistanceMi: Double
	public let marsDistanceKM, marsDistanceMi: Double
	public let wikipedia, video: String
	public let details, id: String
	
	public  enum CodingKeys: String, CodingKey {
		case flickrImages = "flickr_images"
		case name
		case launchDateUTC = "launch_date_utc"
		case launchDateUnix = "launch_date_unix"
		case launchMassKg = "launch_mass_kg"
		case launchMassLbs = "launch_mass_lbs"
		case noradID = "norad_id"
		case epochJd = "epoch_jd"
		case orbitType = "orbit_type"
		case apoapsisAu = "apoapsis_au"
		case periapsisAu = "periapsis_au"
		case semiMajorAxisAu = "semi_major_axis_au"
		case eccentricity, inclination, longitude
		case periapsisArg = "periapsis_arg"
		case periodDays = "period_days"
		case speedKph = "speed_kph"
		case speedMph = "speed_mph"
		case earthDistanceKM = "earth_distance_km"
		case earthDistanceMi = "earth_distance_mi"
		case marsDistanceKM = "mars_distance_km"
		case marsDistanceMi = "mars_distance_mi"
		case wikipedia, video, details, id
	}
}

public struct LaunchPad: Codable {
	public let name, fullName, locality, region: String
	public let timezone: String
	public let latitude, longitude: Double
	public let launchAttempts, launchSuccesses: Int
	public let rockets, launches: [String]
	public let status, id: String
	
	public enum CodingKeys: String, CodingKey {
		case name
		case fullName = "full_name"
		case locality, region, timezone, latitude, longitude
		case launchAttempts = "launch_attempts"
		case launchSuccesses = "launch_successes"
		case rockets, launches, status, id
	}
}

public typealias LaunchPads = [LaunchPad]

public struct Cores : Codable {
	public let core : String?
	public let flight : Int?
	public let gridfins : Bool?
	public let legs : Bool?
	public let reused : Bool?
	public let landing_attempt : Bool?
	public let landing_success : Bool?
	public let landing_type : String?
	public let landpad : String?
	
	public enum CodingKeys: String, CodingKey {
		case core = "core"
		case flight = "flight"
		case gridfins = "gridfins"
		case legs = "legs"
		case reused = "reused"
		case landing_attempt = "landing_attempt"
		case landing_success = "landing_success"
		case landing_type = "landing_type"
		case landpad = "landpad"
	}
	
	public  init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		core = try values.decodeIfPresent(String.self, forKey: .core)
		flight = try values.decodeIfPresent(Int.self, forKey: .flight)
		gridfins = try values.decodeIfPresent(Bool.self, forKey: .gridfins)
		legs = try values.decodeIfPresent(Bool.self, forKey: .legs)
		reused = try values.decodeIfPresent(Bool.self, forKey: .reused)
		landing_attempt = try values.decodeIfPresent(Bool.self, forKey: .landing_attempt)
		landing_success = try values.decodeIfPresent(Bool.self, forKey: .landing_success)
		landing_type = try values.decodeIfPresent(String.self, forKey: .landing_type)
		landpad = try values.decodeIfPresent(String.self, forKey: .landpad)
	}
	
}

public struct Fairings : Codable {
	public let reused : String?
	public let recovery_attempt : Bool?
	public let recovered : Bool?
	public let ships : [String]?
	
	public enum CodingKeys: String, CodingKey {
		case reused = "reused"
		case recovery_attempt = "recovery_attempt"
		case recovered = "recovered"
		case ships = "ships"
	}
	
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		reused = try values.decodeIfPresent(String.self, forKey: .reused)
		recovery_attempt = try values.decodeIfPresent(Bool.self, forKey: .recovery_attempt)
		recovered = try values.decodeIfPresent(Bool.self, forKey: .recovered)
		ships = try values.decodeIfPresent([String].self, forKey: .ships)
	}
}

public struct Flickr : Codable {
	public let small : [String]?
	public let original : [String]?
	
	public enum CodingKeys: String, CodingKey {
		case small = "small"
		case original = "original"
	}
	
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		small = try values.decodeIfPresent([String].self, forKey: .small)
		original = try values.decodeIfPresent([String].self, forKey: .original)
	}
}

public struct Links : Codable {
	public let patch : Patch?
	public let reddit : Reddit?
	public let flickr : Flickr?
	public let presskit : String?
	public let webcast : String?
	public let youtube_id : String?
	public let article : String?
	public let wikipedia : String?
	
	public enum CodingKeys: String, CodingKey {
		case patch = "patch"
		case reddit = "reddit"
		case flickr = "flickr"
		case presskit = "presskit"
		case webcast = "webcast"
		case youtube_id = "youtube_id"
		case article = "article"
		case wikipedia = "wikipedia"
	}
	
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		patch = try values.decodeIfPresent(Patch.self, forKey: .patch)
		reddit = try values.decodeIfPresent(Reddit.self, forKey: .reddit)
		flickr = try values.decodeIfPresent(Flickr.self, forKey: .flickr)
		presskit = try values.decodeIfPresent(String.self, forKey: .presskit)
		webcast = try values.decodeIfPresent(String.self, forKey: .webcast)
		youtube_id = try values.decodeIfPresent(String.self, forKey: .youtube_id)
		article = try values.decodeIfPresent(String.self, forKey: .article)
		wikipedia = try values.decodeIfPresent(String.self, forKey: .wikipedia)
	}
}

public struct Patch : Codable {
	public let small : String?
	public let large : String?
	
	public enum CodingKeys: String, CodingKey {
		case small = "small"
		case large = "large"
	}
	
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		small = try values.decodeIfPresent(String.self, forKey: .small)
		large = try values.decodeIfPresent(String.self, forKey: .large)
	}
}

public struct Reddit : Codable {
	public let campaign : String?
	public let launch : String?
	public let media : String?
	public let recovery : String?
	
	public enum CodingKeys: String, CodingKey {
		case campaign = "campaign"
		case launch = "launch"
		case media = "media"
		case recovery = "recovery"
	}
	
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		campaign = try values.decodeIfPresent(String.self, forKey: .campaign)
		launch = try values.decodeIfPresent(String.self, forKey: .launch)
		media = try values.decodeIfPresent(String.self, forKey: .media)
		recovery = try values.decodeIfPresent(String.self, forKey: .recovery)
	}
}

public struct WelcomeElement: Codable {
	public let spaceTrack: SpaceTrack
	public let version: Version
	public let launch: Launch
	let longitude, latitude, heightKM, velocityKms: Double?
	public let id: String
	
	public enum CodingKeys: String, CodingKey {
		case spaceTrack, version, launch, longitude, latitude
		case heightKM = "height_km"
		case velocityKms = "velocity_kms"
		case id
	}
}

public enum Launch: String, Codable {
	case the5Eb87D14Ffd86E000604B361 = "5eb87d14ffd86e000604b361"
	case the5Eb87D30Ffd86E000604B378 = "5eb87d30ffd86e000604b378"
	case the5Eb87D39Ffd86E000604B37D = "5eb87d39ffd86e000604b37d"
	case the5Eb87D3Cffd86E000604B380 = "5eb87d3cffd86e000604b380"
	case the5Eb87D3Fffd86E000604B382 = "5eb87d3fffd86e000604b382"
	case the5Eb87D41Ffd86E000604B383 = "5eb87d41ffd86e000604b383"
	case the5Eb87D43Ffd86E000604B385 = "5eb87d43ffd86e000604b385"
	case the5Eb87D44Ffd86E000604B386 = "5eb87d44ffd86e000604b386"
	case the5Eb87D45Ffd86E000604B387 = "5eb87d45ffd86e000604b387"
	case the5Eb87D46Ffd86E000604B389 = "5eb87d46ffd86e000604b389"
}

// MARK: - SpaceTrack
public struct SpaceTrack: Codable {
	public let ccsdsOmmVers: String
	public let comment: Comment
	public let creationDate: CreationDate
	public let originator: Originator
	public let objectName, objectID: String
	public let centerName: CenterName
	public let refFrame: RefFrame
	public let timeSystem: TimeSystem
	public let meanElementTheory: MeanElementTheory
	public let epoch: String
	public let meanMotion, eccentricity, inclination, raOfAscNode: Double
	public let argOfPericenter, meanAnomaly: Double
	public let ephemerisType: Int
	public let classificationType: ClassificationType
	public let noradCatID, elementSetNo, revAtEpoch: Int
	public let bstar, meanMotionDot, meanMotionDdot, semimajorAxis: Double
	public let period, apoapsis, periapsis: Double
	public let objectType: ObjectType
	public let rcsSize: RCSSize
	public let countryCode: CountryCode
	public let launchDate: String
	public let site: Site
	public let decayDate: String?
	public let decayed, file, gpID: Int
	public let tleLine0, tleLine1, tleLine2: String
	
	public enum CodingKeys: String, CodingKey {
		case ccsdsOmmVers = "CCSDS_OMM_VERS"
		case comment = "COMMENT"
		case creationDate = "CREATION_DATE"
		case originator = "ORIGINATOR"
		case objectName = "OBJECT_NAME"
		case objectID = "OBJECT_ID"
		case centerName = "CENTER_NAME"
		case refFrame = "REF_FRAME"
		case timeSystem = "TIME_SYSTEM"
		case meanElementTheory = "MEAN_ELEMENT_THEORY"
		case epoch = "EPOCH"
		case meanMotion = "MEAN_MOTION"
		case eccentricity = "ECCENTRICITY"
		case inclination = "INCLINATION"
		case raOfAscNode = "RA_OF_ASC_NODE"
		case argOfPericenter = "ARG_OF_PERICENTER"
		case meanAnomaly = "MEAN_ANOMALY"
		case ephemerisType = "EPHEMERIS_TYPE"
		case classificationType = "CLASSIFICATION_TYPE"
		case noradCatID = "NORAD_CAT_ID"
		case elementSetNo = "ELEMENT_SET_NO"
		case revAtEpoch = "REV_AT_EPOCH"
		case bstar = "BSTAR"
		case meanMotionDot = "MEAN_MOTION_DOT"
		case meanMotionDdot = "MEAN_MOTION_DDOT"
		case semimajorAxis = "SEMIMAJOR_AXIS"
		case period = "PERIOD"
		case apoapsis = "APOAPSIS"
		case periapsis = "PERIAPSIS"
		case objectType = "OBJECT_TYPE"
		case rcsSize = "RCS_SIZE"
		case countryCode = "COUNTRY_CODE"
		case launchDate = "LAUNCH_DATE"
		case site = "SITE"
		case decayDate = "DECAY_DATE"
		case decayed = "DECAYED"
		case file = "FILE"
		case gpID = "GP_ID"
		case tleLine0 = "TLE_LINE0"
		case tleLine1 = "TLE_LINE1"
		case tleLine2 = "TLE_LINE2"
	}
}

public enum CenterName: String, Codable {
	case earth = "EARTH"
}

public  enum ClassificationType: String, Codable {
	case u = "U"
}

public  enum Comment: String, Codable {
	case generatedViaSpaceTrackOrgAPI = "GENERATED VIA SPACE-TRACK.ORG API"
}

public enum CountryCode: String, Codable {
	case us = "US"
}

public enum CreationDate: String, Codable {
	case the20200220213625 = "2020-02-20 21:36:25"
	case the20200309224617 = "2020-03-09 22:46:17"
	case the20200402181105 = "2020-04-02 18:11:05"
	case the20200527095608 = "2020-05-27 09:56:08"
	case the20200529070609 = "2020-05-29 07:06:09"
	case the20200714145608 = "2020-07-14 14:56:08"
	case the20200724062610 = "2020-07-24 06:26:10"
	case the20200725222610 = "2020-07-25 22:26:10"
	case the20200725223610 = "2020-07-25 22:36:10"
	case the20200726142610 = "2020-07-26 14:26:10"
	case the20200726143609 = "2020-07-26 14:36:09"
	case the20200726144610 = "2020-07-26 14:46:10"
	case the20200726145610 = "2020-07-26 14:56:10"
	case the20200726173720 = "2020-07-26 17:37:20"
	case the20200726221609 = "2020-07-26 22:16:09"
	case the20200726222610 = "2020-07-26 22:26:10"
	case the20200726223610 = "2020-07-26 22:36:10"
	case the20200726224610 = "2020-07-26 22:46:10"
}

public enum MeanElementTheory: String, Codable {
	case sgp4 = "SGP4"
}

public enum ObjectType: String, Codable {
	case payload = "PAYLOAD"
}

public enum Originator: String, Codable {
	case the18Spcs = "18 SPCS"
}

public enum RCSSize: String, Codable {
	case large = "LARGE"
	case medium = "MEDIUM"
}

public enum RefFrame: String, Codable {
	case teme = "TEME"
}

public enum Site: String, Codable {
	case afetr = "AFETR"
	case afwtr = "AFWTR"
}

public enum TimeSystem: String, Codable {
	case utc = "UTC"
}

public enum Version: String, Codable {
	case prototype = "prototype"
	case v09 = "v0.9"
	case v10 = "v1.0"
}

public typealias Welcome = [WelcomeElement]

public struct Ship: Codable {
	public let legacyID, model: String?
	public let type: TypeEnum
	public let roles: [String]
	public let imo, mmsi, abs, welcomeClass: Int?
	public let massKg, massLbs, yearBuilt: Int?
	public let homePort: HomePort
	public let status: String?
	public let speedKn, courseDeg, latitude, longitude: JSONNull?
	public let lastAisUpdate: JSONNull?
	public let link: String?
	public let image: String?
	public let launches: [String]
	public let name: String
	public let active: Bool
	public let id: String
	
	public enum CodingKeys: String, CodingKey {
		case legacyID = "legacy_id"
		case model, type, roles, imo, mmsi, abs
		case welcomeClass = "class"
		case massKg = "mass_kg"
		case massLbs = "mass_lbs"
		case yearBuilt = "year_built"
		case homePort = "home_port"
		case status
		case speedKn = "speed_kn"
		case courseDeg = "course_deg"
		case latitude, longitude
		case lastAisUpdate = "last_ais_update"
		case link, image, launches, name, active, id
	}
}

public enum HomePort: String, Codable {
	case fortLauderdale = "Fort Lauderdale"
	case portCanaveral = "Port Canaveral"
	case portOfLosAngeles = "Port of Los Angeles"
}

public enum TypeEnum: String, Codable {
	case barge = "Barge"
	case cargo = "Cargo"
	case highSpeedCraft = "High Speed Craft"
	case tug = "Tug"
}

public typealias Ships = [Ship]

// MARK: - Encode/decode helpers
public class JSONNull: Codable, Hashable {
	
	public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
		return true
	}
	
	public var hashValue: Int {
		return 0
	}
	
	public init() {}
	
	public required init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		if !container.decodeNil() {
			throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
		}
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encodeNil()
	}
}
