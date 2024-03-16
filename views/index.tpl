% rebase('base.tpl', title='bottle app')
<div class="container">

  <div class="d-flex flex-column my-5">
    <div class="mb-3 mx-auto">
      % include("_add_lang_modal.tpl")
      % include("_add_word_modal.tpl", langs=langs)
    </div>

      <form action="/" method="get" >
        <div class="input-group mx-auto" style="width: 30rem;">
          <select
              class="form-select form-control"
              aria-label="select-lang"
              name="lang_id"
          >
            <option value="0">___</option>
            % for x in langs:
              % if lang and int(lang) == x.id:
                <option value={{ x.id }} selected>{{ x.name }}</option>
              % else:
                <option value={{ x.id }}>{{ x.name }}</option>
              % end
            % end
          </select>
          <span class="input-group-text">@</span>
          <input name="word" type="text" class="form-control" placeholder="word translation (optinal)" aria-label="Server">
          <button class="btn btn-outline-primary" type="submit" id="button">Search</button>
        </div>
      </form>
    
  </div>

  <h4>Total words: {{ total_words }}</h4>

  <table class="table table-hover table-striped mx-auto w-75">
    <thead>
      <tr>
        <th>Language</th>
        <th>Word</th>
        <th>Translation</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      % for w in words:
        <tr>
          <td>{{ w.language.name }}</td>
          <td>{{ w.w_desc }}</td>
          <td>{{ w.translation }}</td>
          <td>
            <form action="/word/{{ w.id }}" method="delete">
              <button type="submit" class="btn btn-link text-danger p-0 m-0">Delete</button>
            </form>
          </td>
        </tr>      
      % end
      
    </tbody>
  </table>

  % if total_pages != 1:
    <nav aria-label="Page navigation" class="d-flex justify-content-center mt-3">
      <ul class="pagination">
        <li class="page-item">
          <a class="page-link" href="{{ page - 1 }}" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>
        % for i in range(1, total_pages + 1):
          % if page == i: 
            <li class="page-item active">
              <a class="page-link" href="/{{ i }}">{{ i }}</a>
            </li>
          % else:
            <li class="page-item">
              <a class="page-link" href="/{{ i }}">{{ i }}</a>
            </li>
          % ends
        % end
        <li class="page-item">
          <a class="page-link" href="{{ page + 1 }}" aria-label="Previous">
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </ul>
    </nav>
  % end
  </div>
