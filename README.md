# flutter_getx_template



Language: 中文简体 | [English](README-EN.md)

<code>![visitors](https://visitor-badge.glitch.me/badge?page_id=xieyezi.flutter-getx-template)</code>
<code>![null safety](https://img.shields.io/badge/null-safety-blue)</code>
<code>![flutter version](https://img.shields.io/badge/flutter-2.x-blue)</code>
<code>![getx version](https://img.shields.io/badge/getx-4.x-blue)</code>


基于[`getx`](https://github.com/jonataslaw/getx) 实现的全新`flutter getx` 模版，适用于中大型项目的开发。

- 💥 `flutter`最新版本的空安全
- 🍀 `view` 和 `逻辑` 完全解耦
- ⚡ `view` 和 `state` 自动响应
- 📦  `dio`、`shared_preferences`等通用模块的封装

🔥等等...

### 环境

```
Flutter 2.2.0 • channel stable • https://github.com/flutter/flutter.git
Framework • revision b22742018b (3 weeks ago) • 2021-05-14 19:12:57 -0700
Engine • revision a9d88a4d18
Tools • Dart 2.13.0
```


### lib目录划分



- `common`
  
此目录用来存放通用模块及其变量，例如`colors`、`langs`、`values`等，例如：

```
├── colors
│   └── colors.dart
├── langs
│   ├── en_US.dart
│   ├── translation_service.dart
│   └── zh_Hans.dart
└── values
    ├── cache.dart
    ├── storage.dart
    └── values.dart
  
```

- `components`

此目录主要存放顶层公告组件，例如 `appbar`、`scaffold`、`dialog`等等，例如：

```
├── components.dart
├── custom_appbar.dart
└── custom_scaffold.dart
```

- `pages`
  
此目录主要存放页面文件，例如：

> 注：每个Item为一个文件夹.

```
├── Index
├── home
├── login
├── notfound
├── proxy
└── splash

```

- `router`
  
此目录为路由文件，此模版的路由方式约定为`命名路由`，为固定目录，目录结构如下：

```
├── app_pages.dart
└── app_routes.dart

```

- `services`

此目录用来存放`API`，例如:

```
├── services.dart
└── user.dart  // 关于用户的API
```

- `utils`

此目录用来存放一些工具模块，例如 `request` 、`local_storage`等等，例如：

```
├── authentication.dart
├── local_storage.dart
├── request.dart
├── screen_device.dart
└── utils.dart
```

### 开发规范

当你需要新建一个页面时，你需要按照以下步骤进行：

> 假设我们现在要创建一个`Home` 页面.

1. 在`pages` 目录下新建`home` 目录：

```shell
// pages

$ mkdir home
$ cd home
```

2. 在 `home` 目录下，新建以下四个文件：

- `home_view.dart` : 视图(用来实现页面布局)

- `home_contrller.dart` : 控制器(用来实现业务逻辑)

- `home_binding` : 控制器绑定(用来绑定`controller`到`view`)

- `home_model` : 数据模型(用来约定数据模型)

注意：每创建一个页面时，都必须如此做，命名采用 `页面名` + `_` + `key` 这样的形式.

当你创建好一个页面，目录应该长这样👇：

```
// home
.
├── home.binding.dart
├── home_controller.dart
├── home_model.dart
└── home_view.dart
```

1. 到`router`文件夹下面添加对应路由:

```dart
// app_routes.dart
part of 'app_pages.dart';

abstract class AppRoutes {
  ...
  static const Home = '/home';
  ...
}

```

```dart
// app_pages.dart
class AppPages {

  static final routes = [
    ...
    GetPage(
      name: AppRoutes.Home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    ...
  ];
}
```

完成以上步骤，你就可以愉快的开始开发了。



### 状态管理

`contrller` 是我们实现业务逻辑的地方，为什么我们要将 业务逻辑和视图分开呢？因为`flutter` 的意大利面式的代码实在是太难维护了，本来`flutter` 的页面布局和样式写在一起就很恶心了，再加上业务逻辑代码的话，实在太难以维护，而且，如果我们想要拥有状态的话，我们的页面不得不继承自`stateful widget`，性能损耗太严重了。

所以我们利用 `getx` 提供的 `controller`，将我们的业务逻辑和视图解耦。

1. 一个标准的`contrller`长这样：

```dart
class HomeController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() => count.value++;
}
```

当我们需要一个响应式的变量时，我们只需在变量的后面加一个`.obs`，例如：

```dart
final name = ''.obs;
final isLogged = false.obs;
final count = 0.obs;
final balance = 0.0.obs;
final number = 0.obs;
final items = <String>[].obs;
final myMap = <String, int>{}.obs;

// 甚至自定义类 - 可以是任何类
final user = User().obs;
```
> 值得注意的是，因为现在`flutter` 有了`null-safety`，所以我们最好给响应式变量一个初始值。

当我们在controller更新了响应式变量时，视图会自动更新渲染。

但是实际上，你也可以不定义这种响应式变量，例如我们可以这样：


```dart
class HomeController extends GetxController {
  int count = 0;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() {
    count++;
    update();
  } 
}
```


这样和`.obs`的唯一区别是，我们需要手动调用 `update()` 更新状态的变化，这样`view`才能在`count`变化时，收到我们的通知重新渲染。


2. 我们应该将发起请求，放在`onInit`钩子里面，例如进入订单页面时，我们应该获取订单信息，就如同在 `stateful wdiget` 里面的`init`钩子一样。


### 视图

首先，你需要将你的`class` 继承自 `GetxView<T>`(T 为你的Controller)，例如：

```dart
class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
```

`GetxView<HomeController>` 会自动帮你把 `Controller` 注入到 `view` 中，你可以简单理解为它自动帮你执行了以下步骤

```dart
final controller = Get.find<HomeController>();
```

不必担心 `GetxView<T>` 的性能，因为它仅仅是继承自 `Stateless Widget` ，记住，有了 `getx` 你完全不需要 `Stateful Widget`


当我们想要绑定`controller`的变量时，我们约定了两种方法：

1. `Obx(()=>)`

如果你的变量是`.obs`的，那么我们就使用`Obx(()=>)`，它会在变量变更时自动刷新`view`，例如：

```dart
// home_contrller
class HomeController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() => count.value++;
}
```
在view里面使用 `Obx(()=>)` 绑定`count`:

```dart
// home_view
class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Obx(() => Center(child: Text(controller.count.toString()))),
      ),
    );
  }
}
```

2. `GetBuilder<T>`

如果你的变量不是`.obs`的，那么我们就使用`GetBuilder<T>`，例如：


```dart
class HomeController extends GetxController {
  int count = 0;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() {
    count++;
    update();
  } 
}
```

在 `view` 里面使用 `Obx(()=>)` 绑定`count`:

```dart
class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: MyAppBar(
        centerTitle: true,
        title: MyTitle('首页'),
        leadingType: AppBarBackType.None,
      ),
      body: Container(
        child: GetBuilder<HomeController>(builder: (_) {
          return Center(child: Text(controller.count.toString()));
        }),
      ),
    );
  }
}
```


其实`getx`还提供了其他的[`render function`](https://github.com/jonataslaw/getx/issues/1499)，但是为了减少心智负担和复杂度，我们就使用这两种就够了。



### 路由管理

