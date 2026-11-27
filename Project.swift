import ProjectDescription

let deploymentTargets: DeploymentTargets = .iOS("17.0")

let targetSettings: Settings = .settings(
    base: [
        "SWIFT_VERSION": "6",
        "SWIFT_STRICT_CONCURRENCY": "complete",
        "ENABLE_USER_SCRIPT_SANDBOXING": "NO"
    ]
)

let swiftLintScript: TargetScript = .pre(
    script: """
    export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
    if which swiftlint > /dev/null; then
        swiftlint lint --strict --config "${SRCROOT}/.swiftlint.yml"
    else
        echo "error: SwiftLint is not installed. Run: brew install swiftlint"
        exit 1
    fi
    """,
    name: "SwiftLint",
    basedOnDependencyAnalysis: false
)

let project = Project(
    name: "Learnly",
    targets: [
        .target(
            name: "Learnly",
            destinations: .iOS,
            product: .app,
            bundleId: "com.pukhau.learnly",
            deploymentTargets: deploymentTargets,
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            buildableFolders: [
                "Learnly/Sources",
                "Learnly/Resources",
            ],
            scripts: [swiftLintScript],
            dependencies: [
                .external(name: "Core"),
            ],
            settings: targetSettings
        ),
        .target(
            name: "LearnlyTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.pukhau.learnly.tests",
            deploymentTargets: deploymentTargets,
            infoPlist: .default,
            buildableFolders: [
                "Learnly/Tests"
            ],
            dependencies: [.target(name: "Learnly")],
            settings: targetSettings
        ),
    ]
)
