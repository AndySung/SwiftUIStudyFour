//
//  ImageRendererPDFAppView.swift
//  SwiftUIStudyFour
//
//  Created by andy on 2024/7/5.
//

import SwiftUI
import Charts

struct ImageRendererPDFAppView: View {
    
    var chartView = ChartView()
    
    var body: some View {
        VStack(spacing: 20) {
            chartView
            
            HStack {
                Button {
                    let renderer = ImageRenderer(content: chartView)
                    
                    if let image = renderer.uiImage {
                        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                    }
                } label: {
                    Label("Save to Photos", systemImage: "photo")
                }
                .buttonStyle(.borderedProminent)
                
                ShareLink(item: Image(uiImage: generateSnapshot()), preview: SharePreview("Weather Chart", image: Image(uiImage: generateSnapshot())))
                .buttonStyle(.borderedProminent)
                
                Button {
                    exportPDF()
                } label: {
                    Label("PDF", systemImage: "doc.plaintext")
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
    
    @MainActor
    private func generateSnapshot() -> UIImage {
        let renderer = ImageRenderer(content: chartView)
        renderer.scale = UIScreen.main.scale
        
        return renderer.uiImage ?? UIImage()
    }
    
    @MainActor
    private func exportPDF() {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        let renderedUrl = documentDirectory.appending(path: "linechart.pdf")
        
        if let consumer = CGDataConsumer(url: renderedUrl as CFURL),
           let pdfContext = CGContext(consumer: consumer, mediaBox: nil, nil) {
            
            let renderer = ImageRenderer(content: chartView)
            renderer.render { size, renderer in
                let options: [CFString: Any] = [
                    kCGPDFContextMediaBox: CGRect(origin: .zero, size: size)
                ]
                
                pdfContext.beginPDFPage(options as CFDictionary)
                pdfContext.translateBy(x: 0, y: 200)
                
                renderer(pdfContext)
                pdfContext.endPDFPage()
                pdfContext.closePDF()
            }
        }
      
        print("Saving PDF to \(renderedUrl.path())")
    }
}

struct ImageRendererPDFAppView_Previews: PreviewProvider {
    static var previews: some View {
        ImageRendererPDFAppView()
    }
}
