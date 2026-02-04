# ./well-known place at root route
## ANDROID (assetlinks.json)
```
[
  {
    "relation": ["delegate_permission/common.handle_all_urls"],
    "target": {
      "namespace": "android_app",
      "package_name": "com.example.app",
      "sha256_cert_fingerprints": [
        ""
      ]
    }
  }
]
```

## IOS (apple-app-site-association)
```
{
  "applinks": {
    "apps": [],
    "details": [
      {
        "appID": "TEAMID.com.example.app",
        "paths": [ "" ]
      }
    ]
  }
}
```
