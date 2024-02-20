//
//  ChartTest.swift
//  Bookworm
//
//  Created by Lucas Pennice on 18/02/2024.
//

import SwiftUI
import Charts

private var coffeeSales = [
    (name: "Do Not Disturb", count: 3),
    (name: "Personal", count: 15),
    (name: "Work", count: 22),
    (name: "Sleep", count: 5),
    (name: "Fitness", count: 9),
]

struct ChartTest: View {
    var body: some View {
        VStack {
            Chart {
                ForEach(coffeeSales, id: \.name) { coffee in
             
                    SectorMark(
                        angle: .value("Cup", coffee.count),
                        innerRadius: .ratio(0.7),
                        angularInset: 5.0
                    )
                    .foregroundStyle(by: .value("Type", coffee.name))
                    .cornerRadius(10.0)
                    .annotation(position: .overlay) {
                        Text("\(coffee.count)")
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                }
            }
            .frame(height: 250)
        }
        .padding()
        .background(Color.init(uiColor: .secondarySystemBackground))
    }
}

#Preview {
    ChartTest()
}
