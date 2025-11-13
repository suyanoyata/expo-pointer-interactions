import { requireNativeView } from "expo";
import type * as React from "react";

import type { ExpoPointerInteractionsViewProps } from "./ExpoPointerInteractions.types";

const NativeView: React.ComponentType<ExpoPointerInteractionsViewProps> =
	requireNativeView("ExpoPointerInteractions");

export default function ExpoPointerInteractionsView({
	pointerMode = "lift",
	...props
}: ExpoPointerInteractionsViewProps) {
	return <NativeView pointerMode={pointerMode} {...props} />;
}
