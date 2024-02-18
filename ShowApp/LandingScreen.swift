//
//  LandingScreen.swift
//  ShowApp
//
//  Created by Touqeer's Macbook  on 14/02/2024.
//
import SwiftUI
struct LaunchScreen2: View {
    
    // title variables
    @State var titles = [
    
        "Sample Text",
        "Sample Text",
        "Sample Text"
    ]
    
    @State var subTitles = [
        
        "Sample Text",
        "Sample Text",
        "Sample Text"
    ]
    
    // animation var
    // to get intial change
    @State var currentIndex: Int = 2
    
    @State var titleText: [TextAnimation] = []
    
    @State var subTitleAnimation: Bool = false
    
    @State var endAnimation = false
    @State var isShowingMainView: Bool = false
    
    var body: some View {
        
        ZStack {
            
            // geometry reader for screen size
            GeometryReader {proxy in
                
                let size  = proxy.size
                
                Color.black
                
                // changing image for index reset
                //same images as title
                ForEach(1...3,id: \.self){ index in
                    
                    Image("wallpaper\(index)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .opacity(currentIndex == (index - 1) ? 1 : 0)
                }
                
                // Linear Gradient
                LinearGradient(colors: [
                    
                    .clear,
                    .black.opacity(0.5),
                    .black
                ], startPoint: .top, endPoint: .bottom)
            }
            .ignoresSafeArea()
            
            // Bottom Content...
            VStack(spacing: 20) {
                Spacer()
                
                HStack(spacing: 0) {
                    
                    ForEach(titleText) {text in
                        
                        Text(text.text)
                            .offset(y: text.offset)
                            .padding(.top, 100)
                            .foregroundColor(.white)
                    }
                    .font(.largeTitle.bold())
                }
                .offset(y: endAnimation ? -200 : 0)
                .opacity(endAnimation ? 0 : 1)
                
                Text(subTitles[currentIndex])
                    .opacity(0.7)
                    .offset(y: !subTitleAnimation ? 80 : 0)
                    .offset(y: endAnimation ? -100 : 0)
                    .opacity(endAnimation ? 0 : 1)
                    .foregroundColor(.white)
                
                // Updated heart button
                Button(action: {
                    isShowingMainView = true
                }) {
                    Text("Continue to SmartLunch Form")
                        .font(.headline)
                        .foregroundColor(.orange)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                .shadow(color: .orange, radius: 20, x: 0, y: 5)
                        )
                }
                .fullScreenCover(isPresented: $isShowingMainView) {
                    EmptyView()
                }
                .padding(.bottom)
            }
        }
        .onAppear(perform: {
            currentIndex = 0
        })
        .onChange(of: currentIndex) { newValue in
            
            // updating if last index variables
            getSpilitedText(text: titles[currentIndex]){
                
               //removing the current one and updating the index
                withAnimation(.easeInOut(duration: 1)) {
                    endAnimation.toggle()
                }
                
                // update the index variable when animation resets
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                    
                    //removing title text when animation resets
                    titleText.removeAll()
                    subTitleAnimation.toggle()
                    endAnimation.toggle()
                    
                    //updating index
                    withAnimation(.easeIn(duration: 1)) {
                        
                        if currentIndex < (titles.count - 1) {
                            currentIndex += 1
                        }
                        else {
                            // setting the index variable back to 0 for endless loop because counter variable is assigned
                            //endless loop
                            currentIndex = 0
                        }
                    }
                }
            }
        }
    }
    
    // spliting text into array of characters for animation variable
    // completion for animation completion
    func getSpilitedText(text: String,completion: @escaping()->()) {
        
        for (index,character) in text.enumerated() {
            
            //appending into title text...
            titleText.append(TextAnimation(text: String(character)))
            
            // with time delay setting text offset to 0
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.07) {
                
                withAnimation(.easeInOut(duration: 1)) {
                    titleText[index].offset = 0
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(text.count) * 0.06) {
        
            withAnimation(.easeInOut(duration: 1)) {
                subTitleAnimation.toggle()
            }
            
            // completion of the animation
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.95) {
                
                completion()
            }
        }
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen2()
    }
}
struct PressButtons: View {
    
    var image: String
    var text: String
    var isSystem: Bool
    
    var onClick: ()->()
    
    var body: some View {
        
        HStack {
            
            (
            
                isSystem ? Image(systemName: image) : Image(image)
            )
            .resizable()
            .renderingMode(.template)
            .aspectRatio(contentMode: .fit)
            .frame(width: 25, height: 25)
            
            
            Text(text)
                .font(.title3)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .foregroundColor(!isSystem ? .white : .black)
        .padding(.vertical, 15)
        .padding(.horizontal, 40)
        .background(
            
            .white.opacity(isSystem ? 1 : 0.1)
            ,in: Capsule()
        )
        .onTapGesture {
            onClick()
        }
    }
}
struct TextAnimation: Identifiable {
    var id = UUID().uuidString
    var text: String
    var offset: CGFloat = 110
}

