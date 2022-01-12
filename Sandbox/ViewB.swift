//
//  ViewB.swift
//  ViewB
//
//  Created by 松本真太朗 on 2021/10/15.
//

import SwiftUI

struct ViewB: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var flag: Bool = true
    var body: some View {
        if #available(iOS 15.0, *) {
            ZStack {
                VStack {
                    Text("View B")
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("戻る")
                    }
                }
                if flag {
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: 0))
                        path.addLine(to: CGPoint(x: Int(UIScreen.main.bounds.width), y: 0))
                        path.addLine(to: CGPoint(x: 0, y: Int(UIScreen.main.bounds.height)))
                    }
                    .fill(Color.red)
                    .transition(.move(edge: .leading))
                    Path { path in
                        path.move(to: CGPoint(x: Int(UIScreen.main.bounds.width), y: 0))
                        path.addLine(to: CGPoint(x: 0, y: Int(UIScreen.main.bounds.height)))
                        path.addLine(to: CGPoint(x: Int(UIScreen.main.bounds.width), y: Int(UIScreen.main.bounds.height)))
                    }
                    .fill(Color.blue)
                    .transition(.move(edge: .trailing))
                }
            }
            .task {
                sleep(1)
                withAnimation {
                    self.flag.toggle()
                }
            }
        }
    }
}

struct ViewB_Previews: PreviewProvider {
    static var previews: some View {
        ViewB()
    }
}
