آرا | بسته آماده انتشار در GitHub Pages

محتویات بسته فقط شامل index.html، admin.html، supabase-config.js، supabase.sql، README.txt و hero.png است.

راه اندازی Supabase
1. یک پروژه Supabase بسازید و SQL موجود در supabase.sql را در SQL Editor اجرا کنید.
2. در Authentication > Users > Add user یک کاربر با ایمیل و رمز بسازید.
3. در همان کاربر، Edit user و بخش App Metadata، این مقدار را ثبت کنید: {"role":"admin"}
   نقش را در App Metadata قرار دهید، نه User Metadata. بعد از آن یک بار از پنل خارج و دوباره وارد شوید.
4. فایل supabase-config.js از قبل URL و publishable key پروژه موجود را دارد. اگر پروژه عوض شد، مقادیر آن را با Project Settings > API جایگزین کنید.

انتشار در GitHub Pages
1. همه فایل های داخل این پوشه را در ریشه یک repository عمومی GitHub قرار دهید.
2. در Settings > Pages، بخش Build and deployment را روی Deploy from a branch بگذارید؛ branch اصلی و پوشه /(root) را انتخاب کنید.
3. پس از انتشار، index.html صفحه عمومی و admin.html پنل ورود مدیر است.
4. برای استفاده از دامنه GitHub Pages در Supabase، در Authentication > URL Configuration مقدار Site URL و Redirect URLs را تنظیم کنید.

تصویر hero
فایل hero.png در ریشه بسته قرار دارد و در صفحه اصلی استفاده می شود. برای جایگزینی، تصویر جدید خود را با همین نام و فرمت PNG در ریشه repository قرار دهید.

امنیت و رفتار
محصولات فقط وقتی available=true باشند در صفحه عمومی خوانده می شوند. درج، ویرایش و حذف فقط برای JWT دارای app_metadata.role=admin مجاز است. صفحه عمومی در صورت خطای Supabase، سه محصول گرین‌چیک، راهب و خورشیدی را به صورت محلی نمایش می دهد. هیچ build step یا سرور لازم نیست؛ فقط CDN رسمی supabase-js v2 استفاده شده است.
