//
//  WeatherService.swift
//  Weather
//
//  Created by Lin Werle on 10/28/22.
//

import SwiftUI

class WeatherService: ObservableObject {

	@Published var weatherDetailList = [WeatherDetails]()
	@Published var weatherTitle: String?
	let urlString = "https://api.weather.gov/alerts/active?area=FL"
	
	enum FetchError: Error {
		case badRequest
		case badJSON
	}
	
	@available(iOS 15.0, *)
	
	func fetchData() async
	throws {
		guard let url = URL(string: urlString) else { return }
	
		let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
		guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badRequest }
	
		Task { @MainActor in
			do {
				let result = try JSONDecoder().decode(Weather.self, from: data)
				self.weatherDetailList = result.weatherList.compactMap { $0.details }
				self.weatherTitle = result.title
			} catch let jsonError as NSError  {
				print("JSON decode failed: \(jsonError.localizedDescription)")
				throw FetchError.badJSON
			}
		}
	}
}
