//
//  Model.swift
//  Sandbox
//
//  Created by 松本真太朗 on 2021/12/31.
//

import Foundation

struct Model {
    enum Pet:String {
        case dog
        case cat
    }
    
    var pet: Pet = .dog
    
    mutating func switchPet() {
        if pet == .dog {
            pet = .cat
        } else {
            pet = .dog
        }
    }
}
