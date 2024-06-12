mkdir build && cd build

REM Remove dot from PY_VER for use in library name
REM From https://github.com/tpaviot/pythonocc-core/blob/master/ci/conda/bld.bat
set MY_PY_VER=%PY_VER:.=%

set LIBXML2="%LIBRARY_PREFIX%/lib/libxml2.lib"

cmake -G "Ninja" ^
 -D SCHEMA_VERSIONS="2x3;4;4x1;4x3;4x3_add2" ^
 -D CMAKE_BUILD_TYPE:STRING=Release ^
 -D CMAKE_INSTALL_PREFIX:FILEPATH="%LIBRARY_PREFIX%" ^
 -D CMAKE_PREFIX_PATH:FILEPATH="%LIBRARY_PREFIX%" ^
 -D CMAKE_SYSTEM_PREFIX_PATH:FILEPATH="%LIBRARY_PREFIX%" ^
 -D OCC_INCLUDE_DIR:FILEPATH="%LIBRARY_PREFIX%\include\opencascade" ^
 -D OCC_LIBRARY_DIR:FILEPATH="%LIBRARY_PREFIX%\lib" ^
 -D CGAL_INCLUDE_DIR:FILEPATH="%LIBRARY_PREFIX%\include" ^
 -D EIGEN_DIR:FILEPATH="%LIBRARY_PREFIX%\include\eigen3" ^
 -D LIBXML2_INCLUDE_DIR=%LIBRARY_PREFIX%/include/libxml2 ^
 -D LIBXML2_LIBRARIES=%LIBRARY_PREFIX%/lib/libxml2.lib ^
 -D GMP_INCLUDE_DIR:FILEPATH="%LIBRARY_PREFIX%\include" ^
 -D GMP_LIBRARY_DIR:FILEPATH="%LIBRARY_PREFIX%\lib" ^
 -D MPFR_LIBRARY_DIR:FILEPATH="%LIBRARY_PREFIX%\lib" ^
 -D COLLADA_SUPPORT=OFF ^
 -D HDF5_SUPPORT=ON ^
 -D HDF5_INCLUDE_DIR="%LIBRARY_PREFIX%\include" ^
 -D HDF5_LIBRARY_DIR="%LIBRARY_PREFIX%\lib" ^
 -D JSON_INCLUDE_DIR="%LIBRARY_PREFIX%\include" ^
 -D PYTHON_INCLUDE_DIR=%PREFIX%\include ^
 -D PYTHON_EXECUTABLE:FILEPATH=%PREFIX%\python.exe ^
 -D PYTHON_LIBRARY:FILEPATH="%PREFIX%"\libs/python%MY_PY_VER%.lib ^
 -D BUILD_IFCPYTHON=ON ^
 -D BUILD_IFCGEOM=ON ^
 -D COLLADA_SUPPORT:BOOL=OFF ^
 -D BUILD_EXAMPLES:BOOL=OFF ^
 -D BUILD_GEOMSERVER:BOOL=OFF ^
 -D GLTF_SUPPORT:BOOL=ON ^
 -D BUILD_CONVERT:BOOL=ON ^
 -D BUILD_IFCMAX:BOOL=OFF ^
 -D IFCXML_SUPPORT:BOOL=ON ^
 -D Boost_LIBRARY_DIR:FILEPATH="%LIBRARY_PREFIX%\lib" ^
 -D Boost_INCLUDE_DIR:FILEPATH="%LIBRARY_PREFIX%\include" ^
 -D Boost_USE_STATIC_LIBS:BOOL=OFF ^
 -D CITYJSON_SUPPORT:BOOL=OFF ^
 ../cmake
 
if errorlevel 1 exit 1

ninja install

if errorlevel 1 exit 1
