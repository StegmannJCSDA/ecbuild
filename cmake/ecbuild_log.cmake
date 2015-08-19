set(ECBUILD_DEBUG    10)
set(ECBUILD_INFO     20)
set(ECBUILD_WARN     30)
set(ECBUILD_ERROR    40)
set(ECBUILD_CRITICAL 50)

if( NOT DEFINED ECBUILD_LOG_LEVEL )
  set(ECBUILD_LOG_LEVEL ${ECBUILD_WARN})
elseif( ECBUILD_LOG_LEVEL STREQUAL "DEBUG" )
  set(ECBUILD_LOG_LEVEL ${ECBUILD_DEBUG})
elseif( ECBUILD_LOG_LEVEL STREQUAL "INFO" )
  set(ECBUILD_LOG_LEVEL ${ECBUILD_INFO})
elseif( ECBUILD_LOG_LEVEL STREQUAL "WARN" )
  set(ECBUILD_LOG_LEVEL ${ECBUILD_WARN})
elseif( ECBUILD_LOG_LEVEL STREQUAL "ERROR" )
  set(ECBUILD_LOG_LEVEL ${ECBUILD_ERROR})
elseif( ECBUILD_LOG_LEVEL STREQUAL "CRITICAL" )
  set(ECBUILD_LOG_LEVEL ${ECBUILD_CRITICAL})
else()
  message(WARNING "Unknown log level ${ECBUILD_LOG_LEVEL} (valid are DEBUG, INFO, WARN, ERROR, CRITICAL) - using WARN")
  set(ECBUILD_LOG_LEVEL ${ECBUILD_WARN})
endif()

macro( ecbuild_debug MSG )
  if( ECBUILD_LOG_LEVEL LESS 11)
    message(STATUS "DEBUG - ${MSG}")
  endif()
endmacro( ecbuild_debug )

macro( ecbuild_info MSG )
  if( ECBUILD_LOG_LEVEL LESS 21)
    message(STATUS "INFO - ${MSG}")
  endif()
endmacro( ecbuild_info )

macro( ecbuild_warn MSG )
  if( ECBUILD_LOG_LEVEL LESS 31)
    message(WARNING "WARN - ${MSG}")
  endif()
endmacro( ecbuild_warn )

macro( ecbuild_error MSG )
  if( ECBUILD_LOG_LEVEL LESS 41)
    message(SEND_ERROR "ERROR - ${MSG}")
  endif()
endmacro( ecbuild_error )

macro( ecbuild_critical MSG )
  if( ECBUILD_LOG_LEVEL LESS 51)
    message(FATAL_ERROR "CRITICAL - ${MSG}")
  endif()
endmacro( ecbuild_critical )