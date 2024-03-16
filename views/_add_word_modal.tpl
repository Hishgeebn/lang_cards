<button type="button" class="btn btn-primary ms-3" data-bs-toggle="modal" data-bs-target="#addWord">
    + new word
</button>

<div class="modal fade" id="addWord" tabindex="-1" aria-labelledby="addWord" aria-hidden="true">
    <div class="modal-dialog">

        <div class="toast-container position-fixed bottom-0 end-0 p-3">
            <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header text-danger">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-triangle" viewBox="0 0 16 16">
                        <path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.15.15 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.2.2 0 0 1-.054.06.1.1 0 0 1-.066.017H1.146a.1.1 0 0 1-.066-.017.2.2 0 0 1-.054-.06.18.18 0 0 1 .002-.183L7.884 2.073a.15.15 0 0 1 .054-.057m1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767z"/>
                        <path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0M7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0z"/>
                    </svg>
                <strong class="ms-3 me-auto">Warning</strong>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body fw-semibold fs-6">
                    Language name cannot be empty.
                </div>
            </div>
        </div>

        <div class="modal-content">

            <div class="modal-header">
                <h1 class="modal-title fs-5" id="addWord">Add new word</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body">
                <form 
                    class="was-validated"
                    action="/add-word" 
                    method="post" 
                    name="addWordForm" 
                >
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">@</span>
                        <select
                            class="form-select form-control"
                            aria-label="select-lang"
                            name="lang_id"
                            required="Please select the language!"
                        >
                            <option value="" selected>___</option>
                            % for x in langs:
                                <option value={{ x.id }}>{{ x.name }}</option>
                            % end
                        </select>
                    </div>
                    <div class="input-group mb-3">
                        <input name="word" type="text" class="form-control" placeholder="word" aria-label="word" required>
                        <span class="input-group-text">:</span>
                        <input name="translation" type="text" class="form-control" placeholder="translation" aria-label="translation" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">add word</button>
                </form>
            </div>

        </div>
    </div>
</div>