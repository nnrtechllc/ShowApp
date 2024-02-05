//
//  Firebasecheck.swift
//  ShowApp
//
//  Created by Nikhil Vaddey on 1/18/24.
//

import SwiftUI
import Firebase

struct ContentView1: View {
    @State private var userInput: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter text", text: $userInput)
                .padding()
            
            Button("Save to Firestore") {
                saveToFirestore()
            }
            .padding()
        }
        .padding()
    }
    
    private func saveToFirestore() {
        let db = Firestore.firestore()
        
        // Assuming you have a "messages" collection in Firestore
        db.collection("messages").addDocument(data: ["text": userInput]) { error in
            if let error = error {
                print("Error saving to Firestore: \(error.localizedDescription)")
            } else {
                print("Data saved to Firestore successfully!")
            }
        }
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}
