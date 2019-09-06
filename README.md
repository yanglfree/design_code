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
