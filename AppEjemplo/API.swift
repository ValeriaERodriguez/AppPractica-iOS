//
//  API.swift
//  AppEjemplo
//
//  Created by Mac on 22/07/2022.
//  Copyright © 2022 Valeria. All rights reserved.
//

import Foundation
import Alamofire

class API{
    private(set) static var shared: API = .init()
    
    func getDogAPI(onSuccess: @escaping (dogApiResponse) -> Void, onError: @escaping (DogapiError) -> Void)  {
        let resquest = AF.request("https://dog.ceo/api/breeds/image/random")
        resquest.responseData(){ response in
            
            guard let data = response.data else{
                onError(.serverError)
                return
            }
            let decoder = JSONDecoder()
            
            do{
               let response = try decoder.decode(dogApiResponse.self, from: data)
                onSuccess(response)
            } catch{
                onError(.decodingError)
            }
        }
    }
}
enum DogapiError {
    case serverError
    case decodingError
}

