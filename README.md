# CrashlyticsBuildIdGenerator

* This utility allows you to generate Crashlytics UUID for you package name. 
* This is useful for generating UUIDs for Xamarin.Android application without having to create and install a Android application and deal with Fabric.

# Requirements
1. Android Studio installed
2. OSX or Linux machine

# How to use
1. Clone, or download the source from this repository.
2. Edit the file `generate_ids.sh`
3. Add your `fabricApiKey` and your package(s) name.

Example:

```bash
declare fabricApiKey="yourfabrickey"
declare -a array=(                
                "com.test.build"
                "com.test.build.qa"
                "com.test.build.dev")
```
  4. Run the script `./generate_ids.sh`
  5. Get the results from the commandline, or from the generated file `generated_crashlytics_ids.txt`
  Results example:  

```
BUILD SUCCESSFUL

Total time: 7.912 secs
*** DONE ***
fabric api key: yourfabrickey
com.test.build	262d4cf2-823f-45b6-9911-4a25b2e87f6c
com.test.build.qa	86b85f93-e0cd-4c16-adea-119rf4t2dfbb
com.test.build.dev	e0f775bf-0647-496d-b0dd-728h67d158c9
```

# Integrate in Xamarin.Android Project

To configure `crashlytics` in you Xamarin android Project you must:

1. Install the Crashlytics nuget package from [here](https://www.nuget.org/packages/Crashlytics.Droid.Binding/).
2. Initialize Fabric with `crashlytics` in your `Application` or `MainActivity` class:

```c#
using IO.Fabric.Sdk.Android.Services.Common;
public override void OnCreate()
{
    IO.Fabric.Sdk.Android.Fabric.With(this, new Com.Crashlytics.Android.Crashlytics());
}
```

3. Add fabric Api key inside `AndroidManifest.xml` 

```xml
<meta-data android:name="io.fabric.ApiKey" android:value="1262f57dab2712f349faa97a21cd1a42b598" />
```

4. Finally create the file `Resources/valuescom_crashlytics_build_id.xml` and place the generated UUID inside of it.
File sample:

```xml
<?xml version="1.0" encoding="utf-8" standalone="no"?>
<resources>
    <string name="com.crashlytics.android.build_id" translatable="false">262d4cf2-823f-45b6-9911-4a25b2e87f6c</string>
</resources>
```

Run the application and it should get registed in crashlytics and ready to report crashes.

**NOTE**: The generated UUID don't need to be re-generated for the same package name everytime you build the package. 


### License
[MIT Licence](LICENSE) 
