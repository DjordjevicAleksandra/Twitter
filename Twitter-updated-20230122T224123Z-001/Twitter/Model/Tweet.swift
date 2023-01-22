import Foundation

struct Tweet: Codable {
    let user: User
    let tweetImage: TweetImage?
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case user
        case tweetImage = "TweetImage"
        case message = "Message"
    }
}

struct TweetImage: Codable {
    let width, height: Int
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case width, height
        case imageURL = "ImageUrl"
    }
}
