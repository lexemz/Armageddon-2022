//
//  NetworkService.swift
//  Armageddon 2022
//
//  Created by Igor Buzykin on 12.06.2022.
//

import Foundation

enum NetworkServiceError: Error {
    case invalidUrl
    case transportError(Error?)
    case serverSideError(Int)
    case decoderError(Error?)
}

extension NetworkServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidUrl: return "The string is not a url!"
        case .transportError(let error): return error?.localizedDescription
        case .serverSideError(let errorCode): return "Server Side Error - code: \(errorCode)"
        case.decoderError(let error): return error?.localizedDescription
        }
    }
}

final class NetworkService {
    func fetch<T: Decodable>(
        _ T: T.Type,
        url: String,
        completion: @escaping (Result<T, NetworkServiceError>) -> Void
    ) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                completion(.failure(.transportError(error)))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                let code = response.statusCode
                guard (200...299).contains(code) else {
                    completion(.failure(.serverSideError(code)))
                    return
                }
            }
            
            do {
                let data = try JSONDecoder().decode(T.self, from: data)
                completion(.success(data))
            } catch let error {
                completion(.failure(.decoderError(error)))
            }

        }
        task.resume()
    }
}
