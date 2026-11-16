import type { CapacitorConfig } from "@capacitor/cli"

const config: CapacitorConfig = {
  appId: "ai.nullcode.app",
  appName: "NullCode",
  webDir: "dist",
  server: {
    androidScheme: "https",
  },
}

export default config
