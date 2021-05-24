//
//  CenterModifier.swift
//  Africa
//
//  Created by Thiago on 24/05/21.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
