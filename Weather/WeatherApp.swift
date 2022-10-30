//
//  WeatherApp.swift
//  Weather
//
//  Created by Lin Werle on 10/28/22.
//

import SwiftUI

@main
struct WeatherApp: App {
	
	@StateObject private var fetcher = WeatherService()
	
	var body: some Scene {
		WindowGroup {
			ContentView()
				.environmentObject(fetcher)
		}
	}
}
