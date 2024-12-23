const DEFAULT_OPTIONS = {
    backgroundColor: '#202124'
}

const restore_options = restore_action => {
    chrome.storage.sync.get(DEFAULT_OPTIONS, restore_action);
}