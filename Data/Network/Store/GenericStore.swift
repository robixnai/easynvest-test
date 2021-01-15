//
//  GenericStore.swift
//  GithubAPI
//
//  Created by Robson Moreira on 14/01/21.
//  Copyright © 2021 Robson Moreira. All rights reserved.
//

import Foundation

protocol GenericStore {
    
    var error: NSError { set get }
    typealias completion<T> = (_ result: T, _ failure: NSError?) -> Void
    
}

class GenericAPIStore {
    
    var error = NSError(domain: "", code: 901, userInfo: [NSLocalizedDescriptionKey: "Erro ao obter as informações"])
    
}
