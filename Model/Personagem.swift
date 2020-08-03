//
//  Personagem.swift
//  testeApi2
//
//  Created by Lucas Claro on 30/07/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import Foundation

struct Personagem: Codable, Hashable, Identifiable {
    let id: Int
    let firstName: String
    let lastName: String
}
