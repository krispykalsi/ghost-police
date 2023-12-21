//
//  GenerateGridView.swift
//  ghost-police
//
//  Created by Ikroop Singh Kalsi on 21/12/23.
//

import SwiftUI

// 1. 5,6 --> and then change position 5 times
// 2. 2,2 --> change position 5 times

struct GenerateGridView: View {
    @State private var rowPickerSelectedIndex = 3
    @State private var columnPickerSelectedIndex = 4
    
    private var rows: Int { rowPickerSelectedIndex + 2 }
    private var columns: Int { columnPickerSelectedIndex + 2 }
    
    var body: some View {
        NavigationStack {
            VStack() {
                HStack {
                    Text("Rows: ")
                    Spacer()
                    Picker("Rows", selection: $rowPickerSelectedIndex) {
                        ForEach(0..<19) {
                            Text("\($0 + 2)")
                        }
                    }
                }
                HStack {
                    Text("Columns: ")
                    Spacer()
                    Picker("Columns", selection: $columnPickerSelectedIndex) {
                        ForEach(0..<19) {
                            Text("\($0 + 2)")
                        }
                    }
                }
                
                NavigationLink("Generate Grid", value: 0)
                    .padding(.top, 12)
            }
            .frame(maxWidth: 200)
            .navigationDestination(for: Int.self) { _ in
                GridView(rows: rows, columns: columns)
                    .navigationTitle(Text("\(rows) x \(columns)"))
            }
        }
    }
}

#Preview {
    GenerateGridView()
}
