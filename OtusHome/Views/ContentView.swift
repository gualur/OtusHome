//
//  ContentView.swift
//  OtusHome
//
//  Created by Михаил Аникин on 07.06.2020.
//  Copyright © 2020 Михаил Аникин. All rights reserved.
//

import SwiftUI
import Combine

enum TabType: Int {
    case main, unitsList, about
}

struct ContentView: View {
    @State private var tabType: TabType = .main
    @ObservedObject var unitsViewModel = UnitsViewModel()
    
    var body: some View {
        Group {
            TabView(selection: $tabType) {
                MainScreen(tabType: $tabType).tabItem {
                    Text("Main")
                    Image(systemName: "person")
                    }.tag(TabType.main).environmentObject(unitsViewModel)
                
                UnitsListScreen().tabItem {
                    Text("List")
                    Image(systemName: "list.dash")
                }.tag(TabType.unitsList).environmentObject(unitsViewModel).onAppear {
                    self.unitsViewModel.load()
                }
                
                AboutScreen().tabItem {
                    Text("About")
                    Image(systemName: "bubble.left.fill")
                }.tag(TabType.about)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
