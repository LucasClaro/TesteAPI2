//
//  DeleteWebService.swift
//  testeApi2
//
//  Created by Lucas Claro on 30/07/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import Foundation

class DeleteWebService {
    func deleteId(index: Int, completion: @escaping ([Personagem]?) -> ()) {
        guard let url = URL(string: "https://teste-swift-online-db.herokuapp.com/users/\(index)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, resp, err in
            print("entrei")
            
            if err != nil {
                DispatchQueue.main.async {
                    print(err!)
                    completion(nil)
                }
                return
            }
            
            let posts = try? JSONDecoder().decode([Personagem].self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        
    }
}
