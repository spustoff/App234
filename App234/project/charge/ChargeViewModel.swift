//
//  ChargeViewModel.swift
//  App234
//
//  Created by Вячеслав on 10/25/23.
//

import SwiftUI
import Alamofire

final class ChargeViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    
    @AppStorage("viewed_videos") var viewed_videos: Int = 0
    
    @Published var lessons: [ChargeItem] = []
    
    @Published var selectedLesson: ChargeItem = ChargeItem(id: 1, categoryId: 1, title: "", image: "", video: "", duration: 1)
    @Published var isDetail: Bool = false
    
    func getVideos() {
        
        isLoading = true
        
        self.fetchVideos() { result in
            
            switch result {
                
            case .success(let success):
                
                self.lessons = success.rows
                
            case .failure(let failure):
                
                debugPrint("Parse error - \(failure)")
                
                self.isLoading = false
            }
        }
    }
    
    func fetchVideos(completion: @escaping (Result<ChargeModel, Error>) -> Void ) {
        
        isLoading = true
        
        let params: Parameters = [
            
            "token": "b57302c2-3bc3-4a4f-af5f-d040a44afb4b",
        ]
        
        let request = AF.request("https://otupoter.space/api/v2/video", method: .get, parameters: params)
        
        request.responseDecodable(of: ChargeModel.self) { response in
            
            guard let value = response.value else {
                
                self.isLoading = false
                return
            }
                           
            switch response.result{
                
            case .success(_):
                
                completion(.success(value))
                self.isLoading = false
                
            case .failure(_):
                
                completion(.failure(response.error.debugDescription as! Error))
                self.isLoading = false
            }
        }
    }
}
