# GreatModelHandle
动态创建模型的属性，妈妈再也不用担心我写错单词了！

一.在Github上面新建一个项目

这个应该是很简单的，如果不明白就自行google,简简单单的几行git操作就行

二.从GitHub上把代码拿下来

这时你会发现里面多了一个`LICENSE`和一个`README.md`,当然这里插播一句，那个隐藏的`.gitignore`一定的配置好，是啥语言就是啥语言，可以直接在GitHub上直接设置的，当然拿下了后在本地仓库也可以改

三.新建一个`podspec文件`

这里很容易出错，可以本地通过git touch XXX.podspec创建，也可以用vim XXX来生成，当然这边还有一个简单的方法，就是你可以直接去别人的文件里打开XXX.podspec,然后再自己修改，这里注意下，如果用mac自带的文本编辑器修改出现格式问题的话，请用`sublime`修改
我的podspec文件内容


![新建pod.png](http://upload-images.jianshu.io/upload_images/1767433-dd5b505c3737443e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


```obj
Pod::Spec.new do |s|
s.name = 'GreatModelHandle'
s.version = '1.0.1'
s.license = 'MIT'
s.summary = 'A in iOS.'
s.homepage = 'https://github.com/caixiang305621856/GreatModelHandle'
s.authors = { '616704162' => '616704162@qq.com' }
s.source = { :git => "https://github.com/caixiang305621856/GreatModelHandle.git", :tag => "1.0.1"}
s.requires_arc = true
s.ios.deployment_target = '7.0'
s.source_files = "GreatModelHandle", "*.{h,m}"
end
```

- s.name 项目名
- s.version 版本号
- s.summary 描述
- s.homepage Github那个页面地址
- s.authors 是作者和邮箱
- s.source 下载你代码资源的地址也就那个HTTPS
- s.requires_arc 是否要求arc
- s.ios.deployment_target 最低要求的系统版本
- s.source_files 你项目文件名和里面的内容

以上基本就可以赋值过去用了，但如果你还有疑问，建议你去找找其他的第三方的看看，参考参考

注意tag 一定得写对，否则会报错的

四. 上传代码到CocoaPods

- 注册 trunk

    ```obj
    pod trunk register XXX@qq.com '用户名' --  verbose

    ```
- 查看注册信息

    ```obj
    pod trunk me
    ```
- 配置pod前面已经提到了，当然这里，我就直接复制了下别人的代码配置，里面还有引用第三方库的

    ```obj
    Pod::Spec.new do |s|
# 项目名称
s.name         = 'CSNetworking'
# 描述一下项目的作用
s.summary      = 'On the basis of AFNetworking encapsulation.'
# 版本号
s.version      = '1.0.8'
# 开源许可证
s.license      = { :type => 'MIT', :file => 'LICENSE' }
# 作者信息
s.authors      = { 'CoderXSLee' => '1363852560@qq.com' }
# 所支持的系统以及版本号
s.platform     = :ios, '7.0'
s.ios.deployment_target = '7.0'
# 资源地址链接
s.source       = { :git => 'https://github.com/CoderXSLee/CSNetworking.git', :tag => s.version.to_s }
#
s.requires_arc = true
# 文件
s.source_files = 'CSNetworking/**/*.{h,m}'
# 头文件
s.public_header_files = 'CSNetworking/*.{h}'
# 所用到的系统类库
# s.frameworks = 'CoreFoundation', 'CoreGraphics', 'Foundation', 'MobileCoreServices', 'QuartCore', 'Security', 'SystemConfiguration', 'UIKit'
# 所用到 cocoapods 中的其他类库
s.dependency 'AFNetworking', '~>3.1.0'
s.dependency 'MJExtension', '~>3.0.13'
s.dependency 'YYCache', '~>1.0.3'
end
    ```

- 上传代码

```obj
    git tag '1.0'
    git push --tags
```

- 提交podspec文件

```obj
    pod trunk push 项目名XXX.podspec
```


![cocodPod.png](http://upload-images.jianshu.io/upload_images/1767433-fc9216670ca51a26.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

到这基本就成功了  剩下的就是你可以去cocodPods上搜索下


![searchResult.png](http://upload-images.jianshu.io/upload_images/1767433-3efa0709df03c803.png)

- 更新podspec

    - 第一，你先把配置的podspec里面的tag给修改修改 从`1.0变到1.0.1`
    - 第二，得重新再打个tag

    ```obj
        git tag '1.0.1'
        git push --tags
        pod trunk push 项目名XXX.podspec
    ```
