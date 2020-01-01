package com.example.app1

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        FlutterEvents.start(this);

        // val channel = MethodChannel(flutterEngine.messenger(), "com.jarvanmo/fluwx");
        // channel.setMethodCallHandler(FluwxPlugin())
    }
}