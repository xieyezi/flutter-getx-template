
我们都知道 `GetX` 提供了很多渲染方法, 他们分别是:

- `Obx(()=>())`
```dart
Obx (() => Text (controller.name));
```
- `GetBuilder<Controller>`
```dart
GetBuilder<CountController>(
  init: controller,
  initState: (_) {},
  builder: (controller) {
    return Text('value -> ${controller.count}');
  },
),
```
- `GetX<Controller>`
```dart
GetX<Controller>(
  builder: (controller) {
    print("count 1 rebuild");
    return Text('${controller.count1.value}');
  },
),
```
- `ValueBuilder<bool>`

```dart
ValueBuilder<bool>(
  initialValue: false,
  builder: (value, updateFn) => Switch(
    value: value,
    onChanged: updateFn, 
  ),
  onUpdate: (value) => print("Value updated: $value"),
  onDispose: () => print("Widget unmounted"),
),
```

- `ObxValue`
```dart
ObxValue((data) => Switch(
        value: data.value,
        onChanged: data, // Rx 有一个 _callable_函数! 你可以使用 (flag) => data.value = flag,
    ),
    false.obs,
),

```
- `GetView<AwesomeController>`
```dart
 class AwesomeView extends GetView<AwesomeController> {
   @override
   Widget build(BuildContext context) {
     return Container(
       padding: EdgeInsets.all(20),
       child: Text( controller.title )
     );
   }
 }
```


其实我是真的很认真的看了文档，但是我真的不明白这些方法，怎么用，在哪里用。以及它们之间的区别。

所以请教一下各位大佬！希望各位大佬不吝赐教！