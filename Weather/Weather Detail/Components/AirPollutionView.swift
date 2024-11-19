//
//  AirPollutionView.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 18/11/24.
//

import SwiftUI

struct AirPollutionView: View {
    @EnvironmentObject private var themeProvider: ThemeProvider
    
    let value: String
    let risk: String
    let aqiNumber: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline, spacing: 5) {
                Image(systemName: "aqi.medium")
                    .captionStyle(themeProvider.theme.colorTheme.label.opacity(0.4))
                Text("AIR POLLUTION")
                    .captionStyle(themeProvider.theme.colorTheme.label.opacity(0.4))
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding(.top, 5)

            Text("\(value)")
                .titleStyle()
            Text("\(risk) Health Risk")
                .labelStyle()
            
            ProgressView(value: Double(aqiNumber), total: 5)
                .progressViewStyle(LinearProgressViewStyle(tint: themeProvider.theme.colorTheme.primary))
                .scaleEffect(x: 1, y: 2, anchor: .center)
            
        }
        .padding()
        .backgroundBlur(radius: 15, opaque: true)
        .cornerRadius(15)
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(themeProvider.theme.colorTheme.border, lineWidth: 1)
        }
        .shadow(color: themeProvider.theme.colorTheme.shadow, radius: 30, x:0, y: 10)
    }
}

#if DEBUG
struct AirPollutionView_Previews: PreviewProvider {
    static var previews: some View {
        AirPollutionView(value: "2", risk: "Low", aqiNumber: 2)
            .environmentObject(ThemeProvider.shared)
            .previewLayout(.sizeThatFits)
    }
}
#endif
