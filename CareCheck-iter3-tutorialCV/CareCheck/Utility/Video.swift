//
//  Video.swift
//  CareCheck
//
//  Created by HAJAR on 31/12/2021.
//

import Foundation


struct Video {
    let authorName: String
    let videoFileName: String
    let description: String
    let thumbnailFileName: String
    
    static func fetchVideos() -> [Video] {
        let v1 = Video(authorName: "Learn about Alzheimer's disease",
                       videoFileName: "v1",
                       description: "This is example of ved",
                       thumbnailFileName: "v1")
        
        let v2 = Video(authorName: "How to treat Alzheimer's patient",
                       videoFileName: "v2",
                       description: "This is example of ved",
                       thumbnailFileName: "v2")
        
        let v3 = Video(authorName: "How to decrese memory loss",
                       videoFileName: "v3",
                       description: "This is example of ved",
                       thumbnailFileName: "v3")
        
        let v4 = Video(authorName: "What to do if Alzheimer's patient get lost",
                       videoFileName: "v4",
                       description: "This is example of ved",
                       thumbnailFileName: "v4")
        
       
        
        return [v1, v2, v3, v4]
    }
}
