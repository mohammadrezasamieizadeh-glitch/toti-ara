/* Optional Supabase helper. Fill in project URL + anon key to enable cloud persistence.
   The website works without this file configured and uses browser localStorage. */
(function(global){
  const config = { url: '', anonKey: '', table: 'birds' };
  const ready = () => !!(config.url && config.anonKey && global.supabase && global.supabase.createClient);
  let client = null;
  function getClient(){ if(!ready()) return null; if(!client) client=global.supabase.createClient(config.url,config.anonKey); return client; }
  async function listBirds(){ const c=getClient(); if(!c) return null; const {data,error}=await c.from(config.table).select('*').order('created_at',{ascending:false}); if(error) throw error; return data; }
  async function saveBird(bird){ const c=getClient(); if(!c) return null; const {data,error}=await c.from(config.table).upsert(bird).select().single(); if(error) throw error; return data; }
  async function deleteBird(id){ const c=getClient(); if(!c) return null; const {error}=await c.from(config.table).delete().eq('id',id); if(error) throw error; return true; }
  global.TotiAraSupabase={config,ready,getClient,listBirds,saveBird,deleteBird};
})(window);
