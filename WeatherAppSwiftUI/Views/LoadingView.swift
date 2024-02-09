//
//  LoadingView.swift
//  WeatherAppSwiftUI
//
//  Created by ReetDhillon on 2024-02-08.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        //Loader View
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}
