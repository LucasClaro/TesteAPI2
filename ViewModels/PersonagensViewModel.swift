//
//  PersonagensViewModel.swift
//  testeApi2
//
//  Created by Lucas Claro on 30/07/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import Foundation
import Combine

final class PersonagemListViewModel: ObservableObject {
    
    init() {
        fetchPost()
    }
    
    @Published var personagens = [Personagem]()
    
    let webService = Webservice()
    
    private func fetchPost() {
        webService.getAll() {
            
            if $0 != nil {
                self.personagens = $0!
            }
        }
    }
    
    
    
    func delete (index: Int) {
        webService.deleteId(index: personagens[index].id) {
            self.fetchPost()
        }
    }
    
    func insert (name: String) {
        let p = Personagem(id: 0, firstName: name, lastName: " ")
        
        Webservice().Insert(personagem: p){
            self.fetchPost()
            print("Entrei")
        }
    }
    
    func upadate (personagem: Personagem, name: String) {
        
        let p = Personagem(id: personagem.id, firstName: name, lastName: personagem.lastName)
        
        Webservice().Update(personagem: p) {
            self.fetchPost()
        }
    }
    
}
