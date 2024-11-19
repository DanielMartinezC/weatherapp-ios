//
//  ThemesView.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 15/11/24.
//


import SwiftUI

struct ThemesView: View {
    
    @EnvironmentObject var appDelegate: AppDelegate
    @EnvironmentObject var themeProvider: ThemeProvider
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedTheme: any Theme
    
    init() {
        let theme = ThemeProvider.shared.theme
        self._selectedTheme = State(initialValue: theme)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                themeProvider.theme.colorTheme.background1
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(WeatherThemes.allCases, id: \.self) { theme in
                        Button {
                            appDelegate.appConfiguration.changeTheme(theme.theme)
                            dismiss()
                        } label: {
                            themeItem(theme)
                        }
                    }
                    
                    Text("App Icon")
                        .subtitleStyle()
                        .padding(.bottom, 16)
                    
                    Text("Select preferred Icon")
                        .bodyStyle()
                    
                    VStack(spacing: 10) {
                        ForEach(WeatherIcons.getSchemeIcons(), id: \.self) { icon in
                            
                            Button {
                                appDelegate.appConfiguration.changeAppIcon(icon)
                            } label: {
                                Text(icon)
                            }
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Themes")
        }
    }
}

// MARK: - Helpers

private extension ThemesView {
    
    func themeItem(_ theme: WeatherThemes) -> some View {
        VStack(spacing: 16) {
            HStack {
                Text("Use \(theme.name) theme")
                    .bodyStyle()
                Spacer()
                themeProvider.theme.iconTheme.chevronRight
                    .foregroundColor(themeProvider.theme.colorTheme.label)
            }
            
            Divider()
        }
        .padding(.bottom, 8)
    }
    
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemesView()
            .environmentObject(ThemeProvider.shared)
    }
}
