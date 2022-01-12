//
//  ViewModel.swift
//  Sandbox
//
//  Created by 松本真太朗 on 2021/12/31.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var model: Model = Model()
    
    var pet: String {
        return model.pet.rawValue
    }
    
    func switchPet() {
        model.switchPet()
    }
}
