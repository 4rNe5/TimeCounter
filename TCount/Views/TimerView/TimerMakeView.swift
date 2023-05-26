//
//  TimerMakeView.swift
//  TCount
//
//  Created by 4rNe5 on 2023/05/22.
//
import SwiftUI

struct TimerMakeView: View {
    @State private var goals = ["목표 1", "목표 2", "목표 3"]
    @State private var tasks = ["할 일 1", "할 일 2", "할 일 3"]

    var body: some View {
        Text("새로운 타이머 만들기")
            .font(.title)
            .bold()
            .offset(x: 0, y: -150)
            .padding()
        List {
            ForEach(goals, id: \.self) { goal in
                Section(header: Text(goal)) {
                    ForEach(tasks) { task in
                        TextField("할 일", text: $task)
                    }
                }
            }
        }
    }
}



    
    struct TimerMakeView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
