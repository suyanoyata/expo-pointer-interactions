import ExpoModulesCore
import UIKit

class ExpoPointerInteractionsView: ExpoView {
  
  private var _mode: String = "automatic"
  private var _beamLength: CGFloat = CGFloat(1)
  @objc var hoverTint: Bool = true
  @objc var hoverShadow: Bool = true
  @objc var hoverScale: Bool = true

  required init(appContext: AppContext? = nil) {
    super.init(appContext: appContext)
    clipsToBounds = true
    backgroundColor = .clear
    
    self.reactSetFrame(self.frame)
    
    if #available(iOS 13.4, *) {
      enablePointerInteraction()
    }
  }

  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  override func sizeThatFits(_ size: CGSize) -> CGSize {
    var maxWidth: CGFloat = 0
    var maxHeight: CGFloat = 0
    
    for subview in subviews {
      let subviewSize = subview.sizeThatFits(size)
      maxWidth = max(maxWidth, subviewSize.width)
      maxHeight = max(maxHeight, subviewSize.height)
    }
    
    return CGSize(width: maxWidth, height: maxHeight)
  }
  
  @objc var pointerMode: NSString? {
    set {
      if newValue != nil {
        self._mode = newValue! as String
      }
    }
    get {
      return nil
    }
  }
  
  @objc var beamLength: NSNumber? {
    set {
      if newValue != nil {
        self._beamLength = CGFloat(truncating: newValue! as NSNumber)
      }
    }
    get {
      return nil
    }
  }
}

@available(iOS 13.4, *)
extension ExpoPointerInteractionsView: UIPointerInteractionDelegate {

  func enablePointerInteraction() {
    self.addInteraction(UIPointerInteraction(delegate: self))
  }

  func pointerInteraction(_ interaction: UIPointerInteraction, regionFor request: UIPointerRegionRequest, defaultRegion: UIPointerRegion) -> UIPointerRegion? {
    return defaultRegion
  }

  func pointerInteraction(_ interaction: UIPointerInteraction, styleFor region: UIPointerRegion) -> UIPointerStyle? {
    switch self._mode {
    case "horizontalBeam":
      return UIPointerStyle(shape: .horizontalBeam(length: self._beamLength))
    case "verticalBeam":
      return UIPointerStyle(shape: .verticalBeam(length: self._beamLength))
    case "highlight":
      return UIPointerStyle(effect: .highlight(.init(view: self)))
    case "lift":
      return UIPointerStyle(effect: .lift(.init(view: self)))
    case "hover":
      return UIPointerStyle(
        effect: .hover(
          .init(view: self),
          preferredTintMode: self.hoverTint ? .overlay : .none,
          prefersShadow: self.hoverShadow,
          prefersScaledContent: self.hoverScale
        )
      )
    default:
      return UIPointerStyle(effect: .automatic(.init(view: self)))
    }
  }
}
