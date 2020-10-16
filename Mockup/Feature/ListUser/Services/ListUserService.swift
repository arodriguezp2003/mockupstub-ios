//
//  ListUserService.swift
//  Mockup
//
//  Created by arodriguez on 16-10-20.
//

import Foundation

struct ErrorService: Error {
    let code: String
    let message: String
}

class ListUserService {
    
    func getUserList(_ completion: @escaping ((Result<ListUserResponse, ErrorService>)-> Void)) {

        guard let url = URL(string: "https://reqres.in/api/users") else {
            completion(.failure(ErrorService(code: "-1", message: "URL Invalida")))
            return
        }

        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let data = data else {
                completion(.failure(.init(code: "500", message: "Ocurrio un error")))
                return
            }
            
            guard let decode =  try? JSONDecoder().decode(ListUserResponse.self, from: data) else {
                completion(.failure(.init(code: "500", message: "Imposible decodear")))
                return
            }
            completion(.success(decode))
        })

        task.resume()
    }
}


