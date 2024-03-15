% rebase('base.tpl', title='bottle app')
<div class="container">

  <div class="d-flex flex-row my-5">
    <div class="input-group" style="width: 30rem;">
        <select
            class="form-select form-control"
            aria-label="select-lang"
        >
          % for x in langs:
              <option value={{ x.id }}>{{ x.name }}</option>
          % end
        </select>
      <span class="input-group-text">@</span>
      <input type="text" class="form-control" placeholder="Search" aria-label="Server">
      <button class="btn btn-outline-primary" type="button" id="button">sss</button>
    </div>

    % include("_add_lang_modal.tpl")
  </div>
</div>
