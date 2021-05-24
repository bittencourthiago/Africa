//
//  HeadingView.swift
//  Africa
//
//  Created by Thiago on 24/05/21.
//

import SwiftUI

struct HeadingView: View {
    //MARK: - Properties
    
    var headingimage: String
    var headingText: String
    
    //MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: headingimage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }//: HStack
        .padding(.vertical)
    }
}
//MARK: - Preview
struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingimage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
