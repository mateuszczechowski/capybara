//
//  GameView.swift
//  Capybara
//
//  Created by Пазин Даниил on 07/09/2023.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject private var motionDataManager: MotionDataManager

    var body: some View {
        motionDataManager.motionManager.startGyroUpdates()

        return Canvas { context, size in
            

            let ballDiameter = min(size.width, size.height) * 0.1
            let ballSize = CGSize(width: ballDiameter, height: ballDiameter)
            let ballOrigin = CGPoint(x: (size.width - ballDiameter) * 0.5, y: (size.height - ballDiameter) * 0.4)
            let ballRect = CGRect(origin: ballOrigin, size: ballSize)
            var path = Path(ellipseIn: ballRect)



            context.fill(path, with: .color(.orange))
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(MotionDataManager())
    }
}
