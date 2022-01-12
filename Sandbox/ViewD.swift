//
//  ViewD.swift
//  ViewD
//
//  Created by 松本真太朗 on 2021/10/15.
//

import SwiftUI

struct ViewD: View {
    @Binding var rootIsActive: Bool
    @State private var showingE: Bool = false
    var body: some View {
        VStack {
            Text("View D")
            Button(action: {
                showingE = true
            }) {
                Text("Eに行く")
            }
            Button(action: {
                rootIsActive = false
            }) {
                Text("戻る")
            }
            NavigationLink(
                destination: ViewE(rootIsActive: self.$rootIsActive).navigationBarHidden(true),
                isActive: self.$showingE
            ) { EmptyView() }
        }
    }
}

struct ViewD_Previews: PreviewProvider {
    static var previews: some View {
        ViewD(rootIsActive: .constant(false))
    }
}
