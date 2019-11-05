## SetJsonProperty

Update a specific json object's property with a specified value. You can target nested json objects, and even objects that belong to an array. Available on the [Visual Studio Marketplace](https://marketplace.visualstudio.com/publishers/ThatBlokeCalledJay)
  
> Note: SetJsonProperty has been designed to work with **Azure DevOps** pipelines running specifically on **Windows** machines.
  
## Set your property path

This couldn't be easier, simply specify the property path as you would in javascript.  

```json
{
    "MyProperty":"TheValueToUpdate"
}
```

To target the above property `MyProperty` and update it's value, you would set `MyProperty` as your Property Path.
  
### Nested objects

```json
{
    "Property1": "Value1",
    "MyNestedObject": {
        "MyProperty": "TheValueToUpdate"
    }
}
```

In the above example, you would target `MyProperty` the same as you would in javascript `MyNestedObject.MyProperty` You don't have to stop there, you can access properties on objects nested much deeper than that.
  
### Nested objects and arrays

```json
{
    "Property1": "Value1",
    "MyNestedObject": {
        "NestedProperty": [
            {
                "Key": "Value1"
            },
            {
                "Key": "Value2"
            },
            {
                "Key": "Value3"
            }
        ]
    }
}
```

In the above example, let's say you wanted to target the second instance of `Key` and update it's value. Again, as with javascript, you would specify the property path and an array index like so `MyNestedObject.NestedProperty[1].Key`

## Providing a new value

There are a number of ways you can provide a value with which to update your property. You can simply enter a value into the "Property Value" field e.g. `MyNewValue`. You can specify an environment variable too, for example your build number `$(Build.BuildNumber)`  
  
This means you can also access an environment variable that has been set by another task, previously in your pipeline.  

---

## Need help setting up

 Check out the [wiki](https://github.com/ThatBlokeCalledJay/set-json-property/wiki/Getting-Started) for more information.

## Minimum supported environments

- [Minimum agent version](https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/agents?view=azure-devops): 2.123.0


## Version Updates
- 1.0.5  
    Update character escape regex to only chack for hex values
- 1.0.4  
    README Update
- 1.0.3  
    Fixed character escaping issues when parsing Json.

---



#### On GitHub

- [ThatBlokeCalledJay](https://github.com/ThatBlokeCalledJay)
- [AutoAppVersion](https://github.com/ThatBlokeCalledJay/auto-app-version)  
- [SetJsonProperty](https://github.com/ThatBlokeCalledJay/set-json-property)  
  
#### On Visual Studio Marketplace

- [ThatBlokeCalledJay](https://marketplace.visualstudio.com/publishers/ThatBlokeCalledJay)
- [AutoAppVersion](https://marketplace.visualstudio.com/items?itemName=ThatBlokeCalledJay.thatblokecalledjay-autoappversion)  
- [SetJsonProperty](https://marketplace.visualstudio.com/items?itemName=ThatBlokeCalledJay.thatblokecalledjay-setjsonproperty)  

Find more about me at [ThatBlokeCalledJay.com](https://thatblokecalledjay.com/)