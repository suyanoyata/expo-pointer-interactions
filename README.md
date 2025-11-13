# expo-pointer-interactions

A React Native module that adds iPad pointer interactions support to your Expo app. Provides multiple pointer effect modes including lift, highlight, hover, and beam effects for enhanced user experience on iPad.

## Installation

### In managed Expo projects

```sh
bunx expo install expo-pointer-interactions
```

### In bare React Native projects
First, ensure you have [installed and configured the `expo` package](https://docs.expo.dev/bare/installing-expo-modules/).

Then install the module:

```sh
bun install expo-pointer-interactions
```

Finally, run `bunx pod-install` to install the native iOS dependencies.

## Usage

Wrap your components with `ExpoPointerInteractionsView` to enable pointer interactions:

```tsx
import { ExpoPointerInteractionsView } from 'expo-pointer-interactions';
import { Pressable, View } from 'react-native';

export default function App() {
  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <ExpoPointerInteractionsView pointerMode="lift">
        <Pressable
          style={{
            backgroundColor: 'rgba(0,0,0,0.1)',
            borderRadius: 12,
            width: 100,
            height: 100,
          }}
          onPress={() => console.log('pressed')}
        />
      </ExpoPointerInteractionsView>
    </View>
  );
}
```

## Props

The `ExpoPointerInteractionsView` component accepts the following props:

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `pointerMode` | `string` | `"lift"` | The pointer interaction effect mode |
| `beamLength` | `number` | `1` | Length of the beam effect (used with `verticalBeam` or `horizontalBeam`) |
| `hoverTint` | `boolean` | `true` | Enable tint overlay on hover |
| `hoverShadow` | `boolean` | `true` | Enable shadow effect on hover |
| `hoverScale` | `boolean` | `true` | Enable scale animation on hover |
| `style` | `ViewStyle` | - | React Native style props |
| `children` | `React.ReactNode` | - | Child components to apply the interaction to |

### Pointer Modes

- **`"automatic"`** — Let iOS choose the appropriate effect
- **`"lift"`** — Lifts the content with a shadow effect
- **`"highlight"`** — Highlights the content
- **`"hover"`** — Hover effect with customizable tint, shadow, and scale
- **`"verticalBeam"`** — Vertical beam cursor effect
- **`"horizontalBeam"`** — Horizontal beam cursor effect


### Beam Effect
```tsx
<ExpoPointerInteractionsView pointerMode="verticalBeam" beamLength={20}>
  <Pressable style={styles.button}>
    <Text>Beam Cursor</Text>
  </Pressable>
</ExpoPointerInteractionsView>
```

## Platform Support

- iOS 13.4+ (iPad)

## How It Works

This module creates a transparent container view that wraps your components and applies iOS pointer interaction effects. The view automatically sizes itself to fit its children and applies the specified pointer interaction style.