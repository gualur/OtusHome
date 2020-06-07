//
//  UnitsViewModel.swift
//  OtusHome
//
//  Created by Михаил Аникин on 07.06.2020.
//  Copyright © 2020 Михаил Аникин. All rights reserved.
//

import Combine
import SwiftUI

class UnitsViewModel: ObservableObject {
    
    @Published var units = [Unit]()
    
    var cancellable : Set<AnyCancellable> = Set()
    private let unitsUrl: String = "https://age-of-empires-2-api.herokuapp.com/api/v1/units"
    
    func load() {
        guard let url = URL(string: unitsUrl) else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { output in
                return output.data
        }
        .decode(type: UnitsResponse.self, decoder: JSONDecoder())
        .replaceError(with: UnitsResponse(units: []))
        .eraseToAnyPublisher()
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { completion in
            
            switch completion {
            case .finished:
                print("completed")
                break
            case .failure(let error):
                print(error.localizedDescription)
            }
        }) { items in
            self.units.append(contentsOf: items.units)
        }
        .store(in: &cancellable)
    }
}


struct Unit : Identifiable, Codable{
    var id = UUID()
    
    public var name: String
    public var description: String
    
    private enum CodingKeys: String, CodingKey {
        case name, description
    }
}

struct UnitsResponse: Codable {
    var units: [Unit]
}
