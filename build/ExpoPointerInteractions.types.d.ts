import type { StyleProp, ViewStyle } from "react-native";
export type ExpoPointerInteractionsModuleEvents = {};
export type PointerMode = "automatic" | "horizontalBeam" | "verticalBeam" | "highlight" | "lift" | "hover";
export type ExpoPointerInteractionsViewProps = {
    pointerMode?: PointerMode;
    beamLength?: number;
    hoverTint?: boolean;
    hoverShadow?: boolean;
    hoverScale?: boolean;
    style?: StyleProp<ViewStyle>;
    children?: React.ReactNode;
};
//# sourceMappingURL=ExpoPointerInteractions.types.d.ts.map