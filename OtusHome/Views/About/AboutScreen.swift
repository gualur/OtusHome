//
//  AboutScreen.swift
//  OtusHome
//
//  Created by Михаил Аникин on 07.06.2020.
//  Copyright © 2020 Михаил Аникин. All rights reserved.
//

import SwiftUI

struct AboutScreen: View {
    @State var showModal: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Show Modal Screen").onTapGesture {
                    self.showModal.toggle()
                }
            } // VStack
                .sheet(isPresented: $showModal,
                       onDismiss: { print("Dismiss") }) {
                        ModalScreen()
            }
        }
    }
}
