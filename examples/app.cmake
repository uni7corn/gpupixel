# Detect platform
# ------
IF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
    SET(CURRENT_OS "linux")
ELSEIF(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
    SET(CURRENT_OS "windows")
ELSEIF(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
	SET(CURRENT_OS "macos")
ELSEIF(${CMAKE_SYSTEM_NAME} MATCHES "iOS")
	SET(CURRENT_OS "ios")
ELSEIF(${CMAKE_SYSTEM_NAME} MATCHES "Android")
	SET(CURRENT_OS "android")
ELSE()
    MESSAGE(FATAL_ERROR "NOT SUPPORT THIS SYSTEM")
ENDIF()

# Config build output path
# ------
SET(OUTPUT_INSTALL_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../output")
SET(CMAKE_INCLUDE_OUTPUT_DIRECTORY "${OUTPUT_INSTALL_PATH}/include")
SET(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${OUTPUT_INSTALL_PATH}/library/${CURRENT_OS}")
SET(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${OUTPUT_INSTALL_PATH}/library/${CURRENT_OS}")
SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${OUTPUT_INSTALL_PATH}/app/${CURRENT_OS}")
SET(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG   ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}/debug)
SET(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG   ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/debug)
SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG   ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/debug)
SET(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}/release)
SET(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/release)
SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/release)

IF(BUILD_DEBUG)
	SET(CMAKE_BUILD_TYPE Debug)
	LINK_DIRECTORIES(${CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG})
	SET(APP_RESOURCE_DIR ${CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG})
	FIlE(GLOB GPUPIXEL_LIBS ${CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG}/*)
	set(COPY_DST_TUNTIME_DIR ${CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG})
ELSE()
	SET(CMAKE_BUILD_TYPE Release)
	LINK_DIRECTORIES(${CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE})
	SET(APP_RESOURCE_DIR ${CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE})
	FIlE(GLOB GPUPIXEL_LIBS ${CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE}/*)
	set(COPY_DST_TUNTIME_DIR ${CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE})
ENDIF(BUILD_DEBUG)

 
# Config source and header file
# -------
# header include path
INCLUDE_DIRECTORIES(
	${CMAKE_INCLUDE_OUTPUT_DIRECTORY}
	${CMAKE_CURRENT_SOURCE_DIR}/../src/third_party/glfw/include
	${CMAKE_CURRENT_SOURCE_DIR}/../src/third_party/stb
	${CMAKE_CURRENT_SOURCE_DIR}/../src/third_party/glad/include
)
 
# Add common source file
FILE(GLOB SOURCE_FILES 
	"${CMAKE_CURRENT_SOURCE_DIR}/desktop/*" 
	)
 

# Add platform source and header and lib link search path
IF(${CURRENT_OS} STREQUAL "windows") 														# windows
	# link libs find path
	LINK_DIRECTORIES( 
		${CMAKE_CURRENT_SOURCE_DIR}/../src/third_party/glfw/lib-mingw-w64)
ELSEIF(${CURRENT_OS} STREQUAL "linux")	
	# # Source 
	# FILE(GLOB GLAD_SOURCE_FILE  "${CMAKE_CURRENT_SOURCE_DIR}/third_party/glad/src/*.c" )
	# list(APPEND SOURCE_FILES ${GLAD_SOURCE_FILE})
ENDIF()

# build type: executable
# ------
ADD_EXECUTABLE(${PROJECT_NAME} ${SOURCE_FILES})
 
# link libs
# -------
IF(${CURRENT_OS} STREQUAL "linux")
	TARGET_LINK_LIBRARIES(${PROJECT_NAME} 
						gpupixel
						GL
						glfw)
ELSEIF(${CURRENT_OS} STREQUAL "windows")
	TARGET_LINK_LIBRARIES(${PROJECT_NAME} 
						gpupixel
						opengl32
						glfw3)
ENDIF()

# copy resource file
# --------
# Add resource file
FILE(GLOB RESOURCE_FILES 
	"${CMAKE_CURRENT_SOURCE_DIR}/../src/resources/*"
	"${CMAKE_CURRENT_SOURCE_DIR}/../src/third_party/vnn/models/vnn_face278_data/face_pc[1.0.0].vnnmodel"           
)
FIlE(GLOB VNN_LIBS 
	${CMAKE_CURRENT_SOURCE_DIR}/../src/third_party/vnn/libs/${CURRENT_OS}/x64/*
)

MACRO(EXPORT_INCLUDE)
ADD_CUSTOM_COMMAND(TARGET ${PROJECT_NAME} PRE_BUILD 
				COMMAND ${CMAKE_COMMAND} -E copy 
				${RESOURCE_FILES} ${APP_RESOURCE_DIR}
				COMMENT "Copying resource files to output/app directory.")

# copy gpupixel and vnn lib
ADD_CUSTOM_COMMAND(TARGET ${PROJECT_NAME} POST_BUILD
				COMMAND ${CMAKE_COMMAND} -E copy_if_different
				${VNN_LIBS} ${COPY_DST_TUNTIME_DIR}
				COMMAND ${CMAKE_COMMAND} -E copy_if_different
				${GPUPIXEL_LIBS} ${COPY_DST_TUNTIME_DIR})
ENDMACRO()
EXPORT_INCLUDE()
