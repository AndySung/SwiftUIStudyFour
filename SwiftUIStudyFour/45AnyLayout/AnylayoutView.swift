//
//  AnylayoutView.swift
//  SwiftUIStudyFour
//
//  Created by andy on 2024/7/5.
//

import SwiftUI

struct AnylayoutView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State private var changeLayout = false
    
    var body: some View {
        let layout = horizontalSizeClass == .regular ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
        
        layout {
            Image(systemName: "bus")
                .font(.system(size: 80))
                .frame(width: 120, height: 120)
                .background(in: RoundedRectangle(cornerRadius: 5.0))
                .backgroundStyle(.green)
                .foregroundStyle(.white)
                
                
            Image(systemName: "ferry")
                .font(.system(size: 80))
                .frame(width: 120, height: 120)
                .background(in: RoundedRectangle(cornerRadius: 5.0))
                .backgroundStyle(.yellow)
                .foregroundStyle(.white)
            
            Image(systemName: "scooter")
                .font(.system(size: 80))
                .frame(width: 120, height: 120)
                .background(in: RoundedRectangle(cornerRadius: 5.0))
                .backgroundStyle(.indigo)
                .foregroundStyle(.white)
            
        }
        .animation(.default, value: changeLayout)
        .onTapGesture {
            changeLayout.toggle()
        }
    }
}

struct AnylayoutView_Previews: PreviewProvider {
    static var previews: some View {
        AnylayoutView()
    }
}
