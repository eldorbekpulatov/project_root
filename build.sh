#!/usr/bin/env bash
#
# © 2018-2019 Konstantin Gredeskoul, All Rights Reserved.
# MIT License
#
# WARNING: This BASH script is completely optional. You don't need it to build this project.
#
# If you choose to run this script to build the project, run:
#
#     $ ./build-and-run
#
# It will clean, build and run the tests.
#


export ProjectRoot=$(pwd)
export BuildDir="${ProjectRoot}/build"

[[ -z $(which git) ]] && {
  echo "Please install git first."
  exit 1
}

[[ -z $(which gcc) || -z $(which clang) ]] && {
  echo "Please install GCC or CLANG first."
  exit 1
}

[[ -z $(which cmake) ]] && {
  echo "Please install CMAKE first."
  exit 1
}


clean (){
  clear # clear out the screen
  echo ===========================================================================
  echo "CLEAN: Cleaning the output folders"
  echo ===========================================================================
  local directory_paths=(
    "./bld/"
    "./bin/"
    "./lib/"
    "./doc/"
    "./cov/"
    "./include/"
  )

  for directory_path in "${directory_paths[@]}"; do
    # Check if the file exists
    if [ -d "$directory_path" ]; then  
      rm -rf "$directory_path"
      echo "Removed $directory_path"
    else
      echo "Doesn't exist: $directory_path"
    fi
  done
}

header(){
  echo ===========================================================================
  echo "HEADER: A Project with Tests"
  echo ===========================================================================
  echo GCC: "$(gcc --version 2>&1 | head -n 1)"
  echo CLANG: "$(clang --version 2>&1 | head -n 1)"
  echo CMAKE: "$(cmake --version 2>&1 | head -n 1)"
  echo GIT: "$(git --version 2>&1)"
}

setup() {
  echo ===========================================================================
  echo "SETUP: Installing Test Framework"
  echo ===========================================================================
  # install google test library 
  if [[ ! -f "${ProjectRoot}/test/lib/googletest/CMakeLists.txt" ]]
  then
    echo "Cloning googletest -b v1.14.x ..."
    rm -rf "${ProjectRoot}/test/lib/googletest" 2>/dev/null
    git clone https://github.com/google/googletest.git \
              -b v1.14.x \
              "${ProjectRoot}/test/lib/googletest"
    echo "Cloned into ${ProjectRoot}/test/lib/googletest/"
  else
    echo "Found: ${ProjectRoot}/test/lib/googletest/ directory."
  fi
}

build() {
  echo ===========================================================================
  echo "BUILD: Building the installing the binaries"
  echo ===========================================================================
  mkdir -p bld 
  cd bld || exit
  cmake ..
  make -j "$(nproc 2>/dev/null || echo 8)"
  make cppcheck
  make install 
  make doxygen
  cd ..
}

tests() {
  echo ===========================================================================
  echo "TESTS: Running Google unit-tests"
  echo ===========================================================================
  export DYLD_LIBRARY_PATH=./lib/
  local test_executable="./bin/MyExecutableTest"
  if [[ -f "$test_executable" ]]; then
    $test_executable
  else
    echo "Can't find installed executable: $test_executable"
  fi
}

coverage() {
  echo ===========================================================================
  echo "GCOV: Running binaries and generating coverage report"
  echo ===========================================================================
  export DYLD_LIBRARY_PATH=./lib/
  local executable="./bin/MyExecutable"
  if [[ -f $executable ]]; then
    $executable
    cd bld || exit
    make coverage
    cd ..
  else
   echo "Can't find installed executable: $executable"
  fi
}



main() {
  clean
  header
  setup
  build
  tests
  coverage
  ln -sf bld/compile_commands.json ./
}

(( $_s_ )) || main

