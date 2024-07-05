//
//  ScrollPositionView.swift
//  SwiftUIStudyFour
//  scrollTarget 也是需要iOS17
//  Created by andy on 2024/7/5.
//

import SwiftUI

struct ScrollPositionView: View {
    let bgColors: [Color] = [ .yellow, .blue, .orange, .indigo, .green ]
    
    @State private var scrollID: Int?
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(0...50, id: \.self) { index in
                    
                    bgColors[index % 5]
                        .frame(height: 100)
                        .overlay {
                            Text("\(index)")
                                .foregroundStyle(.white)
                                .font(.system(.title, weight: .bold))
                        }
                        .onTapGesture {
                            withAnimation {
                                scrollID = 0
                            }
                        }
                        
                }
            }
          //  .scrollTargetLayout()

        }
        //.contentMargins(50.0, for: .scrollContent)
       // .scrollPosition(id: $scrollID)
//        .onChange(of: scrollID) { oldValue, newValue in
//            print(newValue ?? "")
//        }
        
    }
}

struct ScrollPositionView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollPositionView()
    }
}
