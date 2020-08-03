//
//  WebService.swift
//  testeApi2
//
//  Created by Lucas Claro on 30/07/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import Foundation

class Webservice {
        
    func getAll(completion: @escaping ([Personagem]?) -> ()) {
        
        guard let url = URL(string: "https://teste-swift-online-db.herokuapp.com/users") else { return }
        
        URLSession.shared.dataTask(with: url) { data, resp, err in
            
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
            
        }.resume()
        
    }
    
    func deleteId(index: Int, completion: @escaping () -> ()) {
        
        guard let url = URL(string: "https://teste-swift-online-db.herokuapp.com/users/\(index)") else { return }
        var urlReq = URLRequest(url: url)
        urlReq.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: urlReq) { data, resp, err in
            
            if err != nil {
                DispatchQueue.main.async {
                    print(err!)
                }
                return
            }
            
            DispatchQueue.main.async {
                completion()
                //print(resp!)
            }
        }.resume()
        
    }
    
    
    func Insert(personagem : Personagem, completion: @escaping () -> ()) {
        
        guard let url = URL(string: "https://teste-swift-online-db.herokuapp.com/users") else { return }
        var urlReq = URLRequest(url: url)
        urlReq.httpMethod = "POST"
        urlReq.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlReq.httpBody = try! JSONEncoder().encode(personagem)
        
        URLSession.shared.dataTask(with: urlReq) { data, resp, err in
            
            if err != nil {
                DispatchQueue.main.async {
                    print(err!)
                }
                return
            }
            
            DispatchQueue.main.async {
                //print(resp!)
                //print(String(data: data!, encoding: .utf8))
                completion()
            }
        }.resume()
    }
    
    func Update(personagem : Personagem, completion: @escaping () -> ()) {
        
        guard let url = URL(string: "https://teste-swift-online-db.herokuapp.com/users") else { return }
        var urlReq = URLRequest(url: url)
        urlReq.httpMethod = "PUT"
        urlReq.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlReq.httpBody = try! JSONEncoder().encode(personagem)
        
        URLSession.shared.dataTask(with: urlReq) { data, resp, err in
            
            if err != nil {
                DispatchQueue.main.async {
                    print(err!)
                }
                return
            }
            
            DispatchQueue.main.async {
                //print(resp!)
                //print(String(data: data!, encoding: .utf8))
                completion()
            }
        }.resume()
    }
    
}
