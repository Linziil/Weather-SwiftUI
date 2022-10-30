//
//  ContentView.swift
//  Weather
//
//  Created by Lin Werle on 10/28/22.
//

import SwiftUI

struct ContentView: View, Sendable {
	
	@EnvironmentObject var fetcher: WeatherService
	
	var body: some View {
		NavigationView {
			Color.blue
				.opacity(0.3)
				.ignoresSafeArea(edges: .all)
				.overlay {
					VStack(alignment: .leading) {
						Text(fetcher.weatherTitle ?? "")
							.font(.title)
							.padding()
						
						List{
							ForEach(fetcher.weatherDetailList, id: \.id) { item in
								NavigationLink {
									WeatherDetailView(weatherDetail: item)
								} label: {
									Text(item.senderName)
								}
							}
						}
						.listStyle(.plain)
					}
				}
				.navigationTitle("Weather")
				.navigationViewStyle(.stack)
		}
		.task {
			try? await fetcher.fetchData()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.environmentObject(WeatherService())
	}
}
