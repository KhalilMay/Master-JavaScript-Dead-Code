function load_log() {console.log("Lacuna:{'Load':" + (window.performance.timing.domContentLoadedEventEnd-window.performance.timing.navigationStart) +  ", 'Start':" + window.performance.timing.navigationStart + ", 'End':" +  window.performance.timing.domContentLoadedEventEnd + "}");}; window.addEventListener ? window.addEventListener("load",load_log, true) : window.attachEvent && window.attachEvent("onload", load_log);
