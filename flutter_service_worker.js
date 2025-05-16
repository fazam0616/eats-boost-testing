'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "710600b82f35c8d6fa245217176ac7b1",
"assets/AssetManifest.bin.json": "c2041f4707f9d4b9cb041bc9fb9ca7c3",
"assets/AssetManifest.json": "bfa769fa2a4837612b33d2a32d6e1219",
"assets/assets/audios/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/Helvetica-01.ttf": "27d04ca62fb04b985ad8b4c0f343d733",
"assets/assets/fonts/Helvetica-BoldOblique-04.ttf": "31a0d1eb895dcdad8af8503a4e2951ef",
"assets/assets/fonts/MaterialIcons-Regular.otf": "eae175f6b769e20808d78013bbc782e4",
"assets/assets/fonts/Montserrat-Bold.ttf": "354dc625a35bef1b6ec00a79c6cfc0c8",
"assets/assets/fonts/Montserrat-Medium.ttf": "ee130b491bf120cdb261d27ec29e2805",
"assets/assets/fonts/Montserrat-Regular.ttf": "3fe868a1a9930b59d94d2c1d79461e3c",
"assets/assets/fonts/Montserrat-SemiBold.ttf": "fb428a00b04d4e93deb4d7180814848b",
"assets/assets/fonts/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/assets/images/3146573.png": "9ec0b20e1b5c771862392f27e0b2e016",
"assets/assets/images/4525688.png": "da0904fb13089af7d97eb1058ccd0151",
"assets/assets/images/6427059.png": "50972152eeeb534ddfbec5026b903ec1",
"assets/assets/images/6706908.png": "a1b400ef03d38135b52eb42e6d82764a",
"assets/assets/images/7486754.png": "2a784e3b75445760a46b1b71073b5f7c",
"assets/assets/images/app_launcher_icon.png": "1af1b9e520365df45e840682dced5d13",
"assets/assets/images/background-798289_1280.webp": "c4f5aa8d98a33716722afd70388d6849",
"assets/assets/images/cards.png": "fd54f808ab5274f6c77ee65c620e9d7a",
"assets/assets/images/EatsBoost_Logo_(Consumer).png": "8e9503a570d6a6b410fd489defb88c56",
"assets/assets/images/EatsBoost_Logo_(Consumer)_(1).png": "8e9503a570d6a6b410fd489defb88c56",
"assets/assets/images/EatsBoost_Logo_(Consumer)_(1)_(1).png": "1af1b9e520365df45e840682dced5d13",
"assets/assets/images/EatsBoost_Logo_(General).png": "cc2039598ce32c202e3e84fccfd18b18",
"assets/assets/images/equals.png": "ca024a6db0f52286abe2a872b39b241e",
"assets/assets/images/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/image%2520130.png": "c65628ba6d71c4fff8c04c0a974c4510",
"assets/assets/images/image%2520207.png": "df58c52e637f790e0e300e227a099d78",
"assets/assets/images/image_130.png": "09b19758087d628905416333b56375a7",
"assets/assets/images/image_187.png": "67555781dd54884297346cce43ce9279",
"assets/assets/images/image_193.png": "a44954bcdeb2a8e2036fd2c1bf4f78e9",
"assets/assets/images/ON-BRAM1_logo.png": "35a66a81db86a6ffe4a9808c9552d04c",
"assets/assets/images/Pizza.jpg": "3930d47fdae28f93b151af8c120829d2",
"assets/assets/images/plate.png": "92171efda71a1b1858adecef82202bee",
"assets/assets/images/Screenshot_2025-01-30_at_11.29.20_PM-removebg-preview_(1).png": "1027969c12f47b406f0e7899fae06bee",
"assets/assets/images/Screenshot_2025-01-30_at_11.29.20_PM.png": "5609029e4649e18e291fc4a6ea5f5caf",
"assets/assets/images/Screenshot_2025-01-31_at_11.21.00_AM.png": "a66633518d0c4f8e918bf909477403bd",
"assets/assets/images/Screenshot_2025-01-31_at_2.43.37_PM.png": "efb9c6a21e9fc814ced5bfdc166099b6",
"assets/assets/jsons/Animation_-_1740981916434.json": "ffadea5c0252ae126d943fbc0e8f359d",
"assets/assets/jsons/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/pdfs/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/rive_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/videos/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/FontManifest.json": "14c6eb3acd58d9dcafe605310f276ab2",
"assets/fonts/MaterialIcons-Regular.otf": "eae175f6b769e20808d78013bbc782e4",
"assets/NOTICES": "5fecf80c330932d9984d7093a7e93e78",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "17ee8e30dde24e349e70ffcdc0073fb0",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "04f83c01dded195a11d21c2edf643455",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "2704101cb06ce66e2000356a312be25c",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "23514907bd33ec0994b8ff2ae85e26d4",
"icons/app_launcher_icon.png": "1af1b9e520365df45e840682dced5d13",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "47be2fbac6113fd1c6e327a49a258917",
"/": "47be2fbac6113fd1c6e327a49a258917",
"main.dart.js": "5b52935ee6f3294532178b8d203464b2",
"version.json": "52b6beee48cc27888fb3291ef1959d2a"};
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
