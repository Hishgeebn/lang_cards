const toastLiveExample = document.getElementById("liveToast")

function validateAddLangForm() {
    var lang = document.forms["addLangForm"]["lang"].value.trim()

    if (lang == null || lang == "") {
        const toastBootstrap =
            bootstrap.Toast.getOrCreateInstance(toastLiveExample)
        toastBootstrap.show()

        return false
    }
}
