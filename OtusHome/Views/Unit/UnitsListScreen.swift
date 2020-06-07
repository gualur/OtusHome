//
//  ListScreen.swift
//  OtusHome
//
//  Created by Михаил Аникин on 07.06.2020.
//  Copyright © 2020 Михаил Аникин. All rights reserved.
//

import SwiftUI
import Combine

struct UnitsListScreen: View {
    @EnvironmentObject var viewModel: UnitsViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List() {
                    ForEach(viewModel.units, id: \.name) {  unit in
                        NavigationLink(destination: UnitDescriptionScreen(description: unit.description)) {
                            UnitCell(unit: unit)
                        }
                    }
                }//List
            }//VStack
            .navigationBarTitle("Age of Empires Units")
        }//NavigationView
    }
}

