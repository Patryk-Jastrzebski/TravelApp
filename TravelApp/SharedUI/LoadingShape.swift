//
//  LoadingShape.swift
//  TravelApp
//
//  Created by Patryk Jastrzębski on 17/06/2023.
//

import SwiftUI

struct LoadingShape: View {
    enum ShapeStyle {
        case circle
        case rectangle
    }
    var style: ShapeStyle = .rectangle
    var size: CGFloat = 32
    var body: some View {
        ZStack {
            switch style {
            case .circle:
                Circle()
                    .fill(.quaternary)
                    .frame(width: size, height: size)
            case .rectangle:
                RoundedRectangle(cornerRadius: 4)
                    .fill(.quaternary)
                    .frame(width: 96, height: 20)
            }
        }
    }
}

struct LoadingShape_Previews: PreviewProvider {
    static var previews: some View {
        LoadingShape()
    }
}
