//
//  TimerView.swift
//  TCount
//
//  Created by 4rNe5 on 2023/05/22.
//
import SwiftUI
import Foundation

struct TimerView: View {
    
    @State var date = Date()
    @State private var isPresentingSecondView = false
    
    var body: some View {
        VStack{
            Button(action: {
                isPresentingSecondView = true
            }) {
                Text("타이머 추가")
                    .foregroundColor(.white)
                    .frame(width: 110, height: 50)
                    .background(Color.accentColor)
                    .cornerRadius(50)



                
                .sheet(isPresented: $isPresentingSecondView) {
                    TimerMakeView()
                }
            }
        }
    }
}
        
        struct TimerView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
