# Notice / 提示

This project may generate a verilog(vhdl) RAM, which may cause GowinIDE Synther **ABSOLUTELY WRONG RESULT**.

这个项目可能会使用到verilog(vhdl)的RAM, 这可能会导致高云IDE的综合器生成**完全错误**的结果.

To fix this problem, please select "GW2A-18C" series in GowinIDE instead of "GW2A-18". Gowin fae said that "C" is the suffix of the new chip, you can check the chip's 3rd line silk screen to confirm it. If it's a new chip, the new chip will have a "C" mark follow the serial number.

要解决这个问题, 请在高云IDE中选择"GW2A-18C", 而不是"GW2A-18". 高云fae表示"C"后缀是新版芯片的标识, 你可以查看芯片表面的第三行丝印来确认. 如果这是新版芯片, 会在数字序列号后面跟着一个"C"标识.


# Gowin DDR3 Controller with AXI4 Implementation

This is a SpinalHDL wrapper for Gowin GW2A series DDR3 soft IP (1:4 mode).

Please notice that Gowin's DDR3 soft IP uses a 128bit read/write interface, so it's not easy to connect this IP to AXI4 32bit directly.

So we implemented a bit length convertor to compatible this feature. And for performance reasons, we also implemented a 128bit simple cache to speed up AXI4 read/write.

And more, we also implemented a Arbiter Context for future use. It's easy to write a DMA with this wrapper.

File structure:

 - Paski_GowinDDR_AXI4.scala : AXI4 implementation (Top)

 - Paski_GowinDDR_AXI4_WithDMA.scala : Another AXI4 implementation with DMA (Top)
 
 - Paski_GowinDDR_AXI4WithCache.scala : AXI4 <==> DDR3 Controller wrapper, with 128bit cache implementation
 
 - Paski_GowinDDR14_Controller.scala : Gowin DDR3 wrapper implementation, which used command fifo & response fifo
 
 - Paski_GowinDDR3_BusArbiter.scala : Gowin DDR3 simple bus arbiter implementation (Warning: May cause a huge routing resource usage, use it carefully)

 - DDR3_Interface.scala : The definition of DDR3 interface
 
 - Gowin_DDR3.scala : The BlackBox of Gowin GW2A series DDR3 soft IP (1:4 mode)

This project is a SpinalHDL project, if you don't want to use SpinalHDL, you can also use the verilog file in the `generated` folder. 

For SpinalHDL, please use `Paski_GowinDDR_AXI4` or `Paski_GowinDDR_AXI4_WithDMA` as the top module.

For Verilog, we wrapped the SpinalHDL's Axi4Shared to standard AXI4, so generated verilog files will be `Paski_GowinDDR_AXI4_Compatible` and `Paski_GowinDDR_AXI4_WithDMA_Compatible` insteadly. 

However, as this project is a opensource software, you can still generate the Axi4Shared verilog file by yourself, if you need. 

Licensed Under **MIT** with **ABSOLUTELY NO WARRANTY**.

# 高云DDR3内存控制器AXI4接口实现

这是高云GW2A系列DDR3软核的SpinalHDL对接实现 (1:4模式).

值得注意的是, 高云DDR3软核使用了一个128bit的读/写接口, 所以转接到AXI4 32bit接口是一件很麻烦的事情.

为了兼容这个问题, 我们实现了一个位宽转换器. 同时, 为了性能考虑, 我们还实现了一个简单的128bit缓存机制.

此外, 考虑到将来的应用, 我们还实现了一个仲裁器上下文, 这样你也可以很方便的通过这个wrapper写一个DMA.

文件结构:

 - Paski_GowinDDR_AXI4.scala : AXI4接口实现 (顶层)

 - Paski_GowinDDR_AXI4_WithDMA.scala : 另一个带有DMA的AXI4接口实现 (顶层)
 
 - Paski_GowinDDR_AXI4WithCache.scala : AXI4 <==> DDR3软核控制层, 其中包含了128bit的缓存系统
 
 - Paski_GowinDDR14_Controller.scala : 高云DDR3软核控制层实现, 使用了命令fifo、响应fifo的设计

 - Paski_GowinDDR3_BusArbiter.scala : 高云DDR3简单的总线仲裁器实现 (警告: 可能导致大量现网资源占用, 请谨慎使用)
 
 - DDR3_Interface.scala : DDR3接口的定义
 
 - Gowin_DDR3.scala : GW2A系列高云DDR3软核的黑盒定义 (1:4模式)

这个项目是一个SpinalHDL项目, 如果你不想使用SpinalHDL, 你也可以直接使用`generated`文件夹中的verilog文件.

对于SpinalHDL, 请使用`Paski_GowinDDR_AXI4`或`Paski_GowinDDR_AXI4_WithDMA`作为顶层模块.

对于Verilog, 我们将SpinalHDL的Axi4Shared转接到了标准的AXI4, 所以生成的verilog文件将会是`Paski_GowinDDR_AXI4_Compatible`和`Paski_GowinDDR_AXI4_WithDMA_Compatible`.

然而, 由于这个项目是一个开源软件, 你也可以自己生成Axi4Shared的verilog文件, 如果你需要的话.

本代码采用 **MIT** 授权, **无任何担保**.
