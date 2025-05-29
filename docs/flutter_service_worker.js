'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "5ba876ad953e0076809528ff8b991770",
"version.json": "91653f7ad09623d06041199a3fd6003b",
"index.html": "79fe74d87d781f1724a4dbf9b60fc50e",
"/": "79fe74d87d781f1724a4dbf9b60fc50e",
"main.dart.js": "42c946a7e5fa4ad0331d1a78f8fbc804",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"favicon.png": "d38448463ead2efa75db83529cf05e96",
"icons/Icon-192.png": "97f132dc688115f463832ef6c7505af0",
"icons/Icon-maskable-192.png": "97f132dc688115f463832ef6c7505af0",
"icons/Icon-maskable-512.png": "e34896619d8e943d0b0f16b6405f65af",
"icons/Icon-512.png": "e34896619d8e943d0b0f16b6405f65af",
"manifest.json": "a6b19ea3bcd80283a38e59c8987e914e",
"assets/AssetManifest.json": "dd1921327968c84d565ddb304e339347",
"assets/NOTICES": "6509adc268fe9ee8deefc88c6fe3a93e",
"assets/FontManifest.json": "d883368e99cbd6383708f0a85a773fe6",
"assets/AssetManifest.bin.json": "582b4d0ca79b5644d13f0f2c3566c76f",
"assets/packages/uicons_solid_straight/font/uicons_solid_straight.ttf": "61f1a517a0b28de93154f6f58fed8cfc",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b93248a553f9e8bc17f1065929d5934b",
"assets/packages/uicons_regular_rounded/font/uicons_regular_rounded.ttf": "fe1a0d4695cd3af92ccb8bebe07b37d0",
"assets/packages/uicons_bold_rounded/font/uicons_bold_rounded.ttf": "57b7148925788147563f064dfaedbf79",
"assets/packages/uicons_solid_rounded/font/uicons_solid_rounded.ttf": "10e61be76e22afc668c28a1ef16496e9",
"assets/packages/uicons_regular_straight/font/uicons_regular_straight.ttf": "02b228a3eb26b1cd618618098f93ee6a",
"assets/packages/uicons_bold_straight/font/uicons_bold_straight.ttf": "ec78a205ff3677b4db23873b9da6b6d1",
"assets/packages/uicons_brands/font/uicons_brands.ttf": "579a47c46f2f8dbd90ea1ac923785f3f",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "a21bb57353557bdb1aa973700eaf4a66",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/images/recharge.png": "49436c34c95269e582b8e34bdce3d2b9",
"assets/assets/images/exchange.png": "36ea46b9c16fafdd97ed94f20fdc4165",
"assets/assets/images/headshot.jpeg": "d942bd93e81552774044c2306660670f",
"assets/assets/images/more.png": "cfe6c35d632f7d00dee189e5560ba6ee",
"assets/assets/images/trade.png": "ee5c9f5b77fde6bdea79dd095c14b290",
"assets/assets/images/virtual%2520card.png": "5e90848cf681b1612c693957fc4e1a92",
"assets/assets/logos/network%2520providers/airtel.jpeg": "29dfd19914cdde5143a2393e9c5341d8",
"assets/assets/logos/network%2520providers/glo.png": "c8871ba7bccc5dba5077a0693b18f021",
"assets/assets/logos/network%2520providers/9mobile.jpeg": "af63a75682408bdb6e8231ab8dc3ddcf",
"assets/assets/logos/network%2520providers/mtn.png": "54ae2ca01320d4704840a87c1f682f5e",
"assets/assets/logos/dantown_logo.png": "66be8637d575a16c2c15b930591859eb",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "9fe690d47b904d72c7d020bd303adf16",
"canvaskit/canvaskit.js.symbols": "27361387bc24144b46a745f1afe92b50",
"canvaskit/skwasm.wasm": "1c93738510f202d9ff44d36a4760126b",
"canvaskit/chromium/canvaskit.js.symbols": "f7c5e5502d577306fb6d530b1864ff86",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "c054c2c892172308ca5a0bd1d7a7754b",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.wasm": "a37f2b0af4995714de856e21e882325c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
