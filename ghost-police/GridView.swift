//
//  GridView.swift
//  ghost-police
//
//  Created by Ikroop Singh Kalsi on 21/12/23.
//

import SwiftUI


struct GridView: View {
    init(rows: Int, columns: Int) {
        model = GridViewModel(rows: rows, columns: columns)
    }
    
    @State private var model: GridViewModel
    @State private var isRandomizing: Bool = false
    
    var body: some View {
        VStack {
            let borderColor = Color.gray.opacity(0.5)
            GeometryReader { geo in
                let w = geo.size.width / CGFloat(model.columns)
                let h = geo.size.height / CGFloat(model.rows)
                let dw = (w / 2) - 18
                let dh = (h / 2) - 24
                ZStack(alignment: .topLeading) {
                    Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                        ForEach(0..<model.rows, id: \.self) { i in
                            GridRow(alignment: .center) {
                                ForEach(0..<model.columns, id: \.self) { j in
                                    Color.clear
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .background(Color.gray.opacity(0.7))
                                        .border(borderColor)
                                }
                            }
                        }
                    }
                    Text("👻")
                        .font(.largeTitle)
                        .offset(x: (w * CGFloat(model.ghostCoordinate.y) + dw) , y: (h * CGFloat(model.ghostCoordinate.x)) + dh)
                    Text("👮")
                        .font(.largeTitle)
                        .offset(x: (w * CGFloat(model.policeCoordinate.y) + dw) , y: (h * CGFloat(model.policeCoordinate.x)) + dh)
                }
                .border(borderColor)
                .border(borderColor)
            }
            .padding(42)
            .padding(.vertical, 64)
            Button("Change Positions") {
                isRandomizing = true
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                    withAnimation {
                        model.randomizeGhostCoordinates()
                    }
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                        withAnimation {
                            model.randomizePoliceCoordinates()
                            isRandomizing = false
                        }
                    }
                }
            }
            .disabled(isRandomizing)
            .padding(.bottom, 64)
        }
    }
}

#Preview {
    GridView(rows: 2, columns: 2)
}
