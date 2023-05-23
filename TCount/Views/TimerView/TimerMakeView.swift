//
//  TimerMakeView.swift
//  TCount
//
//  Created by 4rNe5 on 2023/05/22.
//
import SwiftUI

struct TimerMakeView: View {
    @State var date = Date()
    var body: some View {
        Text("새로운 타이머 만들기")
        
    }
    
    
    struct TimerMakeView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
