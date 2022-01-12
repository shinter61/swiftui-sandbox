//
//  ViewC.swift
//  ViewC
//
//  Created by 松本真太朗 on 2021/10/15.
//

import SwiftUI

struct ViewC: View {
    @Binding var rootIsActive: Bool
    @State private var showingD: Bool = false
    var body: some View {
        VStack {
            Text("View C")
            Button(action: {
                showingD.toggle()
            }) { Text("Dに行く") }
        
            NavigationLink(
                destination: ViewD(rootIsActive: self.$rootIsActive).navigationBarHidden(true),
                isActive: self.$showingD
            ) { EmptyView() }
        }
    }
}

struct ViewC_Previews: PreviewProvider {
    static var previews: some View {
        ViewC(rootIsActive: .constant(false))
    }
}
