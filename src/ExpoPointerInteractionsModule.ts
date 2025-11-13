import { NativeModule, requireNativeModule } from "expo";

import type { ExpoPointerInteractionsModuleEvents } from "./ExpoPointerInteractions.types";

declare class ExpoPointerInteractionsModule extends NativeModule<ExpoPointerInteractionsModuleEvents> {}

export default requireNativeModule<ExpoPointerInteractionsModule>(
	"ExpoPointerInteractions",
);
