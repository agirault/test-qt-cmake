cmake_minimum_required(VERSION 3.15 FATAL_ERROR)
set (CMAKE_FIND_PACKAGE_NO_PACKAGE_REGISTRY 1)
set (CMAKE_FIND_ROOT_PATH_MODE_PACKAGE BOTH)

project(test-qt-cmake-quickcontrols2 VERSION 0.1)

find_package(Qt5 5.14
  CONFIG
  REQUIRED
  COMPONENTS QuickControls2 QmlImportScanner
  )

set(CMAKE_AUTORCC ON)

add_executable(${PROJECT_NAME} main.cpp qml.qrc)

target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::QuickControls2)

qt5_import_qml_plugins(${PROJECT_NAME})

set_target_properties(${PROJECT_NAME} PROPERTIES
  MACOSX_BUNDLE TRUE
  MACOSX_BUNDLE_NAME "${PROJECT_NAME}" #CFBundleName and CFBundleExecutable
  MACOSX_BUNDLE_GUI_IDENTIFIER "com.kitware.${EXECUTABLE_NAME}" #CFBundleIdentifier
  MACOSX_BUNDLE_SHORT_VERSION_STRING "${PROJECT_VERSION}" #CFBundleShortVersionString
  MACOSX_BUNDLE_BUNDLE_VERSION "${PROJECT_VERSION}" #CFBundleVersion
  XCODE_ATTRIBUTE_CODE_SIGNING_ALLOWED "NO"
  )