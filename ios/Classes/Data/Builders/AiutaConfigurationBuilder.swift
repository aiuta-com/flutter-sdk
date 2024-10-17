// Copyright 2024 Aiuta USA, Inc
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import AiutaSdk
import Flutter
import UIKit

extension AiutaPlugin.Configuration {
    func buildConfiguration() -> Aiuta.Configuration {
        var cfg = Aiuta.Configuration()

        cfg.appearance.presentationStyle = mode.presentationStyle
        theme?.write(to: &cfg)

        cfg.behavior.isHistoryAvailable = toggles.isHistoryAvailable
        cfg.behavior.isWishlistAvailable = toggles.isWishlistAvailable
        cfg.behavior.tryGeneratePersonSegmentation = true
        cfg.behavior.isDebugLogsEnabled = true

        return cfg
    }
}

@available(iOS 13.0.0, *)
extension AiutaPlugin.Configuration {
    func buildAuth(_ jwtProvider: AiutaJwtProvider) throws -> AiutaAuthType {
        switch authentication.mode {
            case .apiKey:
                guard let apiKey = authentication.apiKey else {
                    throw AiutaPluginError.invalidConfiguration("Authentication apiKey is required")
                }
                return .apiKey(apiKey: apiKey)
            case .jwt:
                guard let subscriptionId = authentication.subscriptionId else {
                    throw AiutaPluginError.invalidConfiguration("Authentication subscriptionId is required")
                }
                return .jwt(subscriptionId: subscriptionId, jwtProvider: jwtProvider)
        }
    }
}

private extension AiutaPlugin.Configuration.PresentationMode {
    var presentationStyle: Aiuta.Configuration.Appearance.PresentationStyle {
        switch self {
            case .fullScreen: return .fullScreen
            case .bottomSheet: return .bottomSheet
            case .pageSheet: return .pageSheet
        }
    }
}

private extension AiutaPlugin.Configuration.Theme {
    func write(to cfg: inout Aiuta.Configuration) {
        colors?.write(to: &cfg.appearance)
        gradients?.write(to: &cfg.appearance)
        typography?.write(to: &cfg.appearance)
        icons?.write(to: &cfg.appearance)
        shapes?.write(to: &cfg.appearance)
        dimensions?.write(to: &cfg.appearance)
        watermark?.write(to: &cfg.behavior)
        images?.write(to: &cfg.appearance)
        toggles?.write(to: &cfg.appearance)
    }
}

private extension AiutaPlugin.Configuration.Theme.Colors {
    func write(to cfg: inout Aiuta.Configuration.Appearance) {
        cfg.colors.brand = UIColor(argb: brand)
        cfg.colors.accent = UIColor(argb: accent)
        cfg.colors.aiuta = UIColor(argb: aiuta)

        cfg.colors.primary = UIColor(argb: primary)
        cfg.colors.secondary = UIColor(argb: secondary)
        cfg.colors.tertiary = UIColor(argb: tertiary)
        cfg.colors.onDark = UIColor(argb: onDark)

        cfg.colors.error = UIColor(argb: error)
        cfg.colors.onError = UIColor(argb: onError)

        cfg.colors.background = UIColor(argb: background)
        cfg.colors.neutral = UIColor(argb: neutral)
        cfg.colors.neutral2 = UIColor(argb: neutral2)
        cfg.colors.neutral3 = UIColor(argb: neutral3)

        // Parameters that don't have direct mappings in Aiuta.Configuration.Appearance
        // cfg.colors.green = ???
        // cfg.colors.red = ???
        // cfg.colors.gray = ???
        // cfg.colors.lightGray = ???
        // cfg.colors.darkGray = ???
    }
}

private extension AiutaPlugin.Configuration.Theme.Gradients {
    func write(to cfg: inout Aiuta.Configuration.Appearance) {
        cfg.colors.loadingAnimation = loadingAnimation.compactMap { UIColor(argb: $0) }
    }
}

private extension AiutaPlugin.Configuration.Theme.Typography {
    func write(to cfg: inout Aiuta.Configuration.Appearance) {
        cfg.fonts.titleXL = titleXL.aiutaCustomFont
        cfg.fonts.titleL = titleL.aiutaCustomFont
        cfg.fonts.titleM = titleM.aiutaCustomFont
        cfg.fonts.navBar = navbar.aiutaCustomFont
        cfg.fonts.regular = regular.aiutaCustomFont
        cfg.fonts.button = button.aiutaCustomFont
        cfg.fonts.buttonS = smallButton.aiutaCustomFont
        cfg.fonts.cells = cells.aiutaCustomFont
        cfg.fonts.chips = chips.aiutaCustomFont
        cfg.fonts.product = productName.aiutaCustomFont
        cfg.fonts.price = price.aiutaCustomFont
        cfg.fonts.brand = brandName.aiutaCustomFont
        cfg.fonts.description = description.aiutaCustomFont
    }
}

private extension AiutaPlugin.Configuration.Theme.CustomFont {
    var aiutaCustomFont: Aiuta.Configuration.Appearance.CustomFont {
        Aiuta.Configuration.Appearance.CustomFont(
            font: lookupFont() ?? UIFont.systemFont(ofSize: CGFloat(fontSize), weight: fontWeight.uiFontWeight),
            family: fontFamily,
            size: CGFloat(fontSize),
            weight: fontWeight.uiFontWeight,
            kern: letterSpacing,
            lineHeightMultiple: lineHeight
        )
    }

    func lookupFont() -> UIFont? {
        if let font = UIFont(name: "\(fontFamily)-\(fontWeight.nameSuffix)", size: CGFloat(fontSize)) { return font }
        let fontKey = FlutterDartProject.lookupKey(forAsset: ttfPath)
        guard let path = Bundle.main.path(forResource: fontKey, ofType: nil),
              let fontData = NSData(contentsOfFile: path),
              let dataProvider = CGDataProvider(data: fontData),
              let fontRef = CGFont(dataProvider),
              let fontName = fontRef.fullName as? String else { return nil }
        var errorRef: Unmanaged<CFError>?
        guard CTFontManagerRegisterGraphicsFont(fontRef, &errorRef) else { return nil }
        return UIFont(name: fontName, size: CGFloat(fontSize))
    }
}

private extension AiutaPlugin.Configuration.Theme.FontWeight {
    var uiFontWeight: UIFont.Weight {
        switch self {
            case .thin: return .thin
            case .extralight: return .ultraLight
            case .light: return .light
            case .normal: return .regular
            case .medium: return .medium
            case .semibold: return .semibold
            case .bold: return .bold
            case .extrabold: return .heavy
            case .black: return .black
        }
    }

    var nameSuffix: String {
        switch self {
            case .thin: return "Thin"
            case .extralight: return "UltraLight"
            case .light: return "Light"
            case .normal: return "Regular"
            case .medium: return "Medium"
            case .semibold: return "Semibold"
            case .bold: return "Bold"
            case .extrabold: return "Heavy"
            case .black: return "Black"
        }
    }
}

private extension AiutaPlugin.Configuration.Theme.Icons {
    func write(to cfg: inout Aiuta.Configuration.Appearance) {
        cfg.images.icons16.check = check16.uiImage()
        cfg.images.icons16.magic = magic16.uiImage()
        cfg.images.icons16.lock = lock16.uiImage()
        cfg.images.icons16.arrow = arrow16.uiImage()
        cfg.images.icons24.back = back24.uiImage()
        cfg.images.icons24.camera = camera24.uiImage()
        cfg.images.icons24.checkCorrect = checkCorrect24.uiImage()
        cfg.images.icons24.checkNotCorrect = checkNotCorrect24.uiImage()
        cfg.images.icons24.close = close24.uiImage()
        cfg.images.icons24.trash = trash24.uiImage()
        cfg.images.icons24.takePhoto = takePhoto24.uiImage()
        cfg.images.icons24.history = history24.uiImage()
        cfg.images.icons24.photoLibrary = photoLibrary24.uiImage()
        cfg.images.icons24.share = share24.uiImage()
        cfg.images.icons24.wishlist = wishlist24.uiImage()
        cfg.images.icons24.wishlistFill = wishlistFill24.uiImage()
        cfg.images.icons36.error = error36.uiImage()
        cfg.images.icons36.like = like36.uiImage()
        cfg.images.icons36.dislike = dislike36.uiImage()
        cfg.images.icons82.splash = welcomeScreen82.uiImage()
    }
}

private extension AiutaPlugin.Configuration.Theme.Shapes {
    func write(to cfg: inout Aiuta.Configuration.Appearance) {
        cfg.dimensions.imageMainRadius = CGFloat(mainImage)
        cfg.dimensions.imageBoardingRadius = CGFloat(onboardingImage)
        cfg.dimensions.imagePreviewRadius = CGFloat(previewImage)
        cfg.dimensions.bottomSheetRadius = CGFloat(bottomSheet)
        cfg.dimensions.buttonLargeRadius = CGFloat(buttonL)
        cfg.dimensions.buttonSmallRadius = CGFloat(buttonM)
    }
}

private extension AiutaPlugin.Configuration.Theme.Dimensions {
    func write(to cfg: inout Aiuta.Configuration.Appearance) {
        cfg.dimensions.grabberWidth = grabberWidth.map { CGFloat($0) }
        cfg.dimensions.grabberOffset = grabberPaddingTop.map { CGFloat($0) }
    }
}

private extension AiutaPlugin.Configuration.Theme.Watermark {
    func write(to cfg: inout Aiuta.Configuration.Behavior) {
        cfg.watermark.image = UIImage(named: path)
    }
}

private extension AiutaPlugin.Configuration.Theme.Images {
    func write(to cfg: inout Aiuta.Configuration.Appearance) {
        if let preonboardingImagePath {
            cfg.images.screens.splash = UIImage(named: preonboardingImagePath)
        }
    }
}

private extension AiutaPlugin.Configuration.Theme.ThemeToggles {
    func write(to cfg: inout Aiuta.Configuration.Appearance) {
        cfg.extendedOnbordingNavBar = isOnboardingAppBarExtended
        cfg.preferRightClose = isMainAppbarReversed
        cfg.reduceShadows = isShadowsReduced
        cfg.dimensions.continuingSeparators = isDelimitersExtended
    }
}

private extension AiutaPlugin.Configuration.Theme.Icon {
    func uiImage() -> UIImage? {
        let image = lookupImage()
        if !(shouldRenderAsIs ?? false) {
            return image?.withRenderingMode(.alwaysTemplate)
        } else {
            return image?.withRenderingMode(.alwaysOriginal)
        }
    }

    func lookupImage() -> UIImage? {
        let filename = (path as NSString).lastPathComponent
        let path = (path as NSString).deletingLastPathComponent

        for screenScale in stride(from: Int(UIScreen.main.scale), to: 1, by: -1) {
            let key = FlutterDartProject.lookupKey(forAsset: "\(path)/\(screenScale).0x/\(filename)")
            if let image = UIImage(named: key, in: Bundle.main, compatibleWith: nil) {
                return image
            }
        }

        let key = FlutterDartProject.lookupKey(forAsset: self.path)
        return UIImage(named: key, in: Bundle.main, compatibleWith: nil)
    }
}

private extension UIColor {
    /// Initializes a UIColor from a hexadecimal ARGB string.
    /// - Parameter argb: The hexadecimal color string in ARGB format, e.g., "#FF9F9F9F".
    convenience init?(argb: String) {
        // Ensure the string starts with a "#" and has exactly 9 characters.
        guard argb.hasPrefix("#") && argb.count == 9 else {
            return nil
        }

        let hexString = String(argb.dropFirst()) // Drop the "#"
        var hexNumber: UInt64 = 0
        guard Scanner(string: hexString).scanHexInt64(&hexNumber) else {
            return nil
        }

        let a = CGFloat((hexNumber & 0xFF000000) >> 24) / 255.0
        let r = CGFloat((hexNumber & 0x00FF0000) >> 16) / 255.0
        let g = CGFloat((hexNumber & 0x0000FF00) >> 8) / 255.0
        let b = CGFloat(hexNumber & 0x000000FF) / 255.0

        self.init(red: r, green: g, blue: b, alpha: a)
    }
}
