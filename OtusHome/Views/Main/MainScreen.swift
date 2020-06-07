//
//  MainScreen.swift
//  OtusHome
//
//  Created by Михаил Аникин on 07.06.2020.
//  Copyright © 2020 Михаил Аникин. All rights reserved.
//

import SwiftUI

struct MainScreen: View {
    @Binding var tabType: TabType
    
    var body: some View {
        Text("Go to second screen").onTapGesture {
            self.tabType = .unitsList
        }
    }
}
