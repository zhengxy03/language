# POINTERS ON C
# 目录

# 1 简介
## 1.1 重排字符
* 空白和注释
`注释`以/* 开始，*/ 结束。<br>

注释有时候用于把一串代码注释掉，在C语言中使用：
```
#if 0
  statements
#endif
```
* 预处理指令
由预处理器处解释，把修改过的源代码递交给编译器。
```
#include <stdio.h>  /* 访问标准I/O库中的函数，用于执行输入和输出 */
#include <stdlib.h>  /* 定义了EXIT_SUCCESS和EXIT_FAILURE符号 */
#include <string.h>  /* 提供函数来操纵字符串 */
#define MAX_COLS 20
#define MAX_INPUT1000
```
如果一些声明需要用于几个不同的源文件，可在一个单独的文件中编写这些声明，然后用`#include`指令把这个文件包含到所需要使用这些声明的源文件中。<br>

* 函数原型
告诉编译器这些以后将在源文件中定义的函数的特征。每一个原型以类型名开头，表示返回值的类型。跟在返回类型后面的是函数的名字，再后面是函数期望的参数。
```
void rearrange( char *output, char const *input, int n_clumns, int const columns[] );
```
其中第一和第二个参数都是指针（pointer）。指针用于指定一个存储于计算机内存中的值的地址。<br>

const声明表示函数将不会修改函数调用者所传递的这两个参数。<br>

void表示函数不返回任何值。这种无返回值的函数被称为`过程`（produce）。<br>

如果这个程序的源代码由几个源文件组成，那么使用该函数的源文件都必须写明该函数的原型。把原型放在头文件并用#include 指令包含他们，可以避免由于同一个声明的多份拷贝而导致维护性问题。

* main函数

