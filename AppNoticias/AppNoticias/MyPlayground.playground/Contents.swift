import UIKit
import Alamofire


var str = "Hello, playground"

func mostraPaNois() {
    Alamofire.request("https://newsapi.org/v2/everything?q=tecnologia&apiKey=0702c1c18b3c44d59015bb8bb90aae4f", method: .get).responseJSON { (response) in
        print(response)
        guard let dadosResposta = response.data else { return }
        print("-----------------------------------------------")
        print(dadosResposta)
    }
}
mostraPaNois()
