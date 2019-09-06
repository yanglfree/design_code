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
