//
//  WeatherDashboardView.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 13/11/24.
//

import SwiftUI

struct AirPollutionView: View {
    let value: String?
    let risk: String?
    let aqiNumber: Int?
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline, spacing: 5) {
                Image(systemName: "aqi.medium")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                Text("AIR POLLUTION")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding(.top, 5)

            if let value = value, let risk = risk, let aqiNumber = aqiNumber {
                Text("\(value)")
                    .titleStyle()
                Text("\(risk) Health Risk")
                    .labelStyle()
                
                ProgressView(value: Double(aqiNumber), total: 5)
                    .progressViewStyle(LinearProgressViewStyle(tint: .purple))
                    .scaleEffect(x: 1, y: 2, anchor: .center)
            } else {
                Text("-")
                    .titleStyle()
            }
            
        }
        .padding()
        .backgroundBlur(radius: 15, opaque: true)
        .cornerRadius(15)
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        }
    }
}

struct SunEventsView: View {
    let sunrise: String
    let sunset: String
    var body: some View {
        MetricView(
            title: "SUNRISE",
            icon: "sunrise.fill",
            mainText: sunrise,
            subtitle: "Sunset: \(sunset)"
        )
    }
}

struct WindView: View {
    let value: String
    var body: some View {
        MetricView(
            title: "WIND",
            icon: "wind",
            mainText: value
        )
    }
}

struct RainfallView: View {
    let value: String
    var body: some View {
        MetricView(
            title: "RAINFALL",
            icon: "cloud.rain.fill",
            mainText: value,
            subtitle: "in last hour"
        )
    }
}

struct SnowView: View {
    let value: String
    var body: some View {
        MetricView(
            title: "SNOW",
            icon: "cloud.snow.fill",
            mainText: value,
            subtitle: "in last hour"
        )
    }
}

struct FeelsLikeView: View {
    let value: String
    var body: some View {
        MetricView(
            title: "FEELS LIKE",
            icon: "thermometer",
            mainText: value,
            subtitle: "Similar to the actual temperature."
        )
    }
}

struct HumidityView: View {
    let value: String
    var body: some View {
        MetricView(
            title: "HUMIDITY",
            icon: "humidity.fill",
            mainText: value,
            subtitle: "The dew point is 17 right now."
        )
    }
}

struct VisibilityView: View {
    let value: String
    var body: some View {
        MetricView(
            title: "VISIBILITY",
            icon: "eye.fill",
            mainText: value,
            subtitle: "Similar to the actual temperature."
        )
    }
}

struct PressureView: View {
    let value: String
    var body: some View {
        MetricView(
            title: "PRESSURE",
            icon: "gauge",
            mainText: value
        )
    }
}

#if DEBUG
struct AirQualityView_Previews: PreviewProvider {
    static var previews: some View {
        AirPollutionView(value: "2", risk: "Low", aqiNumber: 2)
            .previewLayout(.sizeThatFits)
    }
}
#endif

#if DEBUG
struct SunEventsView_Previews: PreviewProvider {
    static var previews: some View {
        SunEventsView(sunrise: "6:45 AM", sunset: "5:55 PM")
            .previewLayout(.sizeThatFits)
    }
}
#endif

#if DEBUG
struct WindView_Previews: PreviewProvider {
    static var previews: some View {
        WindView(value: "15 km/h")
            .previewLayout(.sizeThatFits)
    }
}
#endif

#if DEBUG
struct RainfallView_Previews: PreviewProvider {
    static var previews: some View {
        RainfallView(value: "5 mm")
            .previewLayout(.sizeThatFits)
    }
}
#endif

#if DEBUG
struct SnowView_Previews: PreviewProvider {
    static var previews: some View {
        SnowView(value: "3 mm")
            .previewLayout(.sizeThatFits)
    }
}
#endif

#if DEBUG
struct FeelsLikeView_Previews: PreviewProvider {
    static var previews: some View {
        FeelsLikeView(value: "28º")
            .previewLayout(.sizeThatFits)
    }
}
#endif

#if DEBUG
struct HumidityView_Previews: PreviewProvider {
    static var previews: some View {
        HumidityView(value: "75 %")
            .previewLayout(.sizeThatFits)
    }
}
#endif

#if DEBUG
struct VisibilityView_Previews: PreviewProvider {
    static var previews: some View {
        VisibilityView(value: "10 km")
            .previewLayout(.sizeThatFits)
    }
}
#endif

#if DEBUG
struct PressureView_Previews: PreviewProvider {
    static var previews: some View {
        PressureView(value: "1015 hPa")
            .previewLayout(.sizeThatFits)
    }
}
#endif

