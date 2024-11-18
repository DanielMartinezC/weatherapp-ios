//
//  MetricView.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 15/11/24.
//

import SwiftUI

struct MetricView: View {
    @EnvironmentObject private var themeProvider: ThemeProvider
    
    var title: String
    var icon: Image
    var mainText: String
    var subtitle: String = String.empty

    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .firstTextBaseline, spacing: 5) {
                icon
                    .captionStyle(themeProvider.theme.colorTheme.label.opacity(0.4))
                Text(title)
                    .captionStyle(themeProvider.theme.colorTheme.label.opacity(0.4))
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding(.top, 5)

            if !mainText.isEmpty {
                Text(mainText)
                    .bodyStyle()
            }

            if !subtitle.isEmpty {
                Spacer()
                Text(subtitle)
                    .captionStyle()
                    .lineLimit(3)
            }
        }
        .frame(width: 120, height: 120, alignment: .top)
        .padding()
        .backgroundBlur(radius: 25, opaque: true)
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(themeProvider.theme.colorTheme.border, lineWidth: 1)
        }
        
    }
}

#if DEBUG
struct MetricView_Previews: PreviewProvider {
    static var previews: some View {
        MetricView(title: "Rain", icon: Image(systemName: "rain"), mainText: "11 mm/h", subtitle: "Expect more rain")
            .environmentObject(ThemeProvider.shared)
            .previewLayout(.sizeThatFits)
    }
}
#endif
