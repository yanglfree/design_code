# design_code
Degisn Code的SwiftUI教程 代码 

Design Code出品的一个SwiftUI教程。用SwiftUI开发一个app

开发环境： 10.15 Beta   Xcode:11.0 Beta6


section 8: 菜单动画和绑定
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
