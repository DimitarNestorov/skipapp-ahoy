import Testing
import OSLog
import Foundation
import SkipBridge
@testable import SkipperModel

let logger: Logger = Logger(subsystem: "SkipperModel", category: "Tests")

@Suite struct SkipperModelTests {
    init() {
        #if SKIP
        // needed to load the compiled bridge when the tests are transpiled
        loadPeerLibrary(packageName: "skipapp-ahoy", moduleName: "SkipperModel")
        #endif
    }

    @Test func skipperModel() throws {
        logger.log("running testSkipperModel")
        #expect(1 + 2 == 3, "basic test")
    }

    @Test func viewModel() async throws {
        let vm = ViewModel()
        vm.items.append(Item(title: "ABC"))
        #expect(!vm.items.isEmpty)
        #expect(vm.items.last?.title == "ABC")

        vm.clear()
        #expect(vm.items.isEmpty)
    }

}
