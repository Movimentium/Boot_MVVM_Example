//  ContentView.swift
//  Boot_MVVM_Example
//  Created by Miguel Gallego on 18/5/25.
import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ProductListVM(webService: WebService())
    
    var body: some View {
        List(vm.products) { product in
            Text(product.title)
        }
        .task {
            await vm.populateProducts()
        }
    }
}

#Preview {
    ContentView()
}
