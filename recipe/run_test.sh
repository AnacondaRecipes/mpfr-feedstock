if [[ $(uname) == Darwin ]]; then
  export CONDA_BUILD_SYSROOT=${CONDA_BUILD_SYSROOT:-/opt/MacOSX10.9.sdk}
fi
${CC} ${CFLAGS} ${LDFLAGS} -Wl,-rpath,"${PREFIX}"/lib -lmpfr -lgmp "${RECIPE_DIR}"/test.c -o test_exe
./test_exe
