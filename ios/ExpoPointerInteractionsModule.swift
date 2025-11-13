import ExpoModulesCore

public class ExpoPointerInteractionsModule: Module {
  public func definition() -> ModuleDefinition {
    Name("ExpoPointerInteractions")

    View(ExpoPointerInteractionsView.self) {
      Prop("pointerMode") { (view: ExpoPointerInteractionsView, mode: String) in
        view.pointerMode = mode as NSString
      }
      
      Prop("beamLength") { (view: ExpoPointerInteractionsView, length: Double) in
        view.beamLength = NSNumber(value: length)
      }
      
      Prop("hoverTint") { (view: ExpoPointerInteractionsView, enabled: Bool) in
        view.hoverTint = enabled
      }
      
      Prop("hoverShadow") { (view: ExpoPointerInteractionsView, enabled: Bool) in
        view.hoverShadow = enabled
      }
      
      Prop("hoverScale") { (view: ExpoPointerInteractionsView, enabled: Bool) in
        view.hoverScale = enabled
      }
    }
  }
}

