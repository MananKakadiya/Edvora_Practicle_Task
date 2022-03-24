//
//  UserModel.swift
//  Edvora_Practicle_Task
//
//  Created by Manan Kakadiya on 24/03/22.
//

import Foundation
import Foundation
struct UserModel : Codable {
    let station_code : Int?
    let name : String?
    let url : String?

    enum CodingKeys: String, CodingKey {

        case station_code = "station_code"
        case name = "name"
        case url = "url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        station_code = try values.decodeIfPresent(Int.self, forKey: .station_code)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }

}
