//
//  ContentView.swift
//  TCount
//
//  Created by 4rNe5 on 2023/05/14.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
              TimerView()
                .tabItem {
                  Image(systemName: "clock.badge")
                  Text("타이머")
                }
              Text("최근 카운트한 타이머 기록을 보여주는 뷰")
                .tabItem {
                  Image(systemName: "list.bullet.circle")
                  Text("기록")
              }
              Text("사용자 정보를 보여주는 뷰")
                .tabItem {
                  Image(systemName: "person.circle.fill")
                  Text("정보")
                }
            Text("설정을 보여주는 뷰")
              .tabItem {
                Image(systemName: "ellipsis.circle.fill")
                Text("설정")
              }
            }
            .font(.headline)
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
