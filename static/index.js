const toastLiveExample = document.getElementById("liveToast")

function validateForm() {
    var lang = document.forms["Form"]["lang"].value.trim()

    if (lang == null || lang == "") {
        const toastBootstrap =
            bootstrap.Toast.getOrCreateInstance(toastLiveExample)
        toastBootstrap.show()

        return false
    }
}
