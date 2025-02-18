# POINTERS ON C
# 目录

# 1 简介
## 1.1 重排字符
* 空白和注释
`注释`以/* 开始，*/ 结束。<br>

多行注释：<br>
```
/*
** 多行注释
*/
```
注释有时候用于把一串代码注释掉，但在C语言中使用：
```
#if 0
  statements
#endif
```
* 预处理指令<br>

在编译器对源代码进行真正的编译之前由预处理器执行的命令。预处理指令以 # 符号开头，通常位于源文件的开头部分。
```
#include <stdio.h>  /* 访问标准I/O库中的函数，用于执行输入和输出 */
#include <stdlib.h>  /* 定义了EXIT_SUCCESS和EXIT_FAILURE符号 */
#include <string.h>  /* 提供函数来操纵字符串 */
#define MAX_COLS 20
#define MAX_INPUT1000
```
  * #include <br>

将指定的头文件内容插入到当前源文件中。头文件通常包含函数声明、宏定义、类型定义等信息，这样可以避免在多个源文件中重复编写相同的代码。<br>

  * #define <br>

用于定义宏，宏是一种简单的文本替换机制。预处理器在编译之前会将代码中所有出现的宏名替换为对应的宏定义内容。<br>

* 函数原型<br>

告诉编译器这些以后将在源文件中定义的函数的特征。<br>

  * 每一个原型以类型名开头，表示**返回值的类型**。跟在返回类型后面的是函数的名字，再后面是函数期望的参数。
```
void rearrange( char *output, char const *input, int n_clumns, int const columns[] );
int read_column_numbers( int columns[], int max );
```
  * 其中第一和第二个参数都是`指针（pointer）`。指针用于指定一个存储于计算机内存中的值的地址。<br>

  * void表示函数不返回任何值。这种无返回值的函数被称为`过程`（produce）。<br>

  * char用于表示单个字符，而 char * 则可以用来表示一个字符串。<br>

  * const声明表示函数将不会修改函数调用者所传递的这个参数，只读。<br>

如果这个程序的源代码由几个源文件组成，那么使用该函数的源文件都必须写明该函数的原型。把原型放在头文件并用#include 指令包含他们，可以避免由于同一个声明的多份拷贝而导致维护性问题。

* main函数
```
int main( void ) /* void表示不接受任何参数 */
{
}
```
每个C程序必须有main函数<br>

**参数传递**：C语言中所有参数都是按值传递（不会改变其本身的值），但数组参数的行为看起来像是按引用传递（因为修改数组内容会反映到原始数组），因为数组传递的是地址。<br>

* get函数<br>

从标准输入读取一行文本并把它存储于作为参数传递给它的数组中。
```
get( input ) != NULL
```
  * 输入的一串字符以一个换行符（\n，即 newline）结尾。<br>

  * 在丢弃换行符后，gets 函数会在该行的末尾存储一个 `NUL 字节（\0）`，这表示字符串的结束。NUL 字节是一个字节，其值为全0，用来表示字符串的结束。<br>

  * 当 gets 函数被调用但事实上没有更多输入行可供读取时（例如，到达了文件末尾），它会返回 NULL 值。<br>

C语言`字符串`就是以NUL字节结尾的字符。NUL本身不被看作字符串的一部分，但是占一个字节。<br>

`字符串常量`是被双引号括起来的一串字符。

* printf函数
```
printf( "Origninal input : %s\n", input );
```
**格式代码**：<br>

%d：以十进制形式打印一个整型值<br>

%o：以八进制形式<br>

%x：以十六进制形式<br>

%g：打印一个浮点值<br>

%c：打印一个字符<br>

%s：打印一个字符串<br>

\n：换行<br>

* scanf函数<br>

用于从标准输入（通常是键盘）读取数据的函数。它是标准输入输出库（<stdio.h>）中的一个重要函数，广泛用于获取用户输入。<br>
```
while(num < max && scanf("%d", &columns[num]) == 1 && columns[num] >= 0 )
    num += 1;
```
  * 第一个参数是格式化字符串，用于描述期望的输入类。<br>

  * 剩余参数columns[num]都是变量，存储函数所读取的输入数据。<br>

  * 返回成功读取的项数，如果成功读取一个整数，则返回 1。<br>

  * 所有标量前面要加上“&”<br>

**格式代码**：<br>
![scanf格式码](./pic/scanf格码.png "scanf格式码“)<br>

* puts函数<br>

是gets函数的输出版本，把指定的字符串写到标准输出并在末尾添上一个换行符。

* exit函数<br>

exit 函数是一个标准库函数，用于终止程序的执行。它定义在头文件 <stdlib.h> 中，通常用于在程序运行过程中提前退出，或者在满足某些条件时结束程序。
```
void exit(int status);
```
  * status：一个整数，表示程序的退出状态。通常，0 表示程序正常退出，非零值表示程序因错误或其他异常情况退出。退出状态码通常用于向操作系统或其他调用程序报告程序的执行结果。<br>

* getchar函数<br>

从标准输入读取一个字符并返回它的值。如果输入不存在任何字符，就会返回常量EOF(在stdio.h中定义)。
```
while((ch = getchar()) != EOF && ch != '\n');
  ;
```
  * while语句之后一个单独的分号称为**空语句**，防止读者错误地以为接下来的语句也是循环体的一部分。