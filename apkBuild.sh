#!/bin/bash

# Check if the OS is Linux or WSL
if [[ "$(uname)" == "Linux" || "$(uname -r | grep -o Microsoft)" == "Microsoft" ]]; then
  # Check if apktool is installed
  if ! command -v apktool &> /dev/null; then
    echo "apktool is not installed. Please install apktool before continuing."
    exit 1
  fi

  # Add your commands here to execute if the OS is Linux or WSL and apktool is installed
else
  echo "Current OS is not Linux or WSL. Exiting..."
  exit 1
fi


mkdir build

cd build

wget -nc https://github.com/love2d/love/releases/download/11.3/love-11.3-android-embed.apk

apktool d -s -o love_decoded love-11.3-android-embed.apk

cd .. 

zip -r game.love . -x "assets/" "build/" ".git/" "debug" ".vscode" "*.love"

mkdir build/love_decoded/assets

mv game.love build/love_decoded/assets

rm -f build/love_decoded/AndroidManifest.xml

echo '<?xml version="1.0" encoding="utf-8" standalone="no"?>
<manifest package="com.zzgames.railrush"
      android:versionCode="1"
      android:versionName="0.2"
      android:installLocation="auto" xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.VIBRATE"/>
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" android:maxSdkVersion="18"/>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" android:maxSdkVersion="18"/>
    <!--Uncomment line below if your game uses microphone capabilities. !-->
    <!--uses-permission android:name="android.permission.RECORD_AUDIO" /!-->
    <uses-feature android:glEsVersion="0x00020000"/>
    <application
        android:allowBackup="true"
        android:icon="@drawable/love"
        android:label="Rail Rush"
        android:theme="@android:style/Theme.NoTitleBar.Fullscreen"
    >
        <activity
            android:configChanges="orientation|screenSize"
            android:label="Rail Rush"
            android:launchMode="singleTask"
            android:name="org.love2d.android.GameActivity"
            android:screenOrientation="sensorLandscape"
        >
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
                <category android:name="tv.ouya.intent.category.GAME"/>
            </intent-filter>
            <intent-filter>
                <action android:name="android.hardware.usb.action.USB_DEVICE_ATTACHED" />
            </intent-filter>
        </activity>
    </application>
</manifest>' > build/love_decoded/AndroidManifest.xml

rm -f build/love_decoded/apktool.yml

echo "!!brut.androlib.meta.MetaInfo
apkFileName: love-11.3-android-embed.apk
compressionType: false
doNotCompress:
- resources.arsc
- META-INF/androidx.activity_activity.version
- META-INF/androidx.appcompat_appcompat.version
- META-INF/androidx.arch.core_core-runtime.version
- META-INF/androidx.asynclayoutinflater_asynclayoutinflater.version
- META-INF/androidx.coordinatorlayout_coordinatorlayout.version
- META-INF/androidx.core_core.version
- META-INF/androidx.cursoradapter_cursoradapter.version
- META-INF/androidx.customview_customview.version
- META-INF/androidx.documentfile_documentfile.version
- META-INF/androidx.drawerlayout_drawerlayout.version
- META-INF/androidx.fragment_fragment.version
- META-INF/androidx.interpolator_interpolator.version
- META-INF/androidx.legacy_legacy-support-core-ui.version
- META-INF/androidx.legacy_legacy-support-core-utils.version
- META-INF/androidx.lifecycle_lifecycle-livedata-core.version
- META-INF/androidx.lifecycle_lifecycle-livedata.version
- META-INF/androidx.lifecycle_lifecycle-runtime.version
- META-INF/androidx.lifecycle_lifecycle-viewmodel.version
- META-INF/androidx.loader_loader.version
- META-INF/androidx.localbroadcastmanager_localbroadcastmanager.version
- META-INF/androidx.print_print.version
- META-INF/androidx.slidingpanelayout_slidingpanelayout.version
- META-INF/androidx.swiperefreshlayout_swiperefreshlayout.version
- META-INF/androidx.vectordrawable_vectordrawable-animated.version
- META-INF/androidx.vectordrawable_vectordrawable.version
- META-INF/androidx.versionedparcelable_versionedparcelable.version
- META-INF/androidx.viewpager_viewpager.version
- png
isFrameworkApk: false
packageInfo:
  forcedPackageId: '127'
  renameManifestPackage: null
sdkInfo:
  minSdkVersion: '14'
  targetSdkVersion: '29'
sharedLibrary: false
sparseResources: false
unknownFiles:
  androidsupportmultidexversion.txt: '0'
usesFramework:
  ids:
  - 1
  tag: null
version: 2.7.0
versionInfo:
  versionCode: '28'
  versionName: '11.3'" > build/love_decoded/apktool.yml



cd build

apktool b -o railrush.apk love_decoded

# Signing the apk
wget -nc https://github.com/patrickfav/uber-apk-signer/releases/download/v1.3.0/uber-apk-signer-1.3.0.jar
mv uber-apk-signer-1.3.0.jar uber-apk-signer.jar
java -jar uber-apk-signer.jar --apks .



rm -f love-11.3-android-embed-aligned-debugSigned.apk
rm -f love-11.3-android-embed-aligned-debugSigned.apk.idsig
rm -f railrush-aligned-debugSigned.apk.idsig

mv railrush-aligned-debugSigned.apk railrush-signed.apk
