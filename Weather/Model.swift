//
//  Model.swift
//  Weather
//
//  Created by Lin Werle on 10/28/22.
//

import Foundation

struct Weather: Decodable {
	let title: String
	let weatherList: [WeatherList]
	
	private enum CodingKeys: String, CodingKey {
		case title, weatherList = "features"
	}
}

struct WeatherList: Decodable, Identifiable  {
	let id: String
	let details: WeatherDetails
	
	private enum CodingKeys: String, CodingKey {
		case id, details = "properties"
	}
}

struct WeatherDetails: Decodable, Identifiable  {
	let id: String
	let headline: String
	let senderName: String
	let description: String

}
