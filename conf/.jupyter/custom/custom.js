define([
    'base/js/namespace',
    'base/js/events'
    ],
    function(IPython, events) {
        events.on("app_initialized.NotebookApp",
            function () {
                IPython.Cell.options_default.cm_config.lineNumbers = true;
            }
        );
    }
);