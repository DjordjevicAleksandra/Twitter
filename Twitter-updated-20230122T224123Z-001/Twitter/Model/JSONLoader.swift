import Foundation

struct HomeResponse: Codable {
    let users: [User]
    let tweets: [Tweet]
}
