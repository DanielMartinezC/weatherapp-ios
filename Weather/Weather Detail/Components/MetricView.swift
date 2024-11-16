//
//  MetricView.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 15/11/24.
//

import SwiftUI

struct MetricView: View {
    var title: String
    var icon: String
    var mainText: String
    var subtitle: String = String.empty

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .firstTextBaseline, spacing: 5) {
                Image(systemName: icon)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                Text(title)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding(.top, 5)

            if !mainText.isEmpty {
                Text(mainText)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }

            if !subtitle.isEmpty {
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(.top, 5)
                    .lineLimit(2)
            }
        }
        .frame(width: 120, height: 120, alignment: .top)
        .padding()
        .backgroundBlur(radius: 25, opaque: true)
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        }
        
    }
}
