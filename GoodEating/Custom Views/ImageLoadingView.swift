//
//  ImageLoadingView.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 10/17/22.
//

import SwiftUI

struct ImageLoadingView: View {
    @StateObject private var viewModel: ViewModel
    
    init(url: String?) {
        self._viewModel = StateObject(wrappedValue: ViewModel(url: url))
    }
    
    var body: some View {
        Group {
            if viewModel.image != nil {
                Image(uiImage: viewModel.image!)
                    .resizable()
                    .scaledToFill()
            } else if viewModel.errorMessage != nil {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .padding()
            } else {
                ProgressView()
            }
        }
        .onAppear {
            viewModel.fetch()
        }
    }
}

struct ImageLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ImageLoadingView(url: nil)
    }
}

extension ImageLoadingView {
    private class ViewModel: ObservableObject {
        let url: String?
        
        @Published var image: UIImage? = nil
        @Published var errorMessage: String? = nil
        @Published var isLoading: Bool = false
        
        init(url: String?) {
            self.url = url
        }
        
        func fetch() {
            guard image == nil && isLoading == false else { return }
                    
            guard let url = url, let fetchURL = URL(string: url) else {
                errorMessage = "Bad URL"
                return
            }
            
            isLoading = true
            errorMessage = nil
            
            let request = URLRequest(url: fetchURL, cachePolicy: .returnCacheDataElseLoad)
            
            let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
                DispatchQueue.main.async {
                    guard let self = self else { return }
                    
                    self.isLoading = false
                    
                    if let error = error {
                        self.errorMessage = error.localizedDescription
                    } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                        self.errorMessage = "Response error code: \(response.statusCode)"
                    } else if let data = data, let image = UIImage(data: data) {
                        self.image = image
                    } else {
                        self.errorMessage = "Unknown Error"
                    }
                }
            }
            
            task.resume()
        }
    }
}


