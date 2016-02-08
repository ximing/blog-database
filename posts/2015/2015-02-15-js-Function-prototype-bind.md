title: JavaScript 中的 Function.prototype.bind
categories:
tags:
  - javascript
categories:
  - javascript
date:  2015-02-15 15:39:03
---
项目中需要对obj函数this进行更改，首先想到的就是Function.prototype.bind，.bind()创建了一个函数，当这个函数在被调用的时候，它的 this 关键词会被设置成被传入的值（这里指调用bind()时传入的参数）。因此，我们传入想要的上下文，this(其实就是 ｏbj)，到.bind()函数中。然后，当回调函数被执行的时候， this 便指向 myObj 对象。

一个简单的实现就是下面的，不出所料使用了apply()方法

```
Function.prototype.bind = function (scope) {
    var fn = this;
    return function () {
     return fn.apply(scope);
     }; }
```
不过事情还没完，这个方法有浏览器兼容问题，ie9以上，chrome7以上才能用，后来在mdn里面发现了一个替代方案

```
if (!Function.prototype.bind) {
    Function.prototype.bind = function (oThis) {
    if (typeof this !== "function") {
        throw new TypeError("Function.prototype.bind - what is trying to be bound is not callable");
        }
        var aArgs = Array.prototype.slice.call(arguments, 1),
            fToBind = this,
            fNOP = function () {},
            fBound = function () {
                return fToBind.apply(this instanceof fNOP &amp;&amp; oThis
                                    ? this
                                    : oThis,
                                    aArgs.concat(Array.prototype.slice.call(arguments)));
                                    };
            fNOP.prototype = this.prototype;
            fBound.prototype = new fNOP();
            return fBound;
        };
}
```