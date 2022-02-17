//
//  EditProfileViewModel.swift
//  InstagramClone
//
//  Created by mac on 21.11.2021.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    var user: User
    @Published var uploadComplete = false
    
    init(user:User){
        self.user = user
    }
    
    func saveUserData(_ bio: String ){
        guard let uid = user.id else { return }
        
        COLLECTION_USERS.document(uid).updateData(["bio" : bio]) { _ in
            self.user.bio = bio
            self.uploadComplete = true
        }
    }
}
