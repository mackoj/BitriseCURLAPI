import TinyNetworking
import Foundation
import BitriseCURLAPI

enum BitriseCURLAPIError : Error {
  case accountIDShouldNotBeEmpty
  case urlShouldNotBeInvalid
}

private func convertRequestToBody(_ req : BitriseCURLAPIRequest) throws -> Data {
  let encoder = JSONEncoder()
  encoder.keyEncodingStrategy = .convertToSnakeCase
  return try encoder.encode(req)
}

public func startBuild(accountID: String, body: BitriseCURLAPIRequest) throws -> Endpoint<BitriseCURLAPIResponse> {
  guard !accountID.isEmpty else { throw(BitriseCURLAPIError.accountIDShouldNotBeEmpty) }
  guard let url = URL(string: "https://app.bitrise.io/app/\(accountID)/build/start.json") else { throw(BitriseCURLAPIError.urlShouldNotBeInvalid) }
  
  return try Endpoint(json: .post, url: url, body: convertRequestToBody(body))
}

