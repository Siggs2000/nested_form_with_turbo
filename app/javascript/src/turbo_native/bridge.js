class Bridge {
    // Toggles navbar visibility in browser from Turbo Native
    static toggleNavBar() {
        const event = new CustomEvent("toggle-nav-bar")
        window.dispatchEvent(event)
        // window.alert("toggle it");
  
        // Open the side nav from the mobile app
        var link = document.getElementsByClassName("navbar-toggle");
        var link2 = link[0];
        link2.click();
    }

    static postMessage(name, data = {}) {
      // iOS
      window.webkit?.messageHandlers?.nativeApp?.postMessage({name, ...data})
  
      // Android
      window.nativeApp?.postMessage(JSON.stringify({name, ...data}))
    }
  
    static get isTurboNativeApp() {
      return navigator.userAgent.indexOf("Turbo Native") !== -1
    }
  }
  
  window.TurboNativeBridge = Bridge
  export default Bridge
  