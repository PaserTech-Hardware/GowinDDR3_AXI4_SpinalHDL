# Gowin DDR3 Controller with AXI4 Implementation

This is a SpinalHDL wrapper for Gowin GW2A series DDR3 soft IP (1:4 mode).

Please notice that Gowin's DDR3 soft IP uses a 128bit read/write interface, so it's not easy to connect this IP to AXI4 32bit directly.

So we implemented a bit length convertor to compatible this feature. And for performance reasons, we also implemented a 128bit simple cache to speed up AXI4 read/write.

And more, we also implemented a Arbiter Context for future use. It's easy to write a DMA with this wrapper.

File structure:

 - Paski_GowinDDR_AXI4.scala : AXI4 implementation (Top)
 
 - Paski_GowinDDR_AXI4WithCache.scala : AXI4 <==> DDR3 Controller wrapper, with 128bit cache implementation
 
 - Paski_GowinDDR14_Controller.scala : Gowin DDR3 wrapper implementation, which used command fifo & response fifo
 
 - DDR3_Interface.scala : The definition of DDR3 interface
 
 - Gowin_DDR3.scala : The BlackBox of Gowin GW2A series DDR3 soft IP (1:4 mode)

Licensed Under **MIT** with **ABSOLUTELY NO WARRANTY**.

# 高云DDR3内存控制器AXI4接口实现

这是高云GW2A系列DDR3软核的SpinalHDL对接实现 (1:4模式).

值得注意的是, 高云DDR3软核使用了一个128bit的读/写接口, 所以转接到AXI4 32bit接口是一件很麻烦的事情.

为了兼容这个问题, 我们实现了一个位宽转换器. 同时, 为了性能考虑, 我们还实现了一个简单的128bit缓存机制.

此外, 考虑到将来的应用, 我们还实现了一个仲裁器上下文, 这样你也可以很方便的通过这个wrapper写一个DMA.

文件结构:

 - Paski_GowinDDR_AXI4.scala : AXI4接口实现 (顶层)
 
 - Paski_GowinDDR_AXI4WithCache.scala : AXI4 <==> DDR3软核控制层, 其中包含了128bit的缓存系统
 
 - Paski_GowinDDR14_Controller.scala : 高云DDR3软核控制层实现, 使用了命令fifo、响应fifo的设计
 
 - DDR3_Interface.scala : DDR3接口的定义
 
 - Gowin_DDR3.scala : GW2A系列高云DDR3软核的黑盒定义 (1:4模式)

本代码采用 **MIT** 授权, **无任何担保**.
