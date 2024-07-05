//
//  GridView.swift
//  SwiftUIStudyFour
//
//  Created by andy on 2024/7/5.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        Grid {
            GridRow {
                Image(systemName: "trash")
                    .font(.system(size: 100))
                Image(systemName: "trash")
                    .font(.system(size: 50))
            }
            
            GridRow {
                Color.purple
                    .overlay {
                        Image(systemName: "magazine.fill")
                            .font(.system(size: 100))
                            .foregroundColor(.white)
                    }
                    .gridCellColumns(2)
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
        MergedGridView()
    }
}

struct  MergedGridView: View {
    var body: some View {
        Grid(alignment: .bottom, horizontalSpacing: 0, verticalSpacing: 0) {
            GridRow {
                IconView(name: "cloud")
                IconView(name: "cloud")
                IconView(name: "cloud")
            }
            
            GridRow {
                IconView(name: "cloud")
                Color.black
                    .frame(width: 33, height: 33)
                    .gridCellAnchor(.topLeading)
                IconView(name: "cloud")
            }
            
            GridRow {
                IconView(name: "cloud")
                IconView(name: "cloud")
                IconView(name: "cloud")
            }
        }
    }
}

struct IconView: View {
    var name: String = "trash"
    
    var body: some View {
        Image(systemName: name)
            .frame(width: 100, height: 100)
            .background(in: Rectangle())
            .backgroundStyle(.purple)
            .foregroundStyle(.white.shadow(.drop(radius: 1, y: 3.0)))
            .font(.system(size: 50))
    }
}
