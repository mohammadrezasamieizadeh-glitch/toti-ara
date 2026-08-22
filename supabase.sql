-- SQL مستقل پروژه آرا؛ اجرای مجدد seedها محتوای مدیر را بازنویسی نمی‌کند.
create extension if not exists pgcrypto;
create table if not exists public.products (id uuid primary key default gen_random_uuid(), slug text not null, name text not null, description text not null default '', price text not null default '', image_url text not null default '', emoji text not null default '🦜', available boolean not null default true, created_at timestamptz not null default now(), updated_at timestamptz not null default now());
create unique index if not exists products_slug_unique on public.products(slug);
alter table public.products enable row level security;
create table if not exists public.site_sections (key text primary key, title text not null, body text not null default '', image_url text not null default '', updated_at timestamptz not null default now());
alter table public.site_sections enable row level security;
create table if not exists public.product_images (id uuid primary key default gen_random_uuid(), product_id uuid not null references public.products(id) on delete cascade, path text not null, url text not null, alt_text text not null default '', created_at timestamptz not null default now());
alter table public.product_images enable row level security;
do $$ begin
 if not exists(select 1 from pg_policies where policyname='products_public_read') then create policy products_public_read on public.products for select using (true); end if;
 if not exists(select 1 from pg_policies where policyname='products_auth_insert') then create policy products_auth_insert on public.products for insert to authenticated with check (true); end if;
 if not exists(select 1 from pg_policies where policyname='products_auth_update') then create policy products_auth_update on public.products for update to authenticated using (true) with check (true); end if;
 if not exists(select 1 from pg_policies where policyname='products_auth_delete') then create policy products_auth_delete on public.products for delete to authenticated using (true); end if;
 if not exists(select 1 from pg_policies where policyname='sections_public_read') then create policy sections_public_read on public.site_sections for select using (true); end if;
 if not exists(select 1 from pg_policies where policyname='sections_auth_write') then create policy sections_auth_write on public.site_sections for all to authenticated using (true) with check (true); end if;
 if not exists(select 1 from pg_policies where policyname='images_public_read') then create policy images_public_read on public.product_images for select using (true); end if;
 if not exists(select 1 from pg_policies where policyname='images_auth_write') then create policy images_auth_write on public.product_images for all to authenticated using (true) with check (true); end if;
end $$;
insert into storage.buckets(id,name,public) values('product-images','product-images',true) on conflict(id) do nothing;
do $$ begin
 if not exists(select 1 from pg_policies where schemaname='storage' and policyname='product_images_public_read') then create policy product_images_public_read on storage.objects for select using (bucket_id='product-images'); end if;
 if not exists(select 1 from pg_policies where schemaname='storage' and policyname='product_images_auth_insert') then create policy product_images_auth_insert on storage.objects for insert to authenticated with check (bucket_id='product-images'); end if;
 if not exists(select 1 from pg_policies where schemaname='storage' and policyname='product_images_auth_update') then create policy product_images_auth_update on storage.objects for update to authenticated using (bucket_id='product-images') with check (bucket_id='product-images'); end if;
 if not exists(select 1 from pg_policies where schemaname='storage' and policyname='product_images_auth_delete') then create policy product_images_auth_delete on storage.objects for delete to authenticated using (bucket_id='product-images'); end if;
end $$;
insert into public.products(slug,name,description,price,emoji) values ('green','گرین‌چیک','طوطی کوچک، اجتماعی و باهوش با شخصیت پرانرژی و دوست‌داشتنی.','برای اطلاع تماس بگیرید','🦜'),('monk','راهب','پرنده‌ای باهوش و سازگار که با تعامل روزانه پیوند عمیقی می‌سازد.','برای اطلاع تماس بگیرید','🦜'),('sun','خورشیدی','پرنده‌ای پرجنب‌وجوش با رنگ‌های درخشان و روحیه‌ای اجتماعی.','برای اطلاع تماس بگیرید','🦜') on conflict(slug) do nothing;
insert into public.site_sections(key,title,body) values ('about','درباره ما','آرا مجموعه‌ای برای انتخاب آگاهانه، مراقبت درست و زندگی سالم پرندگان زینتی است.'),('care','مراقبت روزانه','آب تازه، غذای متعادل، خواب منظم و محیطی امن پایه‌های سلامت پرنده هستند.'),('contact','تماس با آرا','تلفن: ۰۹۱۰۷۴۸۸۰۱۳\nآدرس: تهران، با هماهنگی قبلی\nساعات پاسخ‌گویی: هر روز ۱۰ تا ۲۰'),('gallery','لحظه‌های آرا','تصاویر پرندگان و فضای نگهداری آن‌ها.') on conflict(key) do nothing;
