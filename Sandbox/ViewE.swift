//
//  ViewE.swift
//  ViewE
//
//  Created by 松本真太朗 on 2021/10/15.
//

import SwiftUI

struct ViewE: View {
    @Binding var rootIsActive: Bool
    var body: some View {
        VStack {
            Text("View E")
            Button(action: {
                rootIsActive = false
            }) {
                Text("戻る")
            }
        }
    }
}

struct ViewE_Previews: PreviewProvider {
    static var previews: some View {
        ViewE(rootIsActive:  .constant(false))
    }
}
