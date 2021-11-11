// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "N64DeltaCore",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "N64DeltaCore",
            targets: ["N64DeltaCore", "N64Bridge", "N64Swift", "Mupen64Plus", "Mupen64Plus_RSP", "Mupen64Plus_Video"]
        )
    ],
    dependencies: [
        .package(name: "DeltaCore", url: "https://github.com/rileytestut/DeltaCore.git", .branch("main"))
    ],
    targets: [
        .target(
            name: "N64DeltaCore",
            dependencies: ["DeltaCore", "N64Bridge", "Mupen64Plus", "Mupen64Plus_RSP", "Mupen64Plus_Video"],
            path: "N64DeltaCore",
            exclude: [
                "N64DeltaCore.h",
                "Info.plist",
                
                "Bridge",
                "Types",
                
                "Controller Skin/info.json",
                "Controller Skin/iphone_portrait.pdf",
                "Controller Skin/iphone_landscape.pdf",
                "Controller Skin/iphone_edgetoedge_portrait.pdf",
                "Controller Skin/iphone_edgetoedge_landscape.pdf"
            ],
            sources: ["N64.swift"],
            resources: [
                .copy("Controller Skin/Standard.deltaskin"),
                .copy("Standard.deltamapping")
            ]
        ),
        .target(
            name: "N64Bridge",
            dependencies: ["DeltaCore", "N64Swift", "Mupen64Plus"],
            path: "N64DeltaCore/Bridge",
            publicHeadersPath: "",
            cSettings: [
                .headerSearchPath("../../libMupen64Plus/SDL"),
                .headerSearchPath("../../Mupen64Plus/mupen64plus-core/src"),
                //.headerSearchPath("../../Mupen64Plus/mupen64plus-core/src/api"),
                .headerSearchPath("../../Mupen64Plus/mupen64plus-core/src/osd"),
                .headerSearchPath("../../Mupen64Plus/mupen64plus-core/subprojects/**"),
                //.headerSearchPath("../../Mupen64Plus/mupen64plus-core/GLideN64/src"),
                .unsafeFlags(["-fmodules", "-fcxx-modules"])
            ]
        ),
        .target(
            name: "N64Swift",
            dependencies: ["DeltaCore"],
            path: "N64DeltaCore/N64Swift"
        ),
        .target(
            name: "Mupen64Plus",
            dependencies: [],
            path: "",
            exclude: [
                "Mupen64Plus/mupen64plus-core/src/backends/opencv_video_capture.cpp",
                "Mupen64Plus/mupen64plus-core/src/api/vidext.c",
                "Mupen64Plus/mupen64plus-core/src/device/r4300/x86",
                "Mupen64Plus/mupen64plus-core/src/device/r4300/x86_64",
                "Mupen64Plus/mupen64plus-core/src/device/r4300/new_dynarec",
                "Mupen64Plus/mupen64plus-core/src/device/r4300/instr_counters.c",
                "Mupen64Plus/mupen64plus-core/src/device/r4300/recomp.c",
                
                "Mupen64Plus/mupen64plus-core/src/main/eventloop.c",
                "Mupen64Plus/mupen64plus-core/src/main/screenshot.c",
                "Mupen64Plus/mupen64plus-core/src/main/profile.c",
                "Mupen64Plus/mupen64plus-core/src/main/main.c",
            ],
            sources: [
                "libMupen64Plus/SDL",
                "Mupen64Plus/mupen64plus-core/src/backends",
                "Mupen64Plus/mupen64plus-core/src/api",
                "Mupen64Plus/mupen64plus-core/src/device",
                "Mupen64Plus/mupen64plus-core/src/main",
                "Mupen64Plus/mupen64plus-core/src/plugin",

                "Mupen64Plus/mupen64plus-core/src/osal/files_macos.c"
                
                //"Mupen64Plus/mupen64plus-core/src/backends/api/video_capture_backend.c",
                //"Mupen64Plus/mupen64plus-core/src/device/dd/dd_controller.c",
                //"Mupen64Plus/mupen64plus-core/src/device/controllers/paks/biopak.c",
                //"Mupen64Plus/mupen64plus-core/src/backends/dummy_video_capture.c",
            ],
            cSettings: [
                .headerSearchPath("libMupen64Plus/SDL"),
                .headerSearchPath("Mupen64Plus/mupen64plus-core/src"),
                .headerSearchPath("Mupen64Plus/mupen64plus-core/subprojects/**"),
                
                .define("__unix__", to: "1"),
                .define("M64P_PARALLEL", to: "1"),
                .define("IN_OPENEMU", to: "1"),
                .define("NO_ASM", to: "1"),
                .define("M64P_CORE_PROTOTYPES", to: "1"),
                .define("NDEBUG", to: "1"),
                .define("PIC", to: "1"),
                .define("USE_GLES", to: "1"),
                .define("GCC", to: "1"),
                
                .unsafeFlags([
//                    "-flto",
                    "-fomit-frame-pointer",
                    "-fno-strict-aliasing",
                    "-fvisibility=hidden",
                    "-pthread",
                    "-fPIC",
                    "-ffast-math"
                ]),
            ]
        ),
        .target(
            name: "Mupen64Plus_RSP",
            dependencies: [],
            path: "N64DeltaCore-RSP",
            exclude: [
                "N64DeltaCore_RSP.h",
                "Info.plist",
                
                "mupen64plus-rsp-hle/INSTALL",
                "mupen64plus-rsp-hle/LICENSES",
                "mupen64plus-rsp-hle/projects",
                "mupen64plus-rsp-hle/RELEASE",
                
                "mupen64plus-rsp-hle/src/osal_dynamiclib_unix.c",
                "mupen64plus-rsp-hle/src/osal_dynamiclib_win32.c",
                "mupen64plus-rsp-hle/src/plugin.c"
            ],
            sources: [
                "plugin_delta.c",
                "mupen64plus-rsp-hle/src",
            ],
            cSettings: [
                .headerSearchPath("mupen64plus-rsp-hle/src"),
                .headerSearchPath("../Mupen64Plus/mupen64plus-core/src/api"),
//                .headerSearchPath("Mupen64Plus/mupen64plus-core/subprojects/**"),
                
                .define("__unix__", to: "1"),
//                .define("M64P_PARALLEL", to: "1"),
//                .define("IN_OPENEMU", to: "1"),
//                .define("NO_ASM", to: "1"),
//                .define("M64P_CORE_PROTOTYPES", to: "1"),
//                .define("NDEBUG", to: "1"),
//                .define("PIC", to: "1"),
//                .define("USE_GLES", to: "1"),
                .define("GCC", to: "1"),
                
                .unsafeFlags([
//                    "-flto",
//                    "-fomit-frame-pointer",
                    "-fno-strict-aliasing",
//                    "-fvisibility=hidden",
                    "-pthread",
                    "-fPIC",
                    "-ffast-math"
                ]),
            ]
        ),
        .target(
            name: "Mupen64Plus_Video",
            dependencies: [],
            path: "N64DeltaCore-Video",
            exclude: [
                "N64DeltaCore_Video.h",
                "Info.plist",
                
                // Other GLIDEN64 Files
                
                "GLideN64/src/windows",
                "GLideN64/src/Neon",
                "GLideN64/src/Graphics/OpenGLContext/windows",
                "GLideN64/src/Graphics/OpenGLContext/GraphicBuffer",
                "GLideN64/src/Graphics/OpenGLContext/opengl_ColorBufferReaderWithEGLImage.cpp",
                
                "GLideN64/src/GLideNUI",
                
                "GLideN64/src/GLideNHQ/test",
                "GLideN64/src/GLideNHQ/bldno.cpp",
                "GLideN64/src/GLideNHQ/Ext_TxFilter.cpp",
                "GLideN64/src/GLideNHQ/TxDbg.cpp",

//                "GLideN64/src/windows",
//                "GLideN64/src/windows",
//                "GLideN64/src/windows",
                
                "GLideN64/src/osal/osal_files_unix.c",
                "GLideN64/src/osal/osal_files_win32.c",
                
                "GLideN64/src/CRC32_ARMV8.cpp",
                "GLideN64/src/CRC32.cpp",
                "GLideN64/src/iob.cpp",
                "GLideN64/src/Log_android.cpp",
                "GLideN64/src/Log.cpp",
                "GLideN64/src/RSP_LoadMatrixX86.cpp",
                "GLideN64/src/TextDrawer.cpp",
                "GLideN64/src/TxFilterStub.cpp",
                "GLideN64/src/ZilmarPluginAPI.cpp",
                
                "GLideN64/src/CommonPluginAPI.cpp",
                "GLideN64/src/MupenPlusPluginAPI.cpp",
                "GLideN64/src/MupenPlusAPIImpl.cpp",
                "GLideN64/src/CommonAPIImpl_mupenplus.cpp",
                "GLideN64/src/Config_mupenplus.cpp"
                
//                "mupen64plus-rsp-hle/LICENSES",
//                "mupen64plus-rsp-hle/projects",
//                "mupen64plus-rsp-hle/RELEASE",
//
//                "mupen64plus-rsp-hle/src/osal_dynamiclib_unix.c",
//                "mupen64plus-rsp-hle/src/osal_dynamiclib_win32.c",
//                "mupen64plus-rsp-hle/src/plugin.c"
            ],
            sources: [
                "plugin_delta.c",
                "TxDbg_ios.mm",
                "GLideN64/src",
                
                "libpng/png.c",
                "libpng/pngerror.c",
                "libpng/pngget.c",
                "libpng/pngmem.c",
                "libpng/pngpread.c",
                "libpng/pngread.c",
                "libpng/pngrio.c",
                "libpng/pngrtran.c",
                "libpng/pngrutil.c",
                "libpng/pngset.c",
                "libpng/pngtest.c",
                "libpng/pngtrans.c",
                "libpng/pngwio.c",
                "libpng/pngwrite.c",
                "libpng/pngwtran.c",
                "libpng/pngwutil.c"
            ],
            cSettings: [
                .headerSearchPath("GLideN64/src"),
                .headerSearchPath("GLideN64/src/inc"),
                .headerSearchPath("GLideN64/src/osal"),
                .headerSearchPath("GLideN64/src/GLideNHQ"),
                .headerSearchPath("GLideN64/src/GLideNHQ/inc"),
                .headerSearchPath("../Mupen64Plus/mupen64plus-core/src/api"),
                .headerSearchPath("../Mupen64Plus/libpng"),
                
                .define("__unix__", to: "1"),
                .define("GCC", to: "1"),
                .define("MUPENPLUSAPI", to: "1"),
                .define("TXFILTER_LIB", to: "1"),
                .define("OS_IOS", to: "1"),
                .define("GLESX", to: "1"),
                .define("GL_ERROR_DEBUG", to: "1"),
                .define("GL_DEBUG", to: "1"),
                .define("__VEC4_OPT", to: "1"),
                .define("PNG_ARM_NEON_OPT", to: "0"),
                
                .unsafeFlags([
//                    "-flto",
//                    "-fomit-frame-pointer",
                    "-fno-strict-aliasing",
//                    "-fvisibility=hidden",
                    "-pthread",
                    "-fPIC",
                    "-ffast-math",
                    "-mfpu=neon"
                ]),
            ]
        )
    ],
    cxxLanguageStandard: .cxx11
)
