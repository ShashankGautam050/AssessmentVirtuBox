//
//  Tasks.swift
//  AssessmentVirtuBox
//
//  Created by Shashank Gautam on 22/01/26.
//

import Foundation

struct Tasks : Identifiable,Codable,Equatable{
    var id = UUID().uuidString
    var title : String
    
    init(id : UUID = UUID() ,title: String) {
        self.title = title
    }
    
}
