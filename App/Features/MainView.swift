import SwiftData
import SwiftUI
import UniformTypeIdentifiers

struct MainView: View {
    @Environment(AppModel.self) private var model
    @Query(sort: \ServerGroup.sortIndex) private var groups: [ServerGroup]

    private func profile(for request: ServerEditorRequest) -> Profile? {
        switch request.target {
        case .new: nil
        case .edit(let id), .copy(let id): model.profile(id: id)
        }
    }

    var body: some View {
        @Bindable var model = model
        NavigationSplitView {
            SidebarView()
                .navigationSplitViewColumnWidth(min: 190, ideal: 220, max: 320)
        } detail: {
            if groups.isEmpty {
                ContentUnavailableView {
                    Image(nsImage: NSApp.applicationIconImage)
                        .resizable()
                        .frame(width: 96, height: 96)
                    Text("No Subscriptions").font(.title2.bold())
                } description: {
                    Text("Add a subscription URL, or paste configs with ⌘V.")
                } actions: {
                    Button("Add Subscription") { model.showAddSheet = true }
                        .buttonStyle(.borderedProminent)
                }
            } else {
                ServerListView()
            }
        }
        .frame(minWidth: 760, minHeight: 440)
        // Text fields handle their own paste; this is reached when a list has the focus.
        .onPasteCommand(of: [.plainText, .image]) { _ in model.pasteFromClipboard() }
        // Config files, pictures of QR codes, and links dragged from a browser.
        .dropDestination(for: URL.self) { urls, _ in
            for url in urls { url.isFileURL ? model.importFile(url) : model.importText(url.absoluteString) }
            return !urls.isEmpty
        }
        .sheet(isPresented: $model.showAddSheet) {
            if model.opensEditorAfterAddSheet {
                model.opensEditorAfterAddSheet = false
                model.serverEditor = ServerEditorRequest(target: .new)
            }
        } content: {
            AddSubscriptionSheet()
        }
        .alert("Could not save changes", isPresented: Binding { model.saveError != nil } set: { if !$0 { model.saveError = nil } }) {
            Button("OK") {}
        } message: {
            Text("They will be lost when V2Mac quits. \(model.saveError ?? "")")
        }
        .sheet(item: $model.cleanIPScan) { CleanIPSheet(profileID: $0.id) }
        .sheet(item: $model.serverEditor) { request in
            ServerEditorSheet(request: request, profile: profile(for: request))
        }
        .sheet(isPresented: $model.showRegionsSheet) {
            RegionPacksView()
        }
        .sheet(isPresented: Bindable(model.sandbox).showEntrySheet) { SandboxEntrySheet() }
    }
}

/// A glowing icon that shows its text while the pointer is over it; opens Settings to install.
struct UpdateButton: View {
    var title: LocalizedStringKey = "Software Update Available"
    /// The pill opens to the right of the icon (beside the sidebar's Sandbox button) instead of the left.
    var opensTrailing = false
    /// Where the update is installed.
    var tab: SettingsTab = .general
    @Environment(AppModel.self) private var model
    @Environment(\.openSettings) private var openSettings
    @State private var hovering = false
    @State private var closing: Task<Void, Never>?

    var body: some View {
        ZStack(alignment: opensTrailing ? .leading : .trailing) {
            // The item is always as wide as the open pill: the toolbar only passes hover and clicks
            // inside an item's frame, and resizing the item made the toolbar jump.
            pillLabel.hidden()
            if hovering {
                pillLabel
                    .background(.regularMaterial, in: .capsule)
                    .background { glow }
                    .contentShape(.capsule)
                    .onTapGesture(perform: open)
                    .onHover(perform: hover)
                    .transition(.opacity.combined(with: .scale(scale: 0.6, anchor: opensTrailing ? .leading : .trailing)))
            }
            Button(action: open) { icon }
                .buttonStyle(.plain)
                .padding(6)
                .onHover(perform: hover)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(title)
        .accessibilityAddTraits(.isButton)
        .accessibilityAction { open() }
    }

    /// Room is left beside the text for the button's own icon, which stays on top.
    private var pillLabel: some View {
        HStack(spacing: 6) {
            if opensTrailing { icon.hidden() }
            Text(title).font(.callout.weight(.medium))
            if !opensTrailing { icon.hidden() }
        }
        .padding(.leading, opensTrailing ? 6 : 12)
        .padding(.trailing, opensTrailing ? 12 : 6)
        .padding(.vertical, 6)
        .fixedSize()
    }

    private func open() { model.openSettings(openSettings, tab: tab) }

    /// Closes half a second after the pointer leaves, so moving between the icon and the pill keeps it open.
    private func hover(_ inside: Bool) {
        closing?.cancel()
        if inside {
            guard !hovering else { return }
            withAnimation(.smooth(duration: 0.3)) { hovering = true }
        } else {
            closing = Task {
                try? await Task.sleep(for: .seconds(0.5))
                guard !Task.isCancelled else { return }
                withAnimation(.smooth(duration: 0.3)) { hovering = false }
            }
        }
    }

    private var icon: some View {
        Image(systemName: "arrow.down.circle.fill")
            .font(.title3)
            .background {
                // While hovered, the glow moves out to the pill around the whole button.
                Circle()
                    .fill(Self.rainbow)
                    .blur(radius: 5)
                    .opacity(hovering ? 0 : 1)
            }
    }

    /// A lightweight macOS 15 fallback for the animated Liquid Glass glow.
    private var glow: some View {
        Capsule()
            .fill(Self.rainbow)
            .padding(-4)
            .blur(radius: 8)
            .opacity(0.75)
    }

    private static let rainbow = AngularGradient(colors: [.red, .orange, .yellow, .green, .cyan, .blue, .purple, .red], center: .center)
}
