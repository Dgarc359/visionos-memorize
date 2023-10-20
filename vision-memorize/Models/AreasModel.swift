//
//  AreasModel.swift
//  vision-memorize
//
//  Created by David Garcia on 10/13/23.
//

import Foundation

enum Area: String, Identifiable, CaseIterable, Equatable
{
    case gaming, cars, sports
    var id: Self { self }
    var name: String { rawValue.lowercased() }
    
    var title: String {
        switch self {
        case.gaming:
            "The crew"
        case.cars:
            "The equipment"
        case.sports:
            "The mission"
        }
    }
    
}
