//
//  GameView.swift
//  Capybara
//
//  Created by Пазин Даниил on 07/09/2023.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        Canvas { context, size in
            let ballOrigin = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
            let rect = CGRect(x: size.width * 0.5, y: size.height * 0.5, width: size.width * 0.1, height: size.height * 0.1)
            var path = Path(ellipseIn: rect)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
