#
# Build LowLevelAABB common
#

SET(LLAABB_DIR ${PHYSX_SOURCE_DIR}/LowLevelAABB)

SET(LLAABB_HEADERS		
	${LLAABB_DIR}/include/BpAABBManagerTasks.h
	${LLAABB_DIR}/include/BpBroadPhase.h
	${LLAABB_DIR}/include/BpBroadPhaseUpdate.h
	${LLAABB_DIR}/include/BpSimpleAABBManager.h
)
SOURCE_GROUP("includes" FILES ${LLAABB_HEADERS})

SET(LLAABB_SOURCE	
	${LLAABB_DIR}/src/BpBroadPhase.cpp
	${LLAABB_DIR}/src/BpBroadPhaseMBP.cpp
	${LLAABB_DIR}/src/BpBroadPhaseMBP.h
	${LLAABB_DIR}/src/BpBroadPhaseMBPCommon.h
	${LLAABB_DIR}/src/BpBroadPhaseSap.cpp
	${LLAABB_DIR}/src/BpBroadPhaseSap.h
	${LLAABB_DIR}/src/BpBroadPhaseSapAux.cpp
	${LLAABB_DIR}/src/BpBroadPhaseSapAux.h
	${LLAABB_DIR}/src/BpMBPTasks.cpp
	${LLAABB_DIR}/src/BpMBPTasks.h
	${LLAABB_DIR}/src/BpSAPTasks.cpp
	${LLAABB_DIR}/src/BpSAPTasks.h
	${LLAABB_DIR}/src/BpSimpleAABBManager.cpp
)
SOURCE_GROUP("src" FILES ${LLAABB_SOURCE})

ADD_LIBRARY(LowLevelAABB ${LOWLEVELAABB_LIBTYPE}
	${LLAABB_HEADERS}
	${LLAABB_SOURCE}
)

TARGET_INCLUDE_DIRECTORIES(LowLevelAABB 
	PRIVATE ${LOWLEVELAABB_PLATFORM_INCLUDES}
	PRIVATE ${PXSHARED_ROOT_DIR}/include
	PRIVATE ${PXSHARED_ROOT_DIR}/src/foundation/include
	PRIVATE ${PXSHARED_ROOT_DIR}/src/fastxml/include
	PRIVATE ${PXSHARED_ROOT_DIR}/src/pvd/include

	PRIVATE ${PHYSX_ROOT_DIR}/Include
	PRIVATE ${PHYSX_ROOT_DIR}/Include/common
	PRIVATE ${PHYSX_ROOT_DIR}/Include/geometry
	PRIVATE ${PHYSX_ROOT_DIR}/Include/GeomUtils

	PRIVATE ${PHYSX_SOURCE_DIR}/Common/include
	PRIVATE ${PHYSX_SOURCE_DIR}/Common/src
	
	PRIVATE ${PHYSX_SOURCE_DIR}/GeomUtils/headers
	PRIVATE ${PHYSX_SOURCE_DIR}/GeomUtils/src
	
	PRIVATE ${PHYSX_SOURCE_DIR}/LowLevel/API/include
	PRIVATE ${PHYSX_SOURCE_DIR}/LowLevel/common/include/utils
	PRIVATE ${PHYSX_SOURCE_DIR}/LowLevel/common/include/pipeline
	PRIVATE ${PHYSX_SOURCE_DIR}/LowLevelAABB/include
	PRIVATE ${PHYSX_SOURCE_DIR}/LowLevelAABB/src
)

TARGET_COMPILE_DEFINITIONS(LowLevelAABB 
	PRIVATE ${LOWLEVELAABB_COMPILE_DEFS}
)

IF(NOT ${LOWLEVELAABB_LIBTYPE} STREQUAL "OBJECT")
	SET_TARGET_PROPERTIES(LowLevelAABB PROPERTIES 
		COMPILE_PDB_NAME_DEBUG "LowLevelAABB${CMAKE_DEBUG_POSTFIX}"
		COMPILE_PDB_NAME_CHECKED "LowLevelAABB${CMAKE_CHECKED_POSTFIX}"
		COMPILE_PDB_NAME_PROFILE "LowLevelAABB${CMAKE_PROFILE_POSTFIX}"
		COMPILE_PDB_NAME_RELEASE "LowLevelAABB${CMAKE_RELEASE_POSTFIX}"
	)
ENDIF()
