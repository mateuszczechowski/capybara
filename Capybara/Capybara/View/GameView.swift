//
//  GameView.swift
//  Capybara
//
//  Created by Пазин Даниил on 07/09/2023.
//

import SwiftUI
import CoreMotion

struct GameView: View {
    @EnvironmentObject private var repository: DatabaseRepository
    @EnvironmentObject private var motionDataManager: MotionDataManager
    @State private var gyroData: CMGyroData?
    @State private var appleAxisPoint: CGPoint?
    @State private var lastTime: TimeInterval = 0
    @State private var restartTime: TimeInterval = 2
    @State private var score = 0
    @State private var scoreMultiplier = 0.0
    @State private var initialTime = Date.now

    var body: some View {
        startGyros()
        return TimelineView(.animation) { timeline in
            Canvas { context, size in
                // Draw a highscore.
                context.draw(Text("Highscore: \(repository.highscoreName) \(repository.highscore)").bold(), in: CGRect(x: size.width * 0.1, y: size.height * 0.1, width: size.width, height: size.height * 0.2))
                // Draw a score.
                let time = timeline.date.timeIntervalSince(initialTime)
                scoreMultiplier += abs(gyroData?.rotationRate.z ?? 0) * 5
                context.draw(Text("Score: \(score)").bold(), in: CGRect(x: size.width * 0.1, y: size.height * 0.15, width: size.width, height: size.height * 0.2))
                // Draw a capybara.
                let image = context.resolve(Image("Capybara.large"))
                context.draw(image, in: CGRect(x: 0, y: size.height * 0.462, width: size.width, height: size.width))
                // Draw an apple.
                let appleDiameter = min(size.width, size.height) * 0.1
                let appleRadius = appleDiameter * 0.5
                guard var appleAxisPoint, let zRotation = gyroData?.rotationRate.z else {
                    appleAxisPoint = CGPoint(x: size.width * 0.5, y: size.height * 0.501 + appleRadius)
                    return
                }
                switch abs(size.width * 0.5 - appleAxisPoint.x) {
                case 0..<size.width * 0.01:
                    appleAxisPoint.y = size.height * 0.504 + appleRadius
                    appleAxisPoint.x += zRotation * 2
                    if size.width * 0.5 > appleAxisPoint.x {
                        appleAxisPoint.x -= 0.2
                    } else {
                        appleAxisPoint.x += 0.2
                    }
                    self.appleAxisPoint = appleAxisPoint
                    score = Int(time * scoreMultiplier)
                case size.width * 0.01..<size.width * 0.02:
                    appleAxisPoint.y = size.height * 0.505 + appleRadius
                    appleAxisPoint.x += zRotation * 2
                    if size.width * 0.5 > appleAxisPoint.x {
                        appleAxisPoint.x -= 0.3
                    } else {
                        appleAxisPoint.x += 0.3
                    }
                    self.appleAxisPoint = appleAxisPoint
                    score = Int(time * scoreMultiplier)
                case size.width * 0.02..<size.width * 0.03:
                    appleAxisPoint.y = size.height * 0.506 + appleRadius
                    appleAxisPoint.x += zRotation * 2
                    if size.width * 0.5 > appleAxisPoint.x {
                        appleAxisPoint.x -= 0.4
                    } else {
                        appleAxisPoint.x += 0.4
                    }
                    self.appleAxisPoint = appleAxisPoint
                    score = Int(time * scoreMultiplier)
                case size.width * 0.03..<size.width * 0.04:
                    appleAxisPoint.y = size.height * 0.507 + appleRadius
                    appleAxisPoint.x += zRotation * 2
                    if size.width * 0.5 > appleAxisPoint.x {
                        appleAxisPoint.x -= 0.5
                    } else {
                        appleAxisPoint.x += 0.5
                    }
                    self.appleAxisPoint = appleAxisPoint
                    score = Int(time * scoreMultiplier)
                case size.width * 0.04..<size.width * 0.05:
                    appleAxisPoint.y = size.height * 0.508 + appleRadius
                    appleAxisPoint.x += zRotation * 2
                    if size.width * 0.5 > appleAxisPoint.x {
                        appleAxisPoint.x -= 0.6
                    } else {
                        appleAxisPoint.x += 0.6
                    }
                    self.appleAxisPoint = appleAxisPoint
                    score = Int(time * scoreMultiplier)
                case size.width * 0.05..<size.width * 0.06:
                    appleAxisPoint.y = size.height * 0.509 + appleRadius
                    appleAxisPoint.x += zRotation * 2
                    if size.width * 0.5 > appleAxisPoint.x {
                        appleAxisPoint.x -= 0.7
                    } else {
                        appleAxisPoint.x += 0.7
                    }
                    self.appleAxisPoint = appleAxisPoint
                    score = Int(time * scoreMultiplier)
                case size.width * 0.06..<size.width * 0.07:
                    appleAxisPoint.y = size.height * 0.51 + appleRadius
                    appleAxisPoint.x += zRotation * 2
                    if size.width * 0.5 > appleAxisPoint.x {
                        appleAxisPoint.x -= 0.8
                    } else {
                        appleAxisPoint.x += 0.8
                    }
                    self.appleAxisPoint = appleAxisPoint
                    score = Int(time * scoreMultiplier)
                case size.width * 0.07..<size.width * 0.08:
                    appleAxisPoint.y = size.height * 0.512 + appleRadius
                    appleAxisPoint.x += zRotation * 2
                    if size.width * 0.5 > appleAxisPoint.x {
                        appleAxisPoint.x -= 0.9
                    } else {
                        appleAxisPoint.x += 0.9
                    }
                    self.appleAxisPoint = appleAxisPoint
                    score = Int(time * scoreMultiplier)
                case size.width * 0.08..<size.width * 0.09:
                    appleAxisPoint.y = size.height * 0.514 + appleRadius
                    appleAxisPoint.x += zRotation * 2
                    if size.width * 0.5 > appleAxisPoint.x {
                        appleAxisPoint.x -= 1
                    } else {
                        appleAxisPoint.x += 1
                    }
                    self.appleAxisPoint = appleAxisPoint
                    score = Int(time * scoreMultiplier)
                case size.width * 0.09..<size.width * 0.1:
                    appleAxisPoint.y = size.height * 0.516 + appleRadius
                    appleAxisPoint.x += zRotation * 2
                    if size.width * 0.5 > appleAxisPoint.x {
                        appleAxisPoint.x -= 1.1
                    } else {
                        appleAxisPoint.x += 1.1
                    }
                    self.appleAxisPoint = appleAxisPoint
                    score = Int(time * scoreMultiplier)
                case size.width * 0.1..<size.width * 0.11:
                    appleAxisPoint.y = size.height * 0.518 + appleRadius
                    appleAxisPoint.x += zRotation * 2
                    if size.width * 0.5 > appleAxisPoint.x {
                        appleAxisPoint.x -= 1.2
                    } else {
                        appleAxisPoint.x += 1.2
                    }
                    self.appleAxisPoint = appleAxisPoint
                    score = Int(time * scoreMultiplier)
                case size.width * 0.11..<size.width * 0.12:
                    appleAxisPoint.y = size.height * 0.52 + appleRadius
                    appleAxisPoint.x += zRotation * 2
                    if size.width * 0.5 > appleAxisPoint.x {
                        appleAxisPoint.x -= 1.3
                    } else {
                        appleAxisPoint.x += 1.3
                    }
                    self.appleAxisPoint = appleAxisPoint
                    score = Int(time * scoreMultiplier)
                case size.width * 0.12..<size.width * 0.13:
                    appleAxisPoint.y = size.height * 0.522 + appleRadius
                    appleAxisPoint.x += zRotation * 2
                    if size.width * 0.5 > appleAxisPoint.x {
                        appleAxisPoint.x -= 1.4
                    } else {
                        appleAxisPoint.x += 1.4
                    }
                    self.appleAxisPoint = appleAxisPoint
                    score = Int(time * scoreMultiplier)
                case size.width * 0.13..<size.width * 0.14:
                    appleAxisPoint.y = size.height * 0.524 + appleRadius
                    appleAxisPoint.x += zRotation * 2
                    if size.width * 0.5 > appleAxisPoint.x {
                        appleAxisPoint.x -= 1.5
                    } else {
                        appleAxisPoint.x += 1.5
                    }
                    self.appleAxisPoint = appleAxisPoint
                    score = Int(time * scoreMultiplier)
                default:
                    let now = timeline.date.timeIntervalSinceReferenceDate
                    var delta = 0.0
                    if lastTime == 0 {
                        lastTime = now
                    } else {
                        delta = now - lastTime
                    }
                    if appleAxisPoint.y + delta < size.height {
                        appleAxisPoint.y = pow(appleAxisPoint.y + delta, 1.004)
                        self.appleAxisPoint = appleAxisPoint
                    } else {
                        appleAxisPoint.y = size.height
                        if restartTime - delta < 0 {
                            lastTime = 0
                            self.appleAxisPoint = nil
                            restartTime = 2
                            score = 0
                            initialTime = Date.now
                            scoreMultiplier = 0
                        }
                    }
                    updateHighscore()
                }
                let appleSize = CGSize(width: appleDiameter, height: appleDiameter)
                let appleOrigin = CGPoint(x: appleAxisPoint.x - appleRadius, y: appleAxisPoint.y - appleDiameter)
                let appleRect = CGRect(origin: appleOrigin, size: appleSize)
                let applePath = Path(ellipseIn: appleRect)
                context.fill(applePath, with: .color(.green))
            }
        }
        .onDisappear(perform: {
            motionDataManager.motionManager.stopGyroUpdates()
        })
    }

    private func startGyros() {
        motionDataManager.motionManager.startGyroUpdates(to: .main) { gyroData, _ in
            self.gyroData = gyroData
        }
    }

    private func updateHighscore() {
        let highscore = repository.highscore
        if score > highscore {
            repository.updateHighscore(score: score)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(MotionDataManager())
            .environmentObject(DatabaseRepository())
    }
}
