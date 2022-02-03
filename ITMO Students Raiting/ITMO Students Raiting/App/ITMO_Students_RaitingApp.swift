//
//  ITMO_Students_RaitingApp.swift
//  ITMO Students Raiting
//
//  Created by Илья Чуб on 03.02.2022.
//

import SwiftUI

@main
struct ITMO_Students_RaitingApp: App {
    var body: some Scene {
        WindowGroup {
            YearChoosingView(viewModel: YearChoosingViewModel())
        }
    }
}
