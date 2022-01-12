//
//  ContentView.swift
//  Sandbox
//
//  Created by 松本真太朗 on 2021/10/15.
//

import SwiftUI

struct ContentView: View {
    @State private var showingA: Bool = false
    @State private var showingB: Bool = false
    @State private var showingC: Bool = false
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text(viewModel.pet)
                    .padding()
                    .onTapGesture {
                        viewModel.switchPet()
                    }
                
                Button(action: {
                    showingA.toggle()
                }) { Text("Aに行く") }
                Button(action: {
                    showingB.toggle()
                }) { Text("Bに行く") }
                Button(action: {
                    showingC.toggle()
                }) { Text("Cに行く") }
                
                Spacer()
                
                BannerView()
//                    .frame(width: 300, height: 100, alignment: .center)
                
                NavigationLink(
                    destination: ViewA().navigationBarHidden(true),
                    isActive: self.$showingA
                ) { EmptyView() }
                NavigationLink(
                    destination: ViewB().navigationBarHidden(true),
                    isActive: self.$showingB
                ) { EmptyView() }
                NavigationLink(
                    destination: ViewC(rootIsActive: self.$showingC).navigationBarHidden(true),
                    isActive: self.$showingC
                ) { EmptyView() }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
