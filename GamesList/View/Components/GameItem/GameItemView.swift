//
//  GameItemView.swift
//  GamesList
//
//  Created by Admin on 28.03.2024.
//

import Foundation
import SwiftUI

protocol GameItemView: View {
    init(game: Binding<Game>)
}
