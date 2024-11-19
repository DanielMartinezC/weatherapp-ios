//
//  StatusView.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 18/11/24.
//

import SwiftUI

public struct StatusView: View {
    
    public enum ViewStatus: Equatable {
        case loading
        case error
    }
    
    // MARK: - Properties
    
    @EnvironmentObject private var themeProvider: ThemeProvider
    
    let status: ViewStatus
    let title: String?
    let message: String?
    let image: Image?
    let fullScreen: Bool
    let primaryActionTitle: String?
    let secondaryActionTitle: String?
    let primaryAction: () -> Void
    let secondaryAction: () -> Void
    
    public init(
        status: ViewStatus = .loading,
        title: String? = nil,
        message: String? = nil,
        image: Image? = nil,
        fullScreen: Bool = false,
        primaryActionTitle: String? = nil,
        secondaryActionTitle: String? = nil,
        primaryAction: @escaping () -> Void = {},
        secondaryAction: @escaping () -> Void = {}
    ) {
        self.status = status
        self.title = title
        self.message = message
        self.image = image
        self.fullScreen = fullScreen
        self.primaryActionTitle = primaryActionTitle
        self.secondaryActionTitle = secondaryActionTitle
        self.primaryAction = primaryAction
        self.secondaryAction = secondaryAction
    }
    
    // MARK: - Body
    
    public var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            if status == .loading {
                ProgressView()
                    .tint(themeProvider.theme.colorTheme.title)
            } else {
                getStatusImage()
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 65, height: 65)
            }
            
            if getStatusTitle() != .empty {
                Text(getStatusTitle())
                    .titleStyle()
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            if getStatusMessage() != .empty {
                Text(getStatusMessage())
                    .labelStyle()
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            if fullScreen {
                Spacer()
            }
                
            VStack(spacing: 18) {
                if let primaryActionTitle = primaryActionTitle {
                    Button(primaryActionTitle) {
                        primaryAction()
                    }
                    .buttonStyle(FilledButtonStyle())
                }
                
                if let secondaryActionTitle = secondaryActionTitle {
                    Button(secondaryActionTitle) {
                        secondaryAction()
                    }
                    .buttonStyle(BorderButtonStyle())
                }
            }
            .padding(.bottom)
            
            if !fullScreen {
                Spacer()
            }
        }
    }
}

// MARK: - Helpers

private extension StatusView {
    func getStatusTitle() -> String {
        if let title = title {
            return title
        }
        
        switch status {
        case .error:
            return String.statusViewErrorTitle
            
        default:
            return String.empty
        }
    }
    
    func getStatusMessage() -> String {
        if let message = message {
            return message
        }
        
        switch status {
        case .loading:
            return String.statusViewLoadingMessage
            
        case .error:
            return String.statusViewErrorMessage
            
        }
    }
    
    func getStatusImage() -> Image {
        if let image = image {
            return image
        }
        switch status {
        case .error:
            return themeProvider.theme.iconTheme.rain
            
        default:
            return themeProvider.theme.iconTheme.rain
        }
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView(fullScreen: true, primaryActionTitle: "Back to home", secondaryActionTitle: "Back")
            .environmentObject(ThemeProvider.shared)
    }
}

