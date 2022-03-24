//
//  CommonUI.swift
//  Edvora_Practicle_Task
//
//  Created by Manan Kakadiya on 24/03/22.
//

import Foundation
import SwiftUI

struct BackGround: View {
    var body: some View{
        return Image("bgImage")
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct logo: View {
    var body: some View{
        return Image("edvora")
            .scaledToFill()
            .frame(width: Utilities.setSize(size: 100), height: Utilities.setSize(size: 100))
    }
}

struct DefaultTextField: View {
    @Binding private var text: String
    private var title: String
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        return TextField(title, text: $text)
            .cornerRadius(Utilities.setSize(size: 5))
            .frame(height: Utilities.setSize(size: 45))
            .padding(EdgeInsets(top: 0, leading: Utilities.setSize(size: 10), bottom: 0, trailing: Utilities.setSize(size: 10)))
            .overlay(
                RoundedRectangle(cornerRadius: Utilities.setSize(size: 5))
                    .stroke(Color.gray, lineWidth: Utilities.setSize(size: 1))
            ).background(Color.white)
    }
}

struct CustomTextField : View {
    private var placeHolder: String
    @Binding private var text: String
    private var isImageShow : Bool
    private var imageName: String
   
    private var imageWidth: CGFloat
    private var imageHeight: CGFloat
    private var isShowButton: Bool
    private var buttonTitle: String
    private var buttonTitleFontWeight: Font.Weight
    private var buttonTitleColor: UIColor
    private var buttonBackGroundColor: UIColor
    private var buttonHeight: CGFloat
    private var buttonWidth: CGFloat
    
    private var isShowButtonImage: Bool
    private var buttonImageName: String
    
    private var buttonImageWidth: CGFloat
    private var buttonImageHeight: CGFloat
    
    private var textFieldHeight: CGFloat
    private var textFieldCornerRadius: CGFloat
    private var isTextFieldEditable : Bool
    let buttonClickedAction : ()->Void
    
    init(placeHolder: String,
         isImageShow: Bool,
         imageName: String,
        
         imageWidth : CGFloat,
         imageHeight : CGFloat,
         isShowButton: Bool,
         buttonTitle: String,
         buttonTitleFontWeight : Font.Weight,
         buttonTitleColor: UIColor,
         buttonBackGroundColor: UIColor,
         buttonHeight : CGFloat,
         buttonWidth : CGFloat,
         
         isShowButtonImage: Bool,
         buttonImageName: String,
         buttonImageWidth: CGFloat,
         buttonImageHeight: CGFloat,
         
         text: Binding<String>,
         textFieldHeight: CGFloat,
         textFieldCornerRadius: CGFloat,
         isTextFieldEditable : Bool,
         buttonClickedAction: @escaping ()->Void
    ) {
        self.placeHolder = placeHolder
        self.isImageShow = isImageShow
        self.imageName = imageName
        
        self.imageHeight = imageHeight
        self.imageWidth = imageWidth
        
        self.isShowButton = isShowButton
        self.buttonTitle = buttonTitle
        self.buttonTitleFontWeight = buttonTitleFontWeight
        self.buttonTitleColor = buttonTitleColor
        self.buttonBackGroundColor = buttonBackGroundColor
        self.buttonHeight = buttonHeight
        self.buttonWidth =  buttonWidth
        
        self.isShowButtonImage = isShowButtonImage
        self.buttonImageName = buttonImageName
       
        self.buttonImageWidth  = buttonImageWidth
        self.buttonImageHeight = buttonImageHeight
        
        
        self._text = text
        self.textFieldHeight = textFieldHeight
        self.textFieldCornerRadius = textFieldCornerRadius
        self.isTextFieldEditable = isTextFieldEditable
        self.buttonClickedAction = buttonClickedAction
    }
    
    var body: some View {
        return HStack {
            
            if isImageShow {
                Image("\(imageName)")
                    .resizable()
                    .frame(width: imageWidth, height: imageHeight)
                    .padding(EdgeInsets(top: Utilities.setSize(size: 0), leading: Utilities.setSize(size: 10), bottom: 0, trailing: Utilities.setSize(size: 0)))
            }
            
            TextField(placeHolder, text: $text)
                .cornerRadius(Utilities.setSize(size: 5))
                .frame(height: Utilities.setSize(size: 45))
                .padding(EdgeInsets(top: 0, leading: Utilities.setSize(size: 10), bottom: 0, trailing: Utilities.setSize(size: 10)))
                .disabled(!isTextFieldEditable)
            ZStack(alignment: .leading){
                if isShowButton{
                    
                    Button {
                        print("BtnClicked")
                        buttonClickedAction()
                    } label: {
                        Text("\(buttonTitle)").foregroundColor(Color(buttonTitleColor))
                            .fontWeight(buttonTitleFontWeight)
                    }
                    .frame(width: buttonWidth, height: buttonHeight)
                    .padding(EdgeInsets(top: Utilities.setSize(size: 0), leading: Utilities.setSize(size: 10), bottom: 0, trailing: Utilities.setSize(size: 10)))
                    
                    .background(Color(buttonBackGroundColor))
                    .cornerRadius(textFieldCornerRadius)
                    
                    if isShowButtonImage {
                        Image("\(buttonImageName)")
                            .resizable()
                            .frame(width: buttonImageWidth, height: buttonImageHeight)
                            .padding(EdgeInsets(top: Utilities.setSize(size: 0), leading: Utilities.setSize(size: 5), bottom: 0, trailing: Utilities.setSize(size: 0)))
                    }
                }
            }
        }.frame(height: textFieldHeight)
            .overlay(
                RoundedRectangle(cornerRadius: Utilities.setSize(size: textFieldCornerRadius))
                    .stroke(Color.gray, lineWidth: Utilities.setSize(size: 1))
            ).background(Color.white)
    }
}


struct PasswordInputView: View {
    @Binding private var text: String
    @State private var isSecured: Bool = true
    @State private var showingAlert = false
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        return ZStack(alignment: .trailing) {
            if isSecured {
                SecureField(title, text: $text)
                    .cornerRadius(Utilities.setSize(size: 5))
                    .frame(height: Utilities.setSize(size: 45))
                    .padding(EdgeInsets(top: 0, leading: Utilities.setSize(size: 10), bottom: 0, trailing: Utilities.setSize(size: 10)))
                    .overlay(
                        RoundedRectangle(cornerRadius: Utilities.setSize(size: 5))
                            .stroke(Color.gray, lineWidth: Utilities.setSize(size: 1))
                    ).padding(EdgeInsets(top: 0, leading: Utilities.setSize(size: 10), bottom: 0, trailing: Utilities.setSize(size: 10)))
            } else {
                TextField(title, text: $text)
                    .cornerRadius(Utilities.setSize(size: 5))
                    .cornerRadius(Utilities.setSize(size: 5))
                    .frame(height: Utilities.setSize(size: 45))
                    .padding(EdgeInsets(top: 0, leading: Utilities.setSize(size: 10), bottom: 0, trailing: Utilities.setSize(size: 50)))
                    .overlay(
                        RoundedRectangle(cornerRadius: Utilities.setSize(size: 5))
                            .stroke(Color.gray, lineWidth: Utilities.setSize(size: 1))
                    ).padding(EdgeInsets(top: 0, leading: Utilities.setSize(size: 10), bottom: 0, trailing: Utilities.setSize(size: 10)))
            }
            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
                    .frame(width: Utilities.setSize(size: 20), height: Utilities.setSize(size: 20), alignment: .center)
                    .padding(.trailing, Utilities.setSize(size: 30))
            }
        }
    }
}

@available(iOS 15.0, *)
struct BackButton: View {
    let CompleationHandler:(Bool)->Void
    @Environment(\.dismiss) var dismiss
    var body: some View{
        return HStack(alignment: .bottom){
            Button(action: {
                print("Do your action")
                dismiss()
                CompleationHandler(true)
            }) {
                Image(systemName: "arrow.left")
                    .frame(width: Utilities.setSize(size: 35), height: Utilities.setSize(size: 35))
                    .accentColor(.black)
            }
        }.frame(height: Utilities.setSize(size: 70))
    }
}


struct StarsView: View {
    let rating: CGFloat
    let maxRating: CGFloat
    private let size: CGFloat = 12
    var body: some View {
        let text = HStack(spacing: 0) {
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: size, height: size, alignment: .center)
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: size, height: size, alignment: .center)
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: size, height: size, alignment: .center)
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: size, height: size, alignment: .center)
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: size, height: size, alignment: .center)
        }
        ZStack {
            text
            HStack(content: {
                GeometryReader(content: { geometry in
                    HStack(spacing: 0, content: {
                        let width1 = self.valueForWidth(geometry.size.width, value: rating)
                        let width2 = self.valueForWidth(geometry.size.width, value: (maxRating - rating))
                        Rectangle()
                            .frame(width: width1, height: geometry.size.height, alignment: .center)
                            .foregroundColor(.yellow)
                        
                        Rectangle()
                            .frame(width: width2, height: geometry.size.height, alignment: .center)
                            .foregroundColor(.gray)
                    })
                })
                .frame(width: size * maxRating, height: size, alignment: .trailing)
            })
            .mask(
                text
            )
        }
        .frame(width: size * maxRating, height: size, alignment: .leading)
    }
    
    func valueForWidth(_ width: CGFloat, value: CGFloat) -> CGFloat {
        value * width / maxRating
    }
}


struct ratingView: View {
    @Binding var rating : Int
    var maxRating : Int
    var starWidth : CGFloat
    var starHeight : CGFloat
    var spacingBetweenStar : CGFloat
    
    
    let completionHandler : (Int) -> Void
    
    var body: some View {
        ZStack{
                HStack(spacing: spacingBetweenStar){
                    ForEach(0..<maxRating){ index in
                        Image(systemName: index <= self.rating ? "star.fill" : "star")
                            .resizable()
                            .frame(width: starWidth, height: starWidth)
                            .foregroundColor(.orange)
                            .onTapGesture {
//                                print("\(index)")
                                rating = index
                                completionHandler(rating + 1)
                            }
                    }
                    Spacer()
                }
        }
    }
}


class TextView {
    struct textView: UIViewRepresentable {

    @Binding var text: String
    @Binding var didStartEditing: Bool


    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.autocapitalizationType = .sentences
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true
        textView.delegate = context.coordinator
        return textView
    }


    func updateUIView(_ uiView: UITextView, context: Context) {
        
        if didStartEditing {
            
            uiView.textColor = UIColor.black
            uiView.text = text
            
        }
        else {
            uiView.text = "Ex. Make spicy or Writing over Cake order..."
            uiView.textColor = UIColor.lightGray
        }
        
        uiView.font = UIFont.systemFont(ofSize: Utilities.setFontSize(size: 14), weight: .regular)
        
    }
        
        func makeCoordinator() -> Coordinator {
            Coordinator($text)
        }
    }

    class Coordinator: NSObject, UITextViewDelegate {
        var text: Binding<String>
        init(_ text: Binding<String>) {
            self.text = text
        }
     
        func textViewDidChange(_ textView: UITextView) {
            DispatchQueue.main.async {
                self.text.wrappedValue = textView.text
            }
        }
    }
}

struct PopUpWindow: View {
    var title: String
    var message: String
    var buttonText: String
    @Binding var show: Bool

    var body: some View {
        ZStack {
            if show {
                // PopUp background color
                Color.black.opacity(show ? 0.3 : 0).edgesIgnoringSafeArea(.all)

                // PopUp Window
                VStack(alignment: .center, spacing: 0) {
                    Text(title)
                        .frame(maxWidth: .infinity)
                        .frame(height: 45, alignment: .center)
                        .font(Font.system(size: 23, weight: .semibold))
                        .foregroundColor(Color.white)
                        .background(Color(#colorLiteral(red: 0.6196078431, green: 0.1098039216, blue: 0.2509803922, alpha: 1)))

                    Text(message)
                        .multilineTextAlignment(.center)
                        .font(Font.system(size: 16, weight: .semibold))
                        .padding(EdgeInsets(top: 20, leading: 25, bottom: 20, trailing: 25))
                        .foregroundColor(Color.white)

                    Button(action: {
                        // Dismiss the PopUp
                        withAnimation(.linear(duration: 0.3)) {
                            show = false
                        }
                    }, label: {
                        Text(buttonText)
                            .frame(maxWidth: .infinity)
                            .frame(height: 54, alignment: .center)
                            .foregroundColor(Color.white)
                            .background(Color(#colorLiteral(red: 0.6196078431, green: 0.1098039216, blue: 0.2509803922, alpha: 1)))
                            .font(Font.system(size: 23, weight: .semibold))
                    }).buttonStyle(PlainButtonStyle())
                }
                .frame(maxWidth: 300)
                .background(Color(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1)))
            }
        }
    }
}

struct DEVICE {
    static let IS_IPHONE           = UIDevice.current.userInterfaceIdiom == .phone
    static let IS_IPAD             = UIDevice.current.userInterfaceIdiom == .pad
    static let SCREEN_WIDTH        = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT       = UIScreen.main.bounds.size.height
    static let SCREEN_BOUNDS       = UIScreen.main.bounds
    static let SCREEN_SCALE        = UIScreen.main.scale
    static let SCREEN_MAX_LENGTH   = max(SCREEN_WIDTH, SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH   = min(SCREEN_WIDTH, SCREEN_HEIGHT)
    static let IS_IPHONE_4_OR_LESS = IS_IPHONE && SCREEN_MAX_LENGTH  < 568
    static let IS_IPHONE_5         = IS_IPHONE && SCREEN_MAX_LENGTH == 568
    static let IS_IPHONE_6         = IS_IPHONE && SCREEN_MAX_LENGTH == 667
    static let IS_IPHONE_6P        = IS_IPHONE && SCREEN_MAX_LENGTH == 736
    static let IS_IPHONE_X         = IS_IPHONE && SCREEN_MAX_LENGTH == 812
    static let IS_IPHONE_XS        = IS_IPHONE && SCREEN_MAX_LENGTH == 812.0
    static let IS_IPHONE_XR        = IS_IPHONE && SCREEN_MAX_LENGTH == 896.0
    static let IS_IPHONE_X_MAX     = IS_IPHONE && SCREEN_MAX_LENGTH == 896.0
    static let IS_IPADPRO9         = IS_IPAD && SCREEN_HEIGHT == 1024.0
    static let IS_IPADPRO12        = IS_IPAD && SCREEN_HEIGHT == 1366.0
}


