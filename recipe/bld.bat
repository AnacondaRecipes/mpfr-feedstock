xcopy /s %RECIPE_DIR%\win_build\* .

mkdir build
cd build

cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=%PREFIX%/Library -DRUN_TESTS=ON ..
cmake --build .
cmake --install .

:: All just import libs under different names for backwards compatibility.
copy %LIBRARY_BIN%\libmpfr-%LIB_MAJOR_VERSION%.dll %LIBRARY_BIN%\libmpfr.dll
copy %LIBRARY_BIN%\libmpfr-%LIB_MAJOR_VERSION%.dll %LIBRARY_BIN%\mpfr.dll
copy %LIBRARY_LIB%\libmpfr-%LIB_MAJOR_VERSION%.lib %LIBRARY_LIB%\mpfr.lib
copy %LIBRARY_LIB%\libmpfr-%LIB_MAJOR_VERSION%.lib %LIBRARY_LIB%\libmpfr.lib
copy %LIBRARY_LIB%\libmpfr-%LIB_MAJOR_VERSION%.lib %LIBRARY_LIB%\libmpfr.dll.a
