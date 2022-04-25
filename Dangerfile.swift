import Danger 
import DangerSwiftCoverage

let danger = Danger()

let editedFiles = danger.git.modifiedFiles + danger.git.createdFiles
message("These files have changed: \(editedFiles.joined(separator: ", "))")

Coverage.xcodeBuildCoverage(.xcresultBundle("Build/Test/FlowersStore.xcresult"), 
                            minimumCoverage: 100, 
                            excludedTargets: ["FlowersStoreTests.xctest"])