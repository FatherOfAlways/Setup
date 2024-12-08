
// var saveButton = document.getElementById('save');
const backgroundColorOption = document.getElementById('background_color');
// var statusView = document.getElementById('status');

const save_options = () => {
    // saveButton.disabled = true;
    chrome.storage.sync.set({
        backgroundColor: backgroundColorOption.value
    }, () => {
        // statusView.textContent = 'Options saved.';
        // saveButton.disabled = false;
        // setTimeout(function() {
        //     statusView.textContent = '';
        // }, 750);
    });
}

const restore_action = options => {
    backgroundColorOption.value = options.backgroundColor;
}

restore_options(restore_action);
// saveButton.addEventListener('click', save_options);
backgroundColorOption.addEventListener("change", save_options, false);