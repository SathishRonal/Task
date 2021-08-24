//
//  AddVehicleModel.swift
//  Task
//
//  Created by SathizMacMini on 23/08/21.
//

import Foundation
struct AddVehicleModel : Codable {
    let status : Int?
    let message : String?
    let vehicle_type : [Vehicle_type]?
    let vehicle_capacity : [Vehicle_capacity]?
    let vehicle_make : [Vehicle_make]?
    let manufacture_year : [Manufacture_year]?
    let fuel_type : [Fuel_type]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case vehicle_type = "vehicle_type"
        case vehicle_capacity = "vehicle_capacity"
        case vehicle_make = "vehicle_make"
        case manufacture_year = "manufacture_year"
        case fuel_type = "fuel_type"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        vehicle_type = try values.decodeIfPresent([Vehicle_type].self, forKey: .vehicle_type)
        vehicle_capacity = try values.decodeIfPresent([Vehicle_capacity].self, forKey: .vehicle_capacity)
        vehicle_make = try values.decodeIfPresent([Vehicle_make].self, forKey: .vehicle_make)
        manufacture_year = try values.decodeIfPresent([Manufacture_year].self, forKey: .manufacture_year)
        fuel_type = try values.decodeIfPresent([Fuel_type].self, forKey: .fuel_type)
    }

}
struct Fuel_type : Codable {
    let text : String?
    let value : Int?
    let images : String?

    enum CodingKeys: String, CodingKey {

        case text = "text"
        case value = "value"
        case images = "images"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        text = try values.decodeIfPresent(String.self, forKey: .text)
        value = try values.decodeIfPresent(Int.self, forKey: .value)
        images = try values.decodeIfPresent(String.self, forKey: .images)
    }

}
struct Manufacture_year : Codable {
    let text : String?
    let value : Int?
    let images : String?

    enum CodingKeys: String, CodingKey {

        case text = "text"
        case value = "value"
        case images = "images"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        text = try values.decodeIfPresent(String.self, forKey: .text)
        value = try values.decodeIfPresent(Int.self, forKey: .value)
        images = try values.decodeIfPresent(String.self, forKey: .images)
    }

}
struct Vehicle_capacity : Codable {
    let text : String?
    let value : Int?
    let images : String?

    enum CodingKeys: String, CodingKey {

        case text = "text"
        case value = "value"
        case images = "images"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        text = try values.decodeIfPresent(String.self, forKey: .text)
        value = try values.decodeIfPresent(Int.self, forKey: .value)
        images = try values.decodeIfPresent(String.self, forKey: .images)
    }

}
struct Vehicle_make : Codable {
    let text : String?
    let value : Int?
    let images : String?

    enum CodingKeys: String, CodingKey {

        case text = "text"
        case value = "value"
        case images = "images"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        text = try values.decodeIfPresent(String.self, forKey: .text)
        value = try values.decodeIfPresent(Int.self, forKey: .value)
        images = try values.decodeIfPresent(String.self, forKey: .images)
    }

}

struct Vehicle_type : Codable {
    let text : String?
    let value : Int?
    let images : String?

    enum CodingKeys: String, CodingKey {

        case text = "text"
        case value = "value"
        case images = "images"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        text = try values.decodeIfPresent(String.self, forKey: .text)
        value = try values.decodeIfPresent(Int.self, forKey: .value)
        images = try values.decodeIfPresent(String.self, forKey: .images)
    }

}
