import Foundation
import NIO
import NIOHTTP1
import AsyncHTTPClient
import BitriseCURLAPI

struct BitriseCURLAPIClient {
  
  enum BitriseCURLAPIError : Error {
    case accountIDShouldNotBeEmpty
    case urlShouldNotBeInvalid
    case byteBufferIsBad
  }

  public static func startBuild(httpClient : HTTPClient, accountID: String, body: BitriseCURLAPIRequest, _ completion : @escaping (Result<BitriseCURLAPIResponse, Error>) -> Void) throws {

    let futureRequest = try buildRequest(accountID: accountID, body : body)
    httpClient.execute(request: futureRequest)
      .flatMapResult(convertFromByteBuffer(type: BitriseCURLAPIResponse.self))
      .whenComplete(completion)
  }
  
  public static func buildRequest(accountID: String, body: BitriseCURLAPIRequest) throws -> HTTPClient.Request {
    guard !accountID.isEmpty else { throw(BitriseCURLAPIError.accountIDShouldNotBeEmpty) }
    guard let url = URL(string: "https://app.bitrise.io/app/\(accountID)/build/start.json") else { throw(BitriseCURLAPIError.urlShouldNotBeInvalid) }

    return try HTTPClient.Request(
      url: url,
      method: .POST,
      headers: [
        "Accept": "application/json",
      ],
      body: .data(convertRequestToBody(body)))
  }

  private init() {}
  
  private static func convertRequestToBody(_ req : BitriseCURLAPIRequest) throws -> Data {
    let encoder = JSONEncoder()
    encoder.keyEncodingStrategy = .convertToSnakeCase
    return try encoder.encode(req)
  }
  
  private static func convertFromByteBuffer<T : Codable>(type : T.Type) -> ((_ response : HTTPClient.Response) -> Result<T, Error>) {
    return { response in
      guard let byteBuffer = response.body else { return .failure(BitriseCURLAPIError.byteBufferIsBad) }
      do {
        let obj = try JSONDecoder().decode(T.self, from: byteBuffer)
        return .success(obj)
      } catch {
        if let errorString = byteBuffer.getString(at: 0, length: byteBuffer.capacity, encoding: .utf8) {
          print(errorString)
        }
        return .failure(error)
      }
    }
  }
}
