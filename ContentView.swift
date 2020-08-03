//
//  ContentView.swift
//  testeApi2
//
//  Created by Lucas Claro on 30/07/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var personagensViewModel = PersonagemListViewModel()
    
    @State private var editMode: EditMode = .inactive
    @State private var newName = ""
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                addRow()
                
                ForEach (personagensViewModel.personagens, id: \.id) { personagem in
                    
                    EditableText((personagem.firstName), isEditing: self.editMode.isEditing) { name in
                        self.personagensViewModel.upadate(personagem: personagem, name: name)
                    }
                    
                }
                    .onDelete { index in
                        self.personagensViewModel.delete(index: index.first!)
                    }
                    
            }
                .navigationBarTitle("Personagens")
                .navigationBarItems(trailing: EditButton())
                .environment(\.editMode, $editMode)
            
        }
        
    }
    
    func addRow() -> some View {
            HStack{
                TextField("Novo Personagem", text: $newName)
                Button(action: {
                    if !self.newName.isEmpty {
                        self.personagensViewModel.insert(name: self.newName)
                        self.newName = ""
                    }
                }){
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.blue)
                        .imageScale(.large)
                }
            }
        
    }

}
