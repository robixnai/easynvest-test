//
//  RepositoryStore.swift
//  GithubAPI
//
//  Created by Robson Moreira on 28/01/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import Foundation
import Domain

protocol SimulationStore: GenericStore {
    
    func getSimulation(investedAmount: Double, rate: Double, maturityDate: String, completion: @escaping completion<Simulation?>)

}
