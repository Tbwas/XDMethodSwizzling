# XDMethodSwizzling
Encapsulate method to exchange instance-method's implementation and class-method's implementation.

# Install
### CocoaPods

```
  platform :ios, '8.0'
  
  target 'TargetName' do
  pod 'XDMethodSwizzling'
  end
```
If there is a `Unable to find a pod with name, author, summary, or description matching...` error when you execute `pod search XDMethodSwizzling` command, please try to execute `rm ~/Library/Caches/CocoaPods/search_index.json` command firstly, and then execute `pod search XDProgressView` command.

