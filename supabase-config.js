// Fill these values from Supabase Project Settings > API.
window.SUPABASE_URL = window.SUPABASE_URL || '';
window.SUPABASE_ANON_KEY = window.SUPABASE_ANON_KEY || '';
if (window.SUPABASE_URL && window.SUPABASE_ANON_KEY && window.supabase) window.supabaseClient = window.supabase.createClient(window.SUPABASE_URL, window.SUPABASE_ANON_KEY);
