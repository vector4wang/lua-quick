---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- DateTime: 2023-11-15 14:49
---

do
    function foo(...)
        for i = 1, select('#', ...) do
            -->获取参数总数
            local arg = select(i, ...); -->读取参数，arg 对应的是右边变量列表的第一个参数
            print("arg", arg);
        end
    end

    foo(1, 2, 3, 4);
end