//
//  GamePlay.swift
//  PotterTrivia
//
//  Created by Andersson on 19/04/25.
//

import SwiftUI

struct GamePlay: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("hogwarts")
                    .resizable()
                    .frame(width: geometry.size.width * 3, height: geometry.size.height * 1.05)
                    .overlay(Rectangle().foregroundStyle(.black).opacity(0.8))
                VStack {
                    HStack {
                        Button("End Game") {
                            //TODO: Add end game function
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red.opacity(0.5))
                        Spacer()
                        Text("Score: 33")
                    }
                    .padding()
                    .padding(.vertical, 50)
                    Text("Who is Harry Potter?")
                        .font(.custom(Constants.potterFont, size: 50))
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                    HStack {
                        Image(systemName: "questionmark.app.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .foregroundStyle(.cyan)
                            .rotationEffect(.degrees(-15))
                            .padding()
                            .padding(.leading, 20)
                        Spacer()
                        Image(systemName: "book.closed")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .foregroundStyle(.black)
                            .frame(width: 100, height: 100)
                            .background(.cyan)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .rotationEffect(.degrees(15))
                            .padding()
                            .padding(.trailing, 20)
                    }
                    .padding(.bottom)
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(1..<5) { i in
                            Text("Answer \(i)")
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .padding(10)
                                .frame(width: geometry.size.width / 2.15, height: 80)
                                .background(.green.opacity(0.5))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    Spacer()
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .foregroundStyle(.white)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    GamePlay()
}
