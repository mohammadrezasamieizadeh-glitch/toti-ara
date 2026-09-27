// اطلاعات عمومی پروژه Supabase. anon/publishable key برای سایت عمومی مجاز است؛ service_role key را هرگز اینجا نگذارید.
window.SUPABASE_URL = "https://lvmhgiwbdlqeahmwculr.supabase.co";
window.SUPABASE_ANON_KEY = "sb_publishable_MgVd7Kxkst6TgfjR5Mgp3g_gosERxE6";

(function () {
  var official = window.supabase && typeof window.supabase.createClient === 'function';
  if (official) {
    window.supabaseClient = window.supabase.createClient(window.SUPABASE_URL, window.SUPABASE_ANON_KEY);
    window.supabaseFallback = false;
    return;
  }

  // Public read-only fallback for networks that block the Supabase JS CDN.
  function request(table, selection, filters) {
    var params = new URLSearchParams();
    params.set('select', selection || '*');
    (filters || []).forEach(function (filter) { params.set(filter.column, 'eq.' + String(filter.value)); });
    return fetch(window.SUPABASE_URL + '/rest/v1/' + encodeURIComponent(table) + '?' + params.toString(), {
      headers: { apikey: window.SUPABASE_ANON_KEY, Authorization: 'Bearer ' + window.SUPABASE_ANON_KEY, Accept: 'application/json' }
    }).then(function (response) {
      return response.text().then(function (text) {
        var parsed;
        try { parsed = text ? JSON.parse(text) : null; } catch (_) { parsed = null; }
        if (!response.ok) {
          var message = parsed && (parsed.message || parsed.error_description || parsed.hint) || text || ('HTTP ' + response.status);
          throw new Error(message);
        }
        return { data: parsed || [], error: null };
      });
    }).catch(function (error) { return { data: null, error: { message: error.message || String(error) } }; });
  }
  function query(table) {
    var selection = '*', filters = [];
    var builder = {
      select: function (fields) { selection = fields || '*'; return builder; },
      eq: function (column, value) { filters.push({ column: column, value: value }); return builder; },
      then: function (resolve, reject) { return request(table, selection, filters).then(resolve, reject); },
      catch: function (reject) { return request(table, selection, filters).catch(reject); }
    };
    return builder;
  }
  window.supabaseClient = { from: query };
  window.supabaseFallback = true;
  console.warn('[آرا] کتابخانه Supabase در دسترس نیست؛ گالری با REST API داخلی ادامه می‌دهد.');
})();
