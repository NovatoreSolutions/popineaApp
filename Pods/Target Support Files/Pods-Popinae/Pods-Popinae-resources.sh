#!/bin/sh
set -e

mkdir -p "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"

RESOURCES_TO_COPY=${PODS_ROOT}/resources-to-copy-${TARGETNAME}.txt
> "$RESOURCES_TO_COPY"

install_resource()
{
  case $1 in
    *.storyboard)
      echo "ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .storyboard`.storyboardc ${PODS_ROOT}/$1 --sdk ${SDKROOT}"
      ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .storyboard`.storyboardc" "${PODS_ROOT}/$1" --sdk "${SDKROOT}"
      ;;
    *.xib)
        echo "ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .xib`.nib ${PODS_ROOT}/$1 --sdk ${SDKROOT}"
      ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .xib`.nib" "${PODS_ROOT}/$1" --sdk "${SDKROOT}"
      ;;
    *.framework)
      echo "mkdir -p ${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      mkdir -p "${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      echo "rsync -av ${PODS_ROOT}/$1 ${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      rsync -av "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      ;;
    *.xcdatamodel)
      echo "xcrun momc \"${PODS_ROOT}/$1\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1"`.mom\""
      xcrun momc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodel`.mom"
      ;;
    *.xcdatamodeld)
      echo "xcrun momc \"${PODS_ROOT}/$1\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodeld`.momd\""
      xcrun momc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodeld`.momd"
      ;;
    *.xcmappingmodel)
      echo "xcrun mapc \"${PODS_ROOT}/$1\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcmappingmodel`.cdm\""
      xcrun mapc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcmappingmodel`.cdm"
      ;;
    *.xcassets)
      ;;
    /*)
      echo "$1"
      echo "$1" >> "$RESOURCES_TO_COPY"
      ;;
    *)
      echo "${PODS_ROOT}/$1"
      echo "${PODS_ROOT}/$1" >> "$RESOURCES_TO_COPY"
      ;;
  esac
}
          install_resource "CrittercismSDK/CrittercismSDK/dsym_upload.sh"
                    install_resource "NZAlertView/NZAlertView/NZAlertView-Icons.bundle"
                    install_resource "NZAlertView/NZAlertView/Views/NZAlertView.xib"
                    install_resource "SAMAddressBar/Resources/SAMAddressBar-background.png"
                    install_resource "SAMAddressBar/Resources/SAMAddressBar-background@2x.png"
                    install_resource "SAMAddressBar/Resources/SAMAddressBar-reload.png"
                    install_resource "SAMAddressBar/Resources/SAMAddressBar-reload@2x.png"
                    install_resource "SAMAddressBar/Resources/SAMAddressBar-stop.png"
                    install_resource "SAMAddressBar/Resources/SAMAddressBar-stop@2x.png"
                    install_resource "SAMCategories/SAMCategories/SAMCategories.bundle"
                    install_resource "SAMHUDView/Resources/SAMHUDView-Check.png"
                    install_resource "SAMHUDView/Resources/SAMHUDView-Check@2x.png"
                    install_resource "SAMHUDView/Resources/SAMHUDView-X.png"
                    install_resource "SAMHUDView/Resources/SAMHUDView-X@2x.png"
                    install_resource "SAMWebView/Resources/SAMWebView-action-button-mini.png"
                    install_resource "SAMWebView/Resources/SAMWebView-action-button-mini@2x.png"
                    install_resource "SAMWebView/Resources/SAMWebView-action-button.png"
                    install_resource "SAMWebView/Resources/SAMWebView-action-button@2x.png"
                    install_resource "SAMWebView/Resources/SAMWebView-back-button-mini.png"
                    install_resource "SAMWebView/Resources/SAMWebView-back-button-mini@2x.png"
                    install_resource "SAMWebView/Resources/SAMWebView-back-button.png"
                    install_resource "SAMWebView/Resources/SAMWebView-back-button@2x.png"
                    install_resource "SAMWebView/Resources/SAMWebView-forward-button-mini.png"
                    install_resource "SAMWebView/Resources/SAMWebView-forward-button-mini@2x.png"
                    install_resource "SAMWebView/Resources/SAMWebView-forward-button.png"
                    install_resource "SAMWebView/Resources/SAMWebView-forward-button@2x.png"
                    install_resource "SAMWebView/Resources/SAMWebView-reload-button-mini.png"
                    install_resource "SAMWebView/Resources/SAMWebView-reload-button-mini@2x.png"
                    install_resource "SAMWebView/Resources/SAMWebView-reload-button.png"
                    install_resource "SAMWebView/Resources/SAMWebView-reload-button@2x.png"
                    install_resource "SAMWebView/Resources/SAMWebView-safari-button-mini.png"
                    install_resource "SAMWebView/Resources/SAMWebView-safari-button-mini@2x.png"
                    install_resource "SAMWebView/Resources/SAMWebView-safari-button.png"
                    install_resource "SAMWebView/Resources/SAMWebView-safari-button@2x.png"
                    install_resource "SAMWebView/Resources/SAMWebView-stop-button-mini.png"
                    install_resource "SAMWebView/Resources/SAMWebView-stop-button-mini@2x.png"
                    install_resource "SAMWebView/Resources/SAMWebView-stop-button.png"
                    install_resource "SAMWebView/Resources/SAMWebView-stop-button@2x.png"
          
rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
if [[ "${ACTION}" == "install" ]]; then
  rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${INSTALL_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
fi
rm -f "$RESOURCES_TO_COPY"

if [[ -n "${WRAPPER_EXTENSION}" ]] && [ "`xcrun --find actool`" ] && [ `find . -name '*.xcassets' | wc -l` -ne 0 ]
then
  case "${TARGETED_DEVICE_FAMILY}" in
    1,2)
      TARGET_DEVICE_ARGS="--target-device ipad --target-device iphone"
      ;;
    1)
      TARGET_DEVICE_ARGS="--target-device iphone"
      ;;
    2)
      TARGET_DEVICE_ARGS="--target-device ipad"
      ;;
    *)
      TARGET_DEVICE_ARGS="--target-device mac"
      ;;
  esac
  find "${PWD}" -name "*.xcassets" -print0 | xargs -0 actool --output-format human-readable-text --notices --warnings --platform "${PLATFORM_NAME}" --minimum-deployment-target "${IPHONEOS_DEPLOYMENT_TARGET}" ${TARGET_DEVICE_ARGS} --compress-pngs --compile "${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
fi
