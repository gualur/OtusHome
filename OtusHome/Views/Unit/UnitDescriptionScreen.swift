//
//  ListScreenView.swift
//  OtusHome
//
//  Created by Михаил Аникин on 07.06.2020.
//  Copyright © 2020 Михаил Аникин. All rights reserved.
//

import SwiftUI

struct UnitDescriptionScreen: View {

    var description: String = ""
    
    var body: some View {
        VStack {
            Text(description).font(.largeTitle).foregroundColor(.gray).multilineTextAlignment(.center)
            Spacer()
        }
    }
}
