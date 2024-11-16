//
//  DesignSystemShowRoom.swift
//  Weather
//
//  Created by Daniel Martinez Condinanza on 15/11/24.
//

import SwiftUI

struct DesignSystemShowRoomView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    DefaultIconsShowRoomView()
                } label: {
                    Text("Icons")
                }
                
            }
            .navigationBarTitle("Design System")
        }
    }
}

struct DesignSystemShowRoomView_Previews: PreviewProvider {
    static var previews: some View {
        DesignSystemShowRoomView()
    }
}
