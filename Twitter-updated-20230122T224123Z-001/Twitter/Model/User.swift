import Foundation

struct User: Codable {
    
    let id: Int
    let name, username, bio: String
    let profileImageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, username, bio
        case profileImageURL = "profileImageUrl"
    }
}
