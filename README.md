# LeetCode C++ CMake Project


This project template helps you stay organized and productive while solving algorithm problems using C++.

> This project is based on the article: [My C++ CMake Project for LeetCode](https://medium.com/@scherkesov1006/my-c-cmake-project-for-leetcode-74418383ddd2)




## Build the Project

Initiating whole setup and prerequisites:
```shell
bash ./setup.sh
```

But, if you only need to build the debug artifact, run:

```shell
bash ./build.sh
```

## Adding New Problem

```shell
bash ./init.sh
```

Solution has next structure:

```
./problem-<Problem number>-<Problem name>
    - CMakeLists.txt # build instruction for CMake
    - main.cpp       # driver code
    - Solution.h     # LeetCode platform expects for this file
    - input.txt      # examples from problem description
```

## Build update solution

```shell
bash ./debug.sh
```

Run the solution within input:

```shell
bash ./run.sh {project_name}
```
