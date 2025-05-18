//  ProductListVM.swift
//  Boot_MVVM_Example
//  Created by Miguel Gallego on 18/5/25.
import Foundation

@MainActor
class ProductListVM: ObservableObject {
    @Published var products: [ProductVM] = []
    let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func populateProducts() async {
        do {
            let products = try await webService.getProducts()
            self.products = products.map(ProductVM.init)
        } catch {
            print(error)
        }
    }
    
}

struct ProductVM: Identifiable {    // No me gusta este enfoque. Mejor:
    private let product: Product    // ProductDTO en lugar de Product
                                    // Product    en lugar de ProductVM
    init(product: Product) {
        self.product = product
    }
    
    var id: Int {
        product.id
    }
    
    var title: String {
        product.title
    }
    
    var price: Double {
        product.price
    }
}
