//
//  netWorking.swift
//  VirtualServers2
//
//  Created by Mohamed on 10/6/19.
//  Copyright © 2019 Mohamed. All rights reserved.
//

import Foundation
import Alamofire

final class netWorking {
    
    // MARK:  Typealias
    typealias WebServiceResponse = (virtualServerApiJson? , Error?) -> Void
    
    // MARK: Helper
    func execute(_url: URL , completion: @escaping WebServiceResponse) {
        Alamofire.request(_url).validate().responseJSON { response in
            if let erorr = response.error{
                completion(nil , erorr)
            } else if let jsonArray = response.data {
                let json = jsonArray
                print(json)
                do {
                    let object = try JSONDecoder().decode(virtualServerApiJson.self, from: json)
                    completion(object, nil)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
