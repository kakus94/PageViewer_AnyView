//
//  ContentView.swift
//  PageViewer
//
//  Created by Grzegorz Przybyła on 10/12/2019.
//  Copyright © 2019 Grzegorz Przybyła. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  let pages: [PageViewData] = [
    PageViewData(view: TestView(view: Image("image4").resizable())),
    PageViewData(view: TestView(view: Image("image4").resizable())),
    PageViewData(view: TestView(view: Image("image4").resizable())),
    PageViewData(view: TestView(view: Image("image4").resizable())),
    PageViewData(view: TestView(view: Image("image4").resizable())),
    PageViewData(view: TestView(view: Image("image4").resizable())),
    PageViewData(view: TestView(view: Image("image4").resizable())),
    PageViewData(view: TestView(view: Image("image4").resizable())),
    PageViewData(view: TestView(view: Image("image4").resizable())),
    PageViewData(view: TestView(view: Image("image4").resizable())),
    PageViewData(view: TestView(view: Image("image4").resizable())),
    PageViewData(view: TestView(view: Image("image4").resizable())),
    PageViewData(view: TestView(view: Image("image4").resizable())),
    PageViewData(view: TestView(view: Image("image4").resizable())),
    PageViewData(view: TestView(view: Image("image4").resizable())),
    PageViewData(view: TestView(view: Image("image4").resizable())),
    PageViewData(view: TestView(view: Image("image4").resizable())),
    PageViewData(view: TestView(view: Image("image4").resizable()))
  ]
  
    @State private var index: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            SwiperView(pages: self.pages, index: self.$index)
            HStack(spacing: 8) {
                ForEach(0..<self.pages.count) { index in
                    CircleButton(isSelected: Binding<Bool>(get: { self.index == index }, set: { _ in })) {
                        withAnimation {
                            self.index = index
                        }
                    }
                }
            }
            .padding(.bottom, 12)
        }
    }
}


fileprivate struct TestView: View {
  
  var view: any View
  @State var x: CGFloat?
  
  var body: some View {
    AnyView(view)
      .gesture(
        SequenceGesture(
          LongPressGesture(),
          DragGesture()
            .onChanged({ value in
              print(value.location)
              self.x = value.location.x
            })
            .onEnded({ value in
              self.x = nil
            })
        )
      )
      .overlay {
        if let x {
          Rectangle()
            .frame(width: 2)
            .frame(maxHeight: .infinity)
            .position(x: x, y: UIScreen.main.bounds.height / 2 )
        }
      }
  }
}
