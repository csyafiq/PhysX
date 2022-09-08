project "Dare"
   kind "StaticLib"
   language "C++"
   cppdialect "C++20"
   targetdir "bin/%{cfg.buildcfg}"
   staticruntime "off"

   pchheader "depch.h"
   pchsource "src/depch.cpp"
   files { "src/**.h", "src/**.hpp", "src/**.cpp", "**.hint" }
   editAndContinue "Off"
   flags { "MultiProcessorCompile" }

   includedirs
   {
      "../dependencies/assimp",
      "../dependencies/assimp/include",
      "../dependencies/assimp/include/assimp",
      "../dependencies/ENTT/include",
      "../dependencies/fmodcore/lib/x64",
      "../dependencies/glfw/include",
      "../dependencies/imgui",
      "../dependencies/ImGuizmo",
      "../dependencies/rapidjson/include",
      "../dependencies/stb_image",
      "../dependencies/tinyddsloader",
      "../dependencies/tinyobjloader",
      "../dependencies/Tracy/public",
      "../dependencies/spdlog/include",
      "../dependencies/mono/include/mono-2.0",
      "../dependencies/PhysX",
      "../dependencies/PhysX/include",
      "../dependencies/rttr/src",
      "../dependencies/rttr/build/src",
      "../dependencies/yaml-cpp",
      "../dependencies/yaml-cpp/include",
      "../dependencies/rapidjson/include/rapidjson",
      "src",

      "%{IncludeDir.VulkanSDK}",
      "%{IncludeDir.glm}",
   }

   links
   {
       "ImGui",
       "GLFW",
       "yaml-cpp",

       "%{Library.Vulkan}",
   }

   targetdir ("bin/" .. outputdir .. "/%{prj.name}")
   objdir ("../bin-int/" .. outputdir .. "/%{prj.name}")

   filter "system:windows"
      systemversion "latest"
      defines { "DARE_PLATFORM_WINDOWS" }

   filter "configurations:Debug"
      defines { "DARE_DEBUG", "DARE_VULKAN" }
      runtime "Debug"
      symbols "On"
      links
      {
         "../dependencies/fmodcore/lib/x64/fmodL_vc.lib",
         "../dependencies/mono/lib/mono-2.0-sgen.lib",
         "../dependencies/rttr/build/lib/Debug/rttr_core_d.lib",
         "../dependencies/PhysX/lib/debug/PhysX_static_64.lib",
         "../dependencies/PhysX/lib/debug/PhysXCharacterKinematic_static_64.lib",
         "../dependencies/PhysX/lib/debug/PhysXCommon_static_64.lib",
         "../dependencies/PhysX/lib/debug/PhysXCooking_static_64.lib",
         "../dependencies/PhysX/lib/debug/PhysXExtensions_static_64.lib",
         "../dependencies/PhysX/lib/debug/PhysXFoundation_static_64.lib",
         "../dependencies/PhysX/lib/debug/PhysXPvdSDK_static_64.lib"
      }


   filter "configurations:Release"
      defines { "DARE_RELEASE", "DARE_VULKAN" }
      runtime "Release"
      optimize "On"
      symbols "On"
      links
      {
         "../dependencies/fmodcore/lib/x64/fmod_vc.lib",
          "../dependencies/mono/lib/mono-2.0-sgen.lib",
          "../dependencies/rttr/build/lib/Release/rttr_core_d.lib",
          "../dependencies/PhysX/lib/release/PhysX_static_64.lib",
          "../dependencies/PhysX/lib/release/PhysXCharacterKinematic_static_64.lib",
          "../dependencies/PhysX/lib/release/PhysXCommon_static_64.lib",
          "../dependencies/PhysX/lib/release/PhysXCooking_static_64.lib",
          "../dependencies/PhysX/lib/release/PhysXExtensions_static_64.lib",
          "../dependencies/PhysX/lib/release/PhysXFoundation_static_64.lib",
          "../dependencies/PhysX/lib/release/PhysXPvdSDK_static_64.lib"
      }

   filter "configurations:Dist"
      defines { "DARE_DIST", "DARE_VULKAN" }
      runtime "Release"
      optimize "On"
      symbols "Off"
      links
      {
         "../dependencies/fmodcore/lib/x64/fmod_vc.lib",
         "../dependencies/mono/lib/mono-2.0-sgen.lib",
         "../dependencies/rttr/build/lib/Release/rttr_core_d.lib",
         "../dependencies/PhysX/lib/release/PhysX_static_64.lib",
         "../dependencies/PhysX/lib/release/PhysXCharacterKinematic_static_64.lib",
         "../dependencies/PhysX/lib/release/PhysXCommon_static_64.lib",
         "../dependencies/PhysX/lib/release/PhysXCooking_static_64.lib",
         "../dependencies/PhysX/lib/release/PhysXExtensions_static_64.lib",
         "../dependencies/PhysX/lib/release/PhysXFoundation_static_64.lib",
         "../dependencies/PhysX/lib/release/PhysXPvdSDK_static_64.lib"
      }