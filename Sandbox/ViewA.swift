//
//  ViewA.swift
//  ViewA
//
//  Created by 松本真太朗 on 2021/10/15.
//

import SwiftUI

extension DispatchQueue {
    func throttle(delay: DispatchTimeInterval) -> (_ action: @escaping () -> ()) -> () {
        var lastFireTime: DispatchTime = .now()

        return { [weak self, delay] action in
            let deadline: DispatchTime = .now() + delay
            self?.asyncAfter(deadline: deadline) { [delay] in
                let now: DispatchTime = .now()
                let when: DispatchTime = lastFireTime + delay
                if now < when { return }
                lastFireTime = .now()
                action()
            }
        }
    }
    
    func debounce(delay: DispatchTimeInterval) -> (_ action: @escaping () -> ()) -> () {
        var lastFireTime: DispatchTime = .now()

        return { [weak self, delay] action in
            let deadline: DispatchTime = .now() + delay
            lastFireTime = .now()
            self?.asyncAfter(deadline: deadline) { [delay] in
                let now: DispatchTime = .now()
                let when: DispatchTime = lastFireTime + delay
                if now < when { return }
                lastFireTime = .now()
                action()
            }
        }
    }
}

struct ViewA: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var text: String = ""
    var body: some View {
        VStack {
            Text("View A")
            Text(text)
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("戻る")
            }
            Text("押せ！！")
                .onTapGesture(count: 3) {
                    text = text + "a"
                }
                .onTapGesture(count: 2) {
                    text = text + "a"
                }
                .onTapGesture(count: 1) {
                    text = text + "a"
                }
            Button(action: {
                text = ""
            }) {
                Text("リセット")
            }
            
            Text("double click")
                .onTapGesture(count: 2) {
                    text = "double clicked!!"
                }
                .onTapGesture(count: 1) {
                    text = "single click"
                }
        }
    }
}

struct ViewA_Previews: PreviewProvider {
    static var previews: some View {
        ViewA()
    }
}
