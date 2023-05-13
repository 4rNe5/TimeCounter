//
//  ContentView.swift
//  TCount
//
//  Created by 4rNe5 on 2023/05/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "clock")
                .resizable()
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .frame(width: 100, height: 100)
            Text("타임카운트에 오신것을 환영합니다!")
                .bold()
                .font(.system(size: 20))
            Text("당신을 위한 시간 기록 & 관리 앱")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
