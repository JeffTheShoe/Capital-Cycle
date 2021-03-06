//
//  CustomTextField.swift
//  Capital Cycle Swift UI
//
//  Created by Caden Kowalski on 8/10/20.
//

import SwiftUI

// MARK: CustomTextField View

struct PlaceholderStyle: ViewModifier {
    
    var showPlaceHolder: Bool
    var placeholder: String

    func body(content: Content) -> some View {
        
        ZStack(alignment: .leading) {
            
            if showPlaceHolder {
                
                Text(placeholder)
            }
            
            content
                .foregroundColor(Color("Label"))
        }
    }
}

struct CustomTextField: View {
    
    var placeholderString: String
    var isSecure: Bool?
    @Binding var text: String

    // MARK: View Construction
    
    
    
    var body: some View {

        if isSecure == true {
            
            SecureField("", text: $text).modifier(PlaceholderStyle(showPlaceHolder: text.isEmpty, placeholder: placeholderString))
                .padding(.all, 10)
                .font(Font.custom("Avenir-Book", size: 15))
                .background(Color("TextField"))
                .accentColor(Color("Label"))
                .foregroundColor(Color("Label"))
        } else {
            
            TextField("", text: $text)
                .modifier(PlaceholderStyle(showPlaceHolder: text.isEmpty, placeholder: placeholderString))
                .padding(.all, 10)
                .font(Font.custom("Avenir-Book", size: 15))
                .background(Color("TextField"))
                .accentColor(Color("Label"))
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
                .foregroundColor(Color("Label"))
        }
    }
}

