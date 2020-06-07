//
//  UnitCell.swift
//  OtusHome
//
//  Created by Михаил Аникин on 07.06.2020.
//  Copyright © 2020 Михаил Аникин. All rights reserved.
//

import SwiftUI

struct UnitCell: View {
    var unit: Unit
    
    var body: some View {
        Text(unit.name).font(.title).foregroundColor(.black)
    }
}
