import { requireNativeView } from "expo";
const NativeView = requireNativeView("ExpoPointerInteractions");
export default function ExpoPointerInteractionsView({ pointerMode = "lift", ...props }) {
    return <NativeView pointerMode={pointerMode} {...props}/>;
}
//# sourceMappingURL=ExpoPointerInteractionsView.js.map