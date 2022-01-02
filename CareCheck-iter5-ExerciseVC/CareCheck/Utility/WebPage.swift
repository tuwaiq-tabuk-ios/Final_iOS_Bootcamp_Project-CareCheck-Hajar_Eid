

import UIKit

struct WebPage {
    
    var title: String
    var url: String
    var image: String
//    var section: String
    
//    init (title: String, url: String, image: UIImage) {
//        self.title = title
//        self.url = url
//        self.image = image
////        self.section = section
//    }
    
    
//    convenience init(copies webPage: WebPage){
//        self.init(title: webPage.title,
//                  url: webPage.url,
//                  image: webPage.image)
//    }
    
    static func fetchWebPages() -> [WebPage] {
        let wP1 = WebPage(title: "Jigsaw Puzzle",
                         url: "https://www.jigsawexplorer.com/online-jigsaw-puzzle-player.html?puzzle_id=tre-cime-di-lavaredo",
                         image: "v1")
        let wP2 = WebPage(title: "Picture Match",
                          url: "https://www.tinytap.com/activities/g3of1/play/matching-pic-to-word",
                          image: "v2")
        let wP3 = WebPage(title: "Solitaire",
                          url: "https://solitaired.com",
                          image: "v3")
        let wP4 = WebPage(title: "Diominos",
                          url: "http://www.onlinedominogames.com/draw-dominoes",
                          image: "v4")
        let wP5 = WebPage(title: "Jigsaw Puzzle",
                         url: "https://www.jigsawexplorer.com/online-jigsaw-puzzle-player.html?puzzle_id=tre-cime-di-lavaredo",
                         image: "v1")
        let wP6 = WebPage(title: "Picture Match",
                          url: "https://www.tinytap.com/activities/g3of1/play/matching-pic-to-word",
                          image: "v2")
        let wP7 = WebPage(title: "Solitaire",
                          url: "https://solitaired.com",
                          image: "v3")
        let wP8 = WebPage(title: "Diominos",
                          url: "http://www.onlinedominogames.com/draw-dominoes",
                          image: "v4")
        let wP9 = WebPage(title: "Jigsaw Puzzle",
                         url: "https://www.jigsawexplorer.com/online-jigsaw-puzzle-player.html?puzzle_id=tre-cime-di-lavaredo",
                         image: "v1")
        let wP10 = WebPage(title: "Picture Match",
                          url: "https://www.tinytap.com/activities/g3of1/play/matching-pic-to-word",
                          image: "v2")
        let wP11 = WebPage(title: "Solitaire",
                          url: "https://solitaired.com",
                          image: "v3")
        let wP12 = WebPage(title: "Diominos",
                          url: "http://www.onlinedominogames.com/draw-dominoes",
                          image: "v4")
//        let wP5 = WebPage(title: "",
//                          url: "",
//                          image: <#T##UIImage#>)
//        let wP6 = WebPage(title: "",
//                          url: "",
//                          image: <#T##UIImage#>)
//        let wP7 = WebPage(title: "",
//                          url: "",
//                          image: <#T##UIImage#>)
//        let wP8 = WebPage(title: "",
//                          url: "",
//                          image: <#T##UIImage#>)
//        let wP9 = WebPage(title: "",
//                          url: "",
//                          image: <#T##UIImage#>)
//        let wP10 = WebPage(title: "",
//                          url: "",
//                          image: <#T##UIImage#>)
        
        return [wP1, wP2, wP3, wP4, wP5, wP6, wP7, wP8, wP9, wP10, wP11, wP12 ]
    }
}
