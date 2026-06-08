IOS_DIR = $(PLATFORM_DIR)/ios

define UPDATE_PATH_EXCLUDES +=
plugins/SSH.koplugin
plugins/autofrontlight.koplugin
plugins/hello.koplugin
plugins/timesync.koplugin
tools
endef

# Preflight: bail out early with a single message listing every missing
# brew package + the PATH export, instead of failing one tool at a time
# during the build (see hezi/koreader-ios#1).
ios-check-prereqs:
	@$(CURDIR)/platform/ios/check-prereqs.sh

update: ios-check-prereqs all
	$(CURDIR)/platform/ios/do_ios_bundle.sh $(INSTALL_DIR)

# Version string baked into the Info.plist. Upstream's $(VERSION) comes from
# `git describe HEAD`, which fails (empty) on a tag-less fork; fall back to a
# short commit hash so CFBundleShortVersionString is never blank. Strip a
# leading "v" to match do_ios_bundle.sh.
IOS_VERSION := $(patsubst v%,%,$(or $(VERSION),$(shell git describe --tags --always HEAD 2>/dev/null),1.0))

# Generate platform/ios/Info.plist from the template. project.yml points
# INFOPLIST_FILE here, so the file must exist before Xcode plans the build
# (otherwise: "Build input file cannot be found"). The non-Xcode `update`
# flow generates its own copy inside the .app via do_ios_bundle.sh; this is
# the equivalent for the Xcode flow. The file is .gitignore'd.
$(IOS_DIR)/Info.plist: $(IOS_DIR)/Info.plist.in
	sed "s|@VERSION@|$(IOS_VERSION)|g" $< >$@

# Generate KOReader.xcodeproj at the repo root from platform/ios/project.yml.
# Depends on `all` so the staging tree + base/build/<machine>/libs/ exist
# (the project's pre-build script also calls `make TARGET=ios base`, but
# having them present at generation time avoids confusing first-time errors).
xcodeproj: ios-check-prereqs all $(IOS_DIR)/Info.plist
	xcodegen generate \
		--spec $(IOS_DIR)/project.yml \
		--project $(CURDIR) \
		--project-root $(CURDIR)
	@echo
	@echo "Generated $(CURDIR)/KOReader.xcodeproj"
	@echo "Open it in Xcode, set your Team under Signing & Capabilities,"
	@echo "then Run on a connected device (or a simulator if libs are simulator-built)."

PHONY += ios-check-prereqs xcodeproj
