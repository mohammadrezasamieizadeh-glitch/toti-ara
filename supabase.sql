-- Optional Supabase schema for سالن پرورش طوطی آرا
-- Run in the Supabase SQL Editor. Storage can alternatively remain browser-local.
create table if not exists public.birds (
  id text primary key,
  name text not null,
  category text not null default 'سایر',
  description text not null default '',
  image text not null default 'hero.png',
  created_at timestamptz not null default now()
);
alter table public.birds enable row level security;
-- Public visitors may read published bird listings.
drop policy if exists "Public can read birds" on public.birds;
create policy "Public can read birds" on public.birds for select using (true);
-- Writes should be restricted to an authenticated admin in production.
-- Do NOT enable unrestricted anonymous insert/update/delete policies on a public project.
