//
//  GamePlay.swift
//  PotterTrivia
//
//  Created by Andersson on 19/04/25.
//

import SwiftUI

struct GamePlay: View {
    @State private var animateViewsIn = false
    @State private var tappedCorrectAnswer = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("hogwarts")
                    .resizable()
                    .frame(width: geometry.size.width * 3, height: geometry.size.height * 1.05)
                    .overlay(Rectangle().foregroundStyle(.black).opacity(0.8))
                VStack {
                    HStack {
                        // MARK: Controls
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
                    VStack {
                        // MARK: Questions
                        if animateViewsIn {
                            Text("Who is Harry Potter?")
                                .font(.custom(Constants.potterFont, size: 50))
                                .multilineTextAlignment(.center)
                                .padding()
                                .transition(.scale)
                        }
                    }
                    .animation(.easeInOut(duration: 2), value: animateViewsIn)
                    Spacer()
                    HStack {
                        // MARK: Hints
                        VStack {
                            if animateViewsIn {
                                Image(systemName: "questionmark.app.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100)
                                    .foregroundStyle(.cyan)
                                    .rotationEffect(.degrees(-15))
                                    .padding()
                                    .padding(.leading, 20)
                                    .transition(.offset(x: -geometry.size.width/2))
                            }
                        }
                        .animation(.easeOut(duration: 1.5).delay(2), value: animateViewsIn)
                        Spacer()
                        VStack {
                            if animateViewsIn {
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
                                    .transition(.offset(x: geometry.size.width/2))
                            }
                        }
                        .animation(.easeOut(duration: 1.5).delay(2), value: animateViewsIn)
                    }
                    .padding(.bottom)
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        // MARK: Answers
                        ForEach(1..<5) { i in
                            VStack {
                                if animateViewsIn {
                                    Text("Answer \(i)")
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.center)
                                        .padding(10)
                                        .frame(width: geometry.size.width / 2.15, height: 80)
                                        .background(.green.opacity(0.5))
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .transition(.scale)
                                }
                            }
                            .animation(.easeOut(duration: 1).delay(1.5), value: animateViewsIn)
                        }
                    }
                    Spacer()
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .foregroundStyle(.white)
                // MARK: Celebration
                VStack {
                    Spacer()
                    VStack {
                        if tappedCorrectAnswer {
                            Text("5")
                                .font(.largeTitle)
                                .padding(.top, 50)
                                .transition(.offset(y: -geometry.size.height/4))
                        }
                    }
                    .animation(.easeInOut(duration: 1).delay(2), value: tappedCorrectAnswer)
                    Spacer()
                    VStack {
                        if tappedCorrectAnswer {
                            Text("Brilliant!")
                                .font(.custom(Constants.potterFont, size: 100))
                                .transition(.scale.combined(with: .offset(y: -geometry.size.height/2)))
                        }
                    }
                    .animation(.easeInOut(duration: 1).delay(1), value: tappedCorrectAnswer)
                    Spacer()
                    Text("Answer 1")
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .frame(width: geometry.size.width/2.15, height: 80)
                        .background(.green.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .scaleEffect(2)
                    Group {
                        Spacer()
                        Spacer()
                    }
                    VStack {
                        if tappedCorrectAnswer {
                            Button("Next Level >") {
                                // TODO: Next level question
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.blue.opacity(0.5))
                            .font(.title)
                            .transition(.offset(y: geometry.size.height/3))
                        }
                    }
                    .animation(.easeInOut(duration: 2.7).delay(2.7), value: tappedCorrectAnswer)
                    Group {
                        Spacer()
                        Spacer()
                    }
                }
                .foregroundStyle(.white)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .ignoresSafeArea()
        .onAppear {
            animateViewsIn = true
            tappedCorrectAnswer = true
        }
    }
}

#Preview {
    VStack {
        GamePlay()
    }
}
