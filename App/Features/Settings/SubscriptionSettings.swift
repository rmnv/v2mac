import SwiftUI
import V2MacCore

struct SubscriptionSettings: View {
    @AppStorage("autoUpdateSubscriptions") private var auto = true
    @AppStorage("subscriptionUpdateViaProxy") private var viaProxy = false
    @AppStorage("defaultIntervalHours") private var hours = 12
    @AppStorage("userAgent") private var userAgent = ""
    @AppStorage("sendSubscriptionHWID") private var sendHWID = true
    @AppStorage("subscriptionHWID") private var hwid = ""
    @AppStorage("latencyURL") private var url = "https://www.wikipedia.org"
    @AppStorage("latencyTimeout") private var timeout = 8.0
    @AppStorage("latencyConcurrency") private var concurrency = 32
    @AppStorage("speedTestURL") private var speedURL = Prefs.defaultSpeedURL

    var body: some View {
        Form {
            Section {
                Toggle("Auto-update subscriptions", isOn: $auto)
                Picker("Auto-update route", selection: $viaProxy) {
                    Text("Without proxy").tag(false)
                    Text("Via proxy").tag(true)
                }
                .disabled(!auto)
                Stepper("Default interval: \(hours) h", value: $hours, in: 1...168)
                    .disabled(!auto)
                TextField("User-Agent", text: $userAgent, prompt: Text("v2mac/\(Prefs.appVersion)"))
                Toggle("Send device ID (HWID)", isOn: $sendHWID)
                if sendHWID {
                    HStack {
                        TextField("HWID", text: $hwid)
                            .textFieldStyle(.roundedBorder)
                        Button("Regenerate") { hwid = UUID().uuidString.lowercased() }
                    }
                }
            } header: {
                Text("Subscriptions")
            } footer: {
                Text("The default interval is used when the provider doesn't send one. HWID is sent only to subscription providers that require a device limit.")
            }

            Section {
                TextField("Test URL", text: $url)
                Stepper("Timeout: \(Int(timeout)) s", value: $timeout, in: 2...30, step: 1)
                Stepper("Concurrency: \(concurrency)", value: $concurrency, in: 1...32)
                TextField("Speed test file", text: $speedURL)
            } header: {
                Text("Server testing")
            } footer: {
                Text("The speed test downloads a large file through each server. It stops as soon as the speed levels off, so the whole file is never fetched.")
            }
            ResetSettingsSection(tab: .servers)
        }
        .formStyle(.grouped)
        .onAppear {
            if hwid.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                hwid = Prefs.subscriptionHWID
            }
        }
    }
}
