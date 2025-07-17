//
//  ContentView.swift
//  StopWatch
//
//  Created by A S on 2025/07/17.
//

import SwiftUI

struct ContentView: View {
    
    @State var timer: Timer!
    @State var secondsElapsed: Double = 0.0
    @State var isRunning: Bool = false
    
    var body: some View {
        VStack {
            Text(String(format: "%.2f", secondsElapsed))
                .font(.title)
            
            HStack {
                if isRunning { // 稼働している時
                    
                    Button {
                        pause()
                    } label: {
                        Image(systemName: "pause.fill")
                            .foregroundStyle(.white)
                            .font(.title)
                            .padding()
                            .background(.orange)
                            .clipShape(.circle)
                    }
                } else { // 静止している時
                    
                    Button {
                        start()
                    } label: {
                        Image(systemName: "play.fill")
                            .foregroundStyle(.white)
                            .font(.title)
                            .padding()
                            .background(.green)
                            .clipShape(.circle)
                    }
                    
                }
                
                if secondsElapsed != 0.0 {
                    
                    Button {
                        stop()
                    } label: {
                        Image(systemName: "stop.fill")
                            .foregroundStyle(.white)
                            .font(.title)
                            .padding()
                            .background(.red)
                            .clipShape(.circle)
                    }
                }
            }
        }
        .padding()
    }
    
    private func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            secondsElapsed += 0.1
        }
        isRunning = true
    }
    
    private func pause() {
        timer.invalidate()
        isRunning = false
    }
    
    private func stop() {
        timer.invalidate()
        isRunning = false
        secondsElapsed = 0.0
    }
}

#Preview {
    ContentView()
}
