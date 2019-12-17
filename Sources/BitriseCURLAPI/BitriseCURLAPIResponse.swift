import Foundation

// MARK: - BitriseCURLResponse
public struct BitriseCURLAPIResponse: Equatable, Codable {
    public let status: String?
    public let message: String?
    public let slug: String?
    public let service: String?
    public let buildSlug: String?
    public let buildNumber: Int?
    public let buildurl: String?
    public let triggeredWorkflow: String?

    public init(status: String?, message: String?, slug: String?, service: String?, buildSlug: String?, buildNumber: Int?, buildurl: String?, triggeredWorkflow: String?) {
        self.status = status
        self.message = message
        self.slug = slug
        self.service = service
        self.buildSlug = buildSlug
        self.buildNumber = buildNumber
        self.buildurl = buildurl
        self.triggeredWorkflow = triggeredWorkflow
    }
}
