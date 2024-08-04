//
//  ContentTranslationView.swift
//
//
//  Created by Mohamed Afifi on 2023-12-29.
//

import NoorUI
import QuranKit
import QuranText
import SwiftUI
import UIx
import Utilities

public struct ContentTranslationView: View {
    @ObservedObject var viewModel: ContentTranslationViewModel

    public init(viewModel: ContentTranslationViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        ContentTranslationViewBody(
            items: viewModel.items,
            arabicFontSize: viewModel.arabicFontSize,
            translationFontSize: viewModel.translationFontSize,
            highlights: viewModel.highlights,
            scrollToItem: viewModel.scrollToItem,
            tracker: viewModel.tracker,
            footnote: $viewModel.footnote,
            openURL: { viewModel.openURL($0) }
        )
        .task(id: Pair(viewModel.verses, viewModel.selectedTranslations)) {
            await viewModel.load()
        }
    }
}

private struct ContentTranslationViewBody: View {
    let items: [TranslationItem]

    let arabicFontSize: FontSize
    let translationFontSize: FontSize
    let highlights: [AyahNumber: Color]
    let scrollToItem: TranslationItemId?
    let tracker: CollectionTracker<TranslationItemId>

    @Binding var footnote: TranslationFootnote?

    let openURL: (TranslationURL) -> Void

    var body: some View {
        List {
            ForEach(items) { item in
                item
            }
        }
        .listStyle(.plain)
        .environment(\.defaultMinListRowHeight, 1)
        .populateReadableInsets()
        .openTranslationURL(openURL)
        .trackCollection(with: tracker)
        .sheet(item: $footnote) { $0 }
        .quranScrolling(scrollToValue: scrollToItem)
    }
}
