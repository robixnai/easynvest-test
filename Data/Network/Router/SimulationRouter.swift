//
//  RepositoryRouter.swift
//  GithubAPI
//
//  Created by Robson Moreira on 14/01/21.
//  Copyright © 2021 Robson Moreira. All rights reserved.
//

import Foundation

enum SimulationRouter {
    
    case calculatorSimulate(investedAmount: Double, rate: Double, maturityDate: String)
    
    var path: String {
        switch self {
        case .calculatorSimulate:
            return API.calculatorSimulate
        }
    }
    
    func asURLRequest() throws -> URL? {
        switch self {
        case .calculatorSimulate(let investedAmount, let rate, let maturityDate):
            guard var urlComponents = URLComponents(string: API.baseURL) else {return nil}
            urlComponents.queryItems = [
                URLQueryItem(name: "investedAmount", value: String(investedAmount)),
                URLQueryItem(name: "index", value: "CDI"),
                URLQueryItem(name: "rate", value: String(rate)),
                URLQueryItem(name: "isTaxFree", value: String(false)),
                URLQueryItem(name: "maturityDate", value: maturityDate)
            ]
            
            guard let url = urlComponents.url else {return nil}
            
            return url.appendingPathComponent(path)
        }
    }
    
}
