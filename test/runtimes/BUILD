# These packages are used to run language runtime tests inside gVisor sandboxes.

load("@io_bazel_rules_go//go:def.bzl", "go_library")
load("//runsc/test:build_defs.bzl", "runtime_test")

package(licenses = ["notice"])

go_library(
    name = "runtimes",
    srcs = ["runtimes.go"],
    importpath = "gvisor.dev/gvisor/test/runtimes",
)

test_suite(
    name = "runtimes_tests",
    tests = [
        "go_test",
        "java_test",
        "nodejs_test",
        "php_test",
        "python_test",
    ],
)

runtime_test(
    name = "go_test",
    size = "small",
    srcs = [
        "go_test.go",
        "runtimes_test.go",
    ],
    embed = [":runtimes"],
    tags = [
        # Requires docker and runsc to be configured before the test runs.
        "manual",
        "local",
    ],
    deps = ["//runsc/test/testutil"],
)

runtime_test(
    name = "java_test",
    size = "small",
    srcs = [
        "java_test.go",
        "runtimes_test.go",
    ],
    embed = [":runtimes"],
    tags = [
        "local",
        "manual",
    ],
    deps = ["//runsc/test/testutil"],
)

runtime_test(
    name = "nodejs_test",
    size = "small",
    srcs = [
        "nodejs_test.go",
        "runtimes_test.go",
    ],
    embed = [":runtimes"],
    tags = [
        "local",
        "manual",
    ],
    deps = ["//runsc/test/testutil"],
)

runtime_test(
    name = "php_test",
    size = "small",
    srcs = [
        "php_test.go",
        "runtimes_test.go",
    ],
    embed = [":runtimes"],
    tags = [
        "local",
        "manual",
    ],
    deps = ["//runsc/test/testutil"],
)

runtime_test(
    name = "python_test",
    size = "small",
    srcs = [
        "python_test.go",
        "runtimes_test.go",
    ],
    embed = [":runtimes"],
    tags = [
        "local",
        "manual",
    ],
    deps = ["//runsc/test/testutil"],
)
