package com.example.app1;

import android.app.Activity;
import android.content.ClipboardManager;
import android.content.Context;
import android.widget.Toast;

import io.flutter.plugins.GeneratedPluginRegistrant;

public class FlutterEvents {
    public static void start(Activity activity){
        ClipboardManager clipboardManager = (ClipboardManager)activity.getSystemService(Context.CLIPBOARD_SERVICE);
        ClipboardManager.OnPrimaryClipChangedListener onPrimaryClipChangedListener = new ClipboardManager.OnPrimaryClipChangedListener() {
          @Override
          public void onPrimaryClipChanged() {
            if(clipboardManager.hasPrimaryClip() && clipboardManager.getPrimaryClip().getItemCount() > 0){
                String word = clipboardManager.getPrimaryClip().getItemAt(0).getText().toString();
                if(word != null){
                    // GeneratedPluginRegistrant.eventSink.success(word);
                }
                // Toast.makeText(activity.getApplicationContext(), word,Toast.LENGTH_LONG).show();
            }
          }
        };
        clipboardManager.addPrimaryClipChangedListener(onPrimaryClipChangedListener);
    }
}
