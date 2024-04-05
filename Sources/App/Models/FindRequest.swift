import Vapor

struct FindRequest: Decodable {
    let name: String
}
