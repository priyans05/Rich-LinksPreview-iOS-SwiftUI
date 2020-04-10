//
//  LinkCell.swift
//  LinksPreview
//
//  Created by PRIYANS on 11/4/20.
//  Copyright © 2020 PRIYANS. All rights reserved.
//

import SwiftUI
import LinkPresentation

struct LinkCell: UIViewRepresentable {

    var url: URL

    func makeUIView(context: Context) -> LPLinkView {

        let linkView = LPLinkView(url: url)
        let dataProvider = LPMetadataProvider()

        dataProvider.startFetchingMetadata(for: url) { (metaData, error) in
            if let metaData = metaData {
                DispatchQueue.main.async {
                    linkView.metadata = metaData
                    linkView.sizeToFit()
                }
            }
        }

        return linkView

    }

    func updateUIView(_ uiView: LPLinkView, context: Context) {}


}

struct LinkCell_Previews: PreviewProvider {
    static var previews: some View {
        LinkCell(url: URL(string: "https://www.youtube.com/watch?v=tipcM1xPP-k")!)
    }
}
