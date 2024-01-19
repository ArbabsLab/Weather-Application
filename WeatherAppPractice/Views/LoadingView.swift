//
//  LoadingView.swift
//  WeatherAppPractice
//
//  Created by Arbab Husain on 6/10/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .pink))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.indigo)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
