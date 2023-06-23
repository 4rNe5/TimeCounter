////
////  TimerMakeView.swift
////  TCount
////
////  Created by 4rNe5 on 2023/05/22.
////
//import SwiftUI
//
//struct Timer: Identifiable {
//    var id = UUID()
//    var name: String
//    var duration: TimeInterval
//    var timer: DispatchSourceTimer?
//    var isRunning = false
//}
//
//class TimerManager: ObservableObject {
//    @Published var timers: [Timer] = []
//    
//    func createTimer(name: String, minutes: Int, seconds: Int) {
//        let duration = TimeInterval(minutes * 60 + seconds)
//        let newTimer = Timer(name: name, duration: duration, timer: nil, isRunning: false)
//        timers.append(newTimer)
//    }
//    
//    func startTimer(_ timer: Timer) {
//        guard let index = timers.firstIndex(where: { $0.id == timer.id }) else { return }
//        guard !timers[index].isRunning else { return }
//        
//        timers[index].isRunning = true
//        timers[index].timer = DispatchSource.makeTimerSource()
//        timers[index].timer?.schedule(deadline: .now(), repeating: 1.0)
//        timers[index].timer?.setEventHandler { [weak self] in
//            guard let self = self else { return }
//            
//            if self.timers[index].duration > 0 {
//                self.timers[index].duration -= 1
//            } else {
//                self.stopTimer(self.timers[index])
//            }
//        }
//        timers[index].timer?.resume()
//    }
//
//    func stopTimer(_ timer: Timer) {
//        guard let index = timers.firstIndex(where: { $0.id == timer.id }) else { return }
//        timers[index].isRunning = false
//        timers[index].timer?.cancel()
//        timers[index].timer = nil
//    }
//
//    // ...
//
//    Button(action: {
//        if timerManager.timers[index].isRunning {
//            timerManager.stopTimer(timerManager.timers[index])
//        } else {
//            timerManager.startTimer(timerManager.timers[index])
//        }
//    }) {
//        Text(timerManager.timers[index].isRunning ? "Stop" : "Start")
//            .foregroundColor(.white)
//            .padding(.horizontal, 12)
//            .padding(.vertical, 6)
//            .background(timerManager.timers[index].isRunning ? Color.red : Color.blue)
//            .cornerRadius(10)
//    }
//
//
//    func stopTimer(_ timer: Timer) {
//        guard let index = timers.firstIndex(where: { $0.id == timer.id }) else { return }
//        timers[index].isRunning = false
//        timers[index].timer?.cancel()
//        timers[index].timer = nil
//    }
//
//    
//    func stopTimer(_ timer: inout Timer) {
//        timer.isRunning = false
//        timer.timer?.cancel()
//        timer.timer = nil
//    }
//}
//
//struct TimerMakeView: View {
//    @StateObject private var timerManager = TimerManager()
//    @State private var timerName = ""
//    @State private var minutes = 0
//    @State private var seconds = 0
//    
//    var body: some View {
//        VStack {
//            HStack {
//                TextField("Timer Name", text: $timerName)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                
//                Stepper(value: $minutes, in: 0...59) {
//                    Text("\(minutes) min")
//                }
//                
//                Stepper(value: $seconds, in: 0...59) {
//                    Text("\(seconds) sec")
//                }
//            }
//            .padding()
//            
//            Button(action: {
//                timerManager.createTimer(name: timerName, minutes: minutes, seconds: seconds)
//            }) {
//                Text("Create Timer")
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.green)
//                    .cornerRadius(10)
//            }
//            
//            Spacer()
//            
//            VStack {
//                ForEach(timerManager.timers.indices, id: \.self) { index in
//                    HStack {
//                        Text(timerManager.timers[index].name)
//                            .font(.headline)
//                        
//                        Spacer()
//                        
//                        if timerManager.timers[index].isRunning {
//                            Text(timeString(from: timerManager.timers[index].duration))
//                                .font(.subheadline)
//                                .foregroundColor(.red)
//                        } else {
//                            Text("Stopped")
//                                .font(.subheadline)
//                                .foregroundColor(.gray)
//                        }
//                        
//                        Button(action: {
//                            if timerManager.timers[index].isRunning {
//                                timerManager.stopTimer(&timerManager.timers[index])
//                            } else {
//                                timerManager.startTimer(&timerManager.timers[index] as Timer)
//                            }
//                        }) {
//                            Text(timerManager.timers[index].isRunning ? "Stop" : "Start")
//                                .foregroundColor(.white)
//                                .padding(.horizontal, 12)
//                                .padding(.vertical, 6)
//                                .background(timerManager.timers[index].isRunning ? Color.red : Color.blue)
//                                .cornerRadius(10)
//                        }
//                    }
//                    .padding(.horizontal)
//                }
//            }
//
//        }
//        .padding()
//    }
//    
//    func timeString(from duration: TimeInterval) -> String {
//        let minutes = Int(duration) / 60
//        let seconds = Int(duration) % 60
//        return String(format: "%02d:%02d", minutes, seconds)
//    }
//}
//
//struct TimerMakeView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerView()
//    }
//}
