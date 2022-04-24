
import Foundation

struct DataModel: Codable {
    let devices: [DeviceModel]?
}

// MARK: - Device
struct DeviceModel: Codable {
    let id, title: String
    let price: Int
    let currency: String
    let os, status, imageURL, size: String

    enum CodingKeys: String, CodingKey {
        case id, title, price, currency
        case os = "OS"
        case status
        case imageURL = "imageUrl"
        case size = "size:"
    }
}
