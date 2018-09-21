# Install script for directory: C:/Users/Duarte/Desktop/json-c-master/json-c-master

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/json-c")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Duarte/Desktop/json-c-master/json-c-master/Debug/json-c.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Duarte/Desktop/json-c-master/json-c-master/Release/json-c.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Duarte/Desktop/json-c-master/json-c-master/MinSizeRel/json-c.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Duarte/Desktop/json-c-master/json-c-master/RelWithDebInfo/json-c.lib")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "C:/Program Files (x86)/json-c/include/json-c/config.h;C:/Program Files (x86)/json-c/include/json-c/json_config.h;C:/Program Files (x86)/json-c/include/json-c/json.h;C:/Program Files (x86)/json-c/include/json-c/arraylist.h;C:/Program Files (x86)/json-c/include/json-c/debug.h;C:/Program Files (x86)/json-c/include/json-c/json_c_version.h;C:/Program Files (x86)/json-c/include/json-c/json_inttypes.h;C:/Program Files (x86)/json-c/include/json-c/json_object.h;C:/Program Files (x86)/json-c/include/json-c/json_object_iterator.h;C:/Program Files (x86)/json-c/include/json-c/json_pointer.h;C:/Program Files (x86)/json-c/include/json-c/json_tokener.h;C:/Program Files (x86)/json-c/include/json-c/json_util.h;C:/Program Files (x86)/json-c/include/json-c/linkhash.h;C:/Program Files (x86)/json-c/include/json-c/printbuf.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "C:/Program Files (x86)/json-c/include/json-c" TYPE FILE FILES
    "C:/Users/Duarte/Desktop/json-c-master/json-c-master/config.h"
    "C:/Users/Duarte/Desktop/json-c-master/json-c-master/json_config.h"
    "C:/Users/Duarte/Desktop/json-c-master/json-c-master/json.h"
    "C:/Users/Duarte/Desktop/json-c-master/json-c-master/arraylist.h"
    "C:/Users/Duarte/Desktop/json-c-master/json-c-master/debug.h"
    "C:/Users/Duarte/Desktop/json-c-master/json-c-master/json_c_version.h"
    "C:/Users/Duarte/Desktop/json-c-master/json-c-master/json_inttypes.h"
    "C:/Users/Duarte/Desktop/json-c-master/json-c-master/json_object.h"
    "C:/Users/Duarte/Desktop/json-c-master/json-c-master/json_object_iterator.h"
    "C:/Users/Duarte/Desktop/json-c-master/json-c-master/json_pointer.h"
    "C:/Users/Duarte/Desktop/json-c-master/json-c-master/json_tokener.h"
    "C:/Users/Duarte/Desktop/json-c-master/json-c-master/json_util.h"
    "C:/Users/Duarte/Desktop/json-c-master/json-c-master/linkhash.h"
    "C:/Users/Duarte/Desktop/json-c-master/json-c-master/printbuf.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "C:/Users/Duarte/Desktop/json-c-master/json-c-master/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
