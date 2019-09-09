# design_code
Degisn Code的SwiftUI教程 代码 

Design Code出品的一个SwiftUI教程。用SwiftUI开发一个app

#### 开发环境：
操作系统： 10.15 Beta Catalina   Xcode:11.0 Beta6

#### Section 7 : 使用数组来创建列表
前面的Menu是通过一个个的手写数据来创建的，这节将通过数组来创建列表
```swift


let menuData = [
    Menu(title: "My Account", icon: "person.circle"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Team", icon: "person.2"),
    Menu(title: "Sign Out", icon: "arrow.uturn.down"),
]

struct Menu: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
}

struct MenuView: View {
    var menu = menuData
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            ForEach(menu){ item in
                MenuRow(image: item.icon, text: item.title)
            }
            Spacer()
        }
        .padding(.top, 20)
        .padding(30)
        .frame(minWidth:0, maxWidth:.infinity)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.trailing, 60)
        .shadow(radius: 20)
        .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
        .animation(.default)
        .offset(x: show ? 0 : -UIScreen.main.bounds.width)
    }
}
```
创建Menu数据结构，将数据保存在menuData数组中，然后通过ForEach循环

#### section 8: 菜单动画和绑定

效果图：

![menu_animation.gif](https://ws1.sinaimg.cn/large/007dl3HPgy1g6po9z7i0ag308a0h6di9.gif)

``` swift

struct Home: View {
    @State var show = false //状态
    
    
    var body: some View {
        ZStack {
            MenuView(show: $show)
            
            Button(action: {
                self.show.toggle()
            }) {
                Text("Open Menu")
            }
        }
    }
}

//Menu组件
struct MenuView: View {
    var menu = menuData
    @Binding var show: Bool //状态绑定
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            ForEach(menu){ item in
                MenuRow(image: item.icon, text: item.title)
            }
            Spacer()
        }
        .padding(.top, 20)
        .padding(30)
        .frame(minWidth:0, maxWidth:.infinity)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.trailing, 60)
        .shadow(radius: 20)
        .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0)) //3d旋转动画
        .animation(.default) //默认的动画
        .offset(x: show ? 0 : -UIScreen.main.bounds.width)
    }
}

```

#### Section10 滚动内容
使用ScrollView 横向滚动

效果图：

![1.gif](https://ws1.sinaimg.cn/large/007dl3HPgy1g6ptoi3ws2g308f0hcqge.gif)

```swift
//这是最新的beta6的写法 ScrollView使用构造函数来控制滚动方向
struct HomeList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0 ..< 3) { item in
                    CourseView()
                }
            }
        }
    }
}

//beta 2 scrollview用法稍有不同 直接使用scrollview默认就是横向滚动 
// showHorizantalIndicators控制滚动条的显示
struct HomeList: View {
    var body: some View {
        ScrollView(showHorizantalIndicators: false) {
            HStack {
                ForEach(0 ..< 3) { item in
                    CourseView()
                }
            }
        }
    }
}


struct CourseView: View {
    var body: some View {
        VStack (alignment: .leading){
            Text("Build an app with SwiftUI")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(20)
                .lineLimit(4)
                .frame(width:150)
            Spacer()
            Image("Illustration1")
        }
        .background(Color("background3"))
        .cornerRadius(30)
        .frame(width:246, height:360)
        .shadow(color: Color("backroundShadow1"), radius: 20, x: 0, y: 20)
    }
}

```
#### Section11 模态

效果图

![2.gif](https://ws1.sinaimg.cn/large/007dl3HPgy1g6pxirpdx3g308f0hcnh7.gif)

```swift 

//PresentationButton 在beta5中已经过期 使用NavigationLink搭配NavigationView来使用代替

struct HomeList: View {
    @State var isPresent = true
    var course = courseData
    var body: some View {
        NavigationView{
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing:30) {
                    ForEach(course) { item in
                        NavigationLink(destination: ContentView()){
                            CourseView(
                                title: item.title,
                                image: item.image,
                                color: item.color,
                                shadowColor: item.shadowColor
                            )
                        }
                    }
                }
            }
            .padding(.leading, 30)
        }
    }
}
```

#### Section13 导航视图和列表

效果图：

![3.gif](https://ws1.sinaimg.cn/large/007dl3HPgy1g6t4lextvjg30990i0b29.gif)


SwiftUI中导航视图NavigationView 搭配NavigationLink可以快速实现 在item条目多的情况下滑动后标题栏会自动变化，并且跳转的时候自带动画效果。

**注意 beta6下NavigationButton已经失效，用NavigationLink取代**

设置title： 在List{}后设置navigationBarTitle
设置barItems 在List{}后设置navigationBarItems  


```swift
        NavigationView {
            List(updates) { item in
                NavigationLink(destination: Text("1")) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(item.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        Text(item.text)
                            .font(.body)
                            .lineLimit(2)
                            
                        Text(item.date)
                            .font(.footnote)
                        .foregroundColor(.gray)
                    }
                }
            }
            .navigationBarTitle("Update")
        .navigationBarItems(trailing:  Text("update"))
        }
```

#### Section14 导航和传递数据



#### Section15 合并编辑数据

效果图：

![4.gif](https://ws1.sinaimg.cn/large/007dl3HPgy1g6t96vn333g308j0h11ky.gif)

SwiftUI提供了Combine框架为我们进行数据的动态绑定。

首先创建一个类，定义需要动态绑定的数据updates
**beta5以前用的BindableObject已经过期，使用ObservableObject代替**

这里有一篇关于beta5的一些变更的说明
https://sarunw.com/posts/swiftui-changes-in-xcode-11-beta-5

```
class UpdateStore: ObservableObject {
    var objectWillChange = PassthroughSubject<Void, Never>()
    
    var updates: [Update]{
        didSet{
            objectWillChange.send()
        }
    }
    
    init(updates:[Update]) {
        self.updates = updates
    }
}
```
在使用动态绑定的数据的类中定义一个ObservedObject标记的变量
```
@ObservedObject var updateStore = UpdateStore(updates: updateData)
```
然后在ForEach中遍历这个变量

```
 List{
          ForEach(updateStore.updates) { item in
          NavigationLink(destination: UpdateDetail(title: item.title, image: item.image, text: item.text)) {
```

对数据的新增 更换位置的操作如下
```
    //新增数据
    func addUpdate(){
        updateStore.updates.append(Update(title: "New title", image: "Certificate1", text: "New text", date: "Jun 1"))
    }
    
    //数据位置更换
    func move(from source: IndexSet, to destination: Int){
        updateStore.updates.swapAt(source.first!, destination)
    }
```

列表的删除动作：
```
List{} .onDelete{ index in
                        self.updateStore.updates.remove(at: index.first!)
}
```



