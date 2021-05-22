load("@rev_bazel_rules//:load_rev.bzl", "load_rev")
load("@navx_bazel_rules//:load_navx.bzl", "load_navx")
load("@ctre_bazel_rules//:load_ctre.bzl", "load_ctre")

def load_vendordeps():
    load_ctre(version = "5.19.4")
    load_rev(version = "1.5.4")
    load_navx(version = "3.1.403")
