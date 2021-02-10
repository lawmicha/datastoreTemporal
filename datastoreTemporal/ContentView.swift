//
//  ContentView.swift
//  datastoreTemporal
//
//  Created by Law, Michael on 2/10/21.
//

import SwiftUI
import Amplify

struct ContentView: View {
    func save() {
        let todo = Todo(dateTime: .now(), date: .now(), time: .now())
        Amplify.DataStore.save(todo) { (result) in
            switch result {
            case .success(let todo):
                print(todo)
            case .failure(let error):
                print("\(error)")
            }
        }
    }
    func queryDirectlyFromAPI() {
        let id = "CEF737F1-3437-4E24-A84A-8A9506BC18B5"
        
        Amplify.API.query(request: .query(modelName: Todo.modelName, byId: id)) { result in
            switch result {
            case .success(let graphQLResponse):
                switch graphQLResponse {
                case .success(let mutationSync):
                    if let mutationSync = mutationSync {
                        print(mutationSync)
                    }
                    
                case .failure(let error):
                    print("\(error)")
                }
            case .failure(let error):
                print("\(error)")
            }
        }
    }
    var body: some View {
        VStack {
            Button("Save", action: {
                save()
            })
            Button("Query", action: {
                queryDirectlyFromAPI()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
