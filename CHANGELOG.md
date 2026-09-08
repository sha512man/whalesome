# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## 2.6.0 - 2026-09-08
### Added
- Add `PRESERVE_EXISTING_USER=1` to migrate an existing account to the requested UID/GID without deleting it, reassigning file ownership on the root filesystem without crossing filesystem boundaries
- Add `PRESERVE_HOME=1` to keep the home directory when creating a user
### Changed
- Update an existing same-named group's GID to the requested value during user initialization
- Clarify entrypoint directory-change errors and command execution messages
### Fixed
- Use the standard logger to report initialization script failures instead of calling the undefined `echodt` command

## 2.4.1 - 2026-02-28
### Fixed
- Use POSIX-compatible output redirection in sudo/su-exec checks

## 2.4.0 - 2026-02-28
### Added
- Allow starting RUN_AS via su-exec
### Changed
- Replace sudo with su-exec for better sigterm handling
