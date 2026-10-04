# syntax=docker/dockerfile:1.7
FROM ubuntu:24.04

WORKDIR /workspace

# Deterministic slow layer: makes this project's FIRST image build long enough
# to cross the stale-provisioning clock (~10 min) that KRTX-1491 fixed.
# Distinct from repo 1 so the content hash differs and the build is not cached.
RUN sleep 760 && echo "slow build leg A finished"
