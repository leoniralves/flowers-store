import Danger 
import DangerSwiftCoverage
import DangerXCodeSummary
import DangerSwiftPeriphery

let danger = Danger()

print("### danger.github", danger.github)
message("danger.github: \(danger.github)")
print("### danger.github.pullRequest.base.ref", "origin/\(github.pullRequest.base.ref)..HEAD"
message("danger.github.pullRequest.base.ref: origin/\(github.pullRequest.base.ref)..HEAD")

// DangerPeriphery.scan()

// let editedFiles = danger.git.modifiedFiles + danger.git.createdFiles
// message("These files have changed: \(editedFiles.joined(separator: ", "))")

// let summary = XCodeSummary(filePath: "result.json")
// summary.report()

// Coverage.xcodeBuildCoverage(.derivedDataFolder("Build"), 
//                             minimumCoverage: 90, 
//                             excludedTargets: ["FlowersStoreTests.xctest"])