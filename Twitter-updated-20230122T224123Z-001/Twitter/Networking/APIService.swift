//
//  APIService.swift
//  Twitter
//
//  Created by Nemanja Vlahovic on 30.11.22..
//

import Foundation

class APIService {

    static let shared = APIService()

    public func fetchHomeData(_ completion: (HomeResponse) -> ()) {

        let url = URL(string: Constants.URL.homeURL)!
        var response: HomeResponse?

        do {
            let jsonData = try Data(contentsOf: url)
            response = try JSONDecoder().decode(HomeResponse.self, from: jsonData)

            if let response = response {
                completion(response)
            } else {
                print("Failed to parse")
            }
            return
        } catch {
            print("Error: \(error)")
        }
    }
}
