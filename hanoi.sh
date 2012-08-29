#! /bin/bash
#
# 汉诺塔
# Bash script
# Copyright (C) 2000 Amit Singh. All Rights Reserved.
# http://hanoi.kernelthread.com
#
# 在bash version 2.05b.0(13)-release下通过测试
#
#  经过脚本原作者同意
#+ 可以使用在"Advanced Bash Scripting Guide"中. 
#  本书作者对此脚本做了少许修改. 

#=================================================================#
#  汉诺塔是由Edouard Lucas提出的数学谜题, 
#+ 他是19世纪的法国数学家. 
#
#  有三个直立的柱子竖在地面上. 
#  第一个柱子上有一组盘子套在上面. 
#  这些盘子是平的, 中间有孔, 
#+ 可以套在柱子上面. 
#  这些盘子的直径不同, 它们从下到上, 
#+ 按照尺寸递减的顺序摆放. 
#  也就是说, 最小的在最上边, 最大的在最下面. 
#
#  现在的任务是要把这组盘子
#+ 从一个柱子上全部搬到另一个柱子上. 
#  你每次只能将一个盘子从一个柱子移动到另一个柱子上. 
#  你也可以把盘子从其他的柱子上移回到原来的柱子上. 
#  你只能把小的盘子放到大的盘子上, 
#+ 反过来就*不*行. 
#  切记, 这是规则, 绝对不能把大盘子放到小盘子的上面. 
#
#  如果盘子的数量比较少, 那么移不了几次就能完成. 
#+ 但是随着盘子数量的增加, 
#+ 移动次数几乎成倍的增长, 
#+ 而且移动的"策略"也会变得越来越复杂. 
#
#  想了解更多信息的话, 请访问http://hanoi.kernelthread.com. 
#
#
#         ...                   ...                    ...
#         | |                   | |                    | |
#        _|_|_                  | |                    | |
#       |_____|                 | |                    | |
#      |_______|                | |                    | |
#     |_________|               | |                    | |
#    |___________|              | |                    | |
#   |             |             | |                    | |
# .--------------------------------------------------------------.
# |**************************************************************|
#          #1                   #2                      #3
#
#=================================================================#


E_NOPARAM=66  # 没有参数传给脚本. 
E_BADPARAM=67 # 传给脚本的盘子个数不符合要求. 
Moves=        # 保存移动次数的全局变量. 
              # 这里修改了原来的脚本. 

dohanoi() {   # 递归函数. 
    case $1 in
    0)
        ;;
    *)
        dohanoi "$(($1-1))" $2 $4 $3
        echo move $2 "-->" $3
	let "Moves += 1"  # 这里修改了原脚本. 
        dohanoi "$(($1-1))" $4 $3 $2
        ;;
    esac
}

case $# in
1)
    case $(($1>0)) in     # 至少要有一个盘子. 
    1)
        dohanoi $1 1 3 2
        echo "Total moves = $Moves"
        exit 0;
        ;;
    *)
        echo "$0: illegal value for number of disks";
        exit $E_BADPARAM;
        ;;
    esac
    ;;
*)
    echo "usage: $0 N"
    echo "       Where \"N\" is the number of disks."
    exit $E_NOPARAM;
    ;;
esac

# 练习:
# -----
# 1) 这个位置以下的代码会不会被执行? 
#    为什么不? (容易)
# 2) 解释一下这个运行的"dohanoi"函数的运行原理. 
#    (比较难)