import 'package:flutter/material.dart';

/// 滚动菜单封装

class SPPageMenu extends StatefulWidget {
  final TabController tabController;
  final List<String> tabs; //tab指示器的标题集合,文字形式
  final List<Widget>? tabBodyList; //tab指示器的页面
  final Function(int)? onPageChange; //页面滑动回调
  final Color? indicatorColor; //指示器的颜色
  final Color? selectColor; //标签的颜色
  final Color? unselectColor; //未选中标签的颜色
  final TextStyle? selectStyle;//选中样式
  final TextStyle? unselectStyle;//未选中颜色 不包含颜色
  final TabBarIndicatorSize? indicatorSize; //指示器的大小 是和文字宽度一样还是充满
  final double? indicatorHeight; //指示器的高度
  final bool? isScrollable; //指示器是否支持滑动
  final double? tabHeight; //tab高度
  final double? height; //tab高度
  final Color? color; //背景色
  final Decoration? indicator; //指示器

  const SPPageMenu({
    super.key,
    required this.tabController,
    required this.tabs,
    this.tabBodyList,
    this.onPageChange,
    this.indicatorColor = Colors.orange,
    this.selectColor = Colors.orange,
    this.unselectColor = Colors.grey,
    this.unselectStyle,
    this.selectStyle,
    this.indicatorSize = TabBarIndicatorSize.label,
    this.indicatorHeight = 3,
    this.isScrollable = true,
    this.tabHeight = 40,
    this.color = Colors.white,
    this.height = 40,
    this.indicator,
  });

  @override
  State<SPPageMenu> createState() => _SPPageMenuState();
}

class _SPPageMenuState extends State<SPPageMenu> {


  @override
  void initState() {
    super.initState();
    // 添加监听事件
    widget.tabController.addListener(() {
      //滑动的索引
      if (widget.onPageChange != null && !widget.tabController.indexIsChanging) {
        widget.onPageChange!(widget.tabController.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> tabList = []; //tab指示器

    //标题数组
    tabList = widget.tabs.map((e) => Tab(
      text: e,
      height: widget.tabHeight,
    )).toList();

    return Container(
      color: widget.color,
      height: widget.height,
      alignment: Alignment.centerLeft,
      child: TabBar(
        tabs: tabList,
        controller: widget.tabController,
        // 标签指示器的颜色
        indicatorColor: widget.indicatorColor,
        // 标签的颜色
        labelColor: widget.selectColor,
        indicator: widget.indicator,
        // 未选中标签的颜色
        unselectedLabelColor: widget.unselectColor,
        // 指示器的大小
        indicatorSize: widget.indicatorSize,
        // 指示器的权重，即线条高度
        indicatorWeight: widget.indicatorHeight!,
        // 多个标签时滚动加载
        isScrollable: widget.isScrollable!,
        //选择样式
        labelStyle: widget.selectStyle,
        // 未选中样式
        unselectedLabelStyle: widget.unselectStyle,
        //指示器偏移
        indicatorPadding: const EdgeInsets.symmetric(vertical: 4),
        labelPadding: const EdgeInsets.symmetric(horizontal: 1.0),
        // onTap: onPage,
      ),
    );
  }


  /*
   * 指示器点击
   */
  // void onPage(position) {
  //   print('click');
  // }

  @override
  void dispose() {
    super.dispose();
  }
}


