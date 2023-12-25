
const rootView = document.getElementById('root');

const restore_action = options => {
    rootView.style.backgroundColor = options.backgroundColor;
}

restore_options(restore_action);