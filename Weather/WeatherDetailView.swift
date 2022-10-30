//
//  WeatherDetail.swift
//  Weather
//
//  Created by Lin Werle on 10/28/22.
//

import SwiftUI

struct WeatherDetailView: View {
	
	var weatherDetail: WeatherDetails
	var body: some View {
		
		VStack(alignment: .leading){
			Text(self.weatherDetail.senderName)
				.font(.title)
				.padding()
			Divider()
			Text(self.weatherDetail.headline)
				.font(.headline)
				.padding()
			Text(self.weatherDetail.description)
				.font(.body)
				.padding()
			Spacer()
		}
	}
}
