//
//  RepositoryAPIStore.swift
//  GithubAPI
//
//  Created by Robson Moreira on 14/01/21.
//  Copyright © 2021 Robson Moreira. All rights reserved.
//

import Foundation
import Domain

private enum Result<T> {
    case success(T)
    case failure(Error)
}

class SimulationAPIStore: GenericAPIStore, SimulationStore {
    
    func getSimulation(investedAmount: Double, rate: Double, maturityDate: String, completion: @escaping (Simulation?, NSError?) -> Void) {
        do {
            let urlRequest = try SimulationRouter.calculatorSimulate(investedAmount: investedAmount, rate: rate, maturityDate: maturityDate).asURLRequest()
            if let url = urlRequest {
                self.getSimulation(url: url) { (result) in
                    switch result {
                    case .success(let data):
                        do {
                            let simulation = try JSONDecoder().decode(Simulation.self, from: data)
                            completion(simulation, nil)
                        } catch {
                            completion(nil, error as NSError)
                        }
                    case .failure(let error):
                        completion(nil, error as NSError)
                    }
                }
            }
        } catch let error as NSError {
            completion(nil, error)
        }
    }
    
    fileprivate func getSimulation(url: URL, result: @escaping ((Result<Data>) -> Void)) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let `data` = data else {
                result(.failure(self.error))
                return
            }
            
            if let `error` = error {
                result(.failure(error))
                return
            }
            
            result(.success(data))
        }
        task.resume()
    }

}
