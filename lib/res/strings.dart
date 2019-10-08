import 'strings_zh.dart';

///当前语言：中文
Strings _res = StringsZh();

Strings get res => _res;

///通用的语言，直接这里实现。
///非通用的语言，各自子类继承它来实现。如中文语言：[StringsZh]
abstract class BaseStrings implements Strings {
  @override
  get appName => '旧书屋';
}

///语言集接口。方便统一管理字符串。也为未来多语言做准备
///ps:实际开发中发现，这样写无法赋值方法默认值（因为默认值要求为const）
abstract class Strings {
  //'get'关键字可加可不加。加上的话能够快速跳转具体实现：快捷键option + command + 左键

  get login;

  get register;

  get tabShelf;

  get tabRecommend;

  get appName;

  get username;

  get password;

  get searchTips;

  get signin;

  get signined;



  get tabLearn;

  get tabClassify;

  get testContainer;

  get testImage;

  get testImageUrl;

  get testImageMinUrl;
}
