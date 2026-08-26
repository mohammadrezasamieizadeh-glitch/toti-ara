بستهٔ آرا، نسخهٔ v2

مراحل انتشار:
۱. ZIP را extract کنید.
۲. فایل‌های داخل پوشهٔ package را مستقیماً در ریشهٔ مخزن GitHub Pages آپلود کنید؛ خود ZIP را آپلود نکنید.
۳. index.html قدیمی و فایل‌های قدیمی ریشه را حذف/جایگزین کنید.
۴. شاخهٔ انتشار GitHub Pages را روی ریشهٔ همین شاخه بگذارید، صبر کنید Action تمام شود و cache مرورگر را پاک کنید.
اگر هنوز header، کارت یا footer قدیمی دیده می‌شود، index.html قدیمی در ریشه سرو می‌شود، نه نسخهٔ v2.

Supabase:
۱. در supabase-config.js مقدار SUPABASE_URL و SUPABASE_ANON_KEY را از Project Settings > API وارد کنید.
۲. کل supabase.sql را در SQL Editor اجرا کنید.
۳. حساب ایمیل/رمز بسازید و از admin.html وارد شوید. پنل، محصول، تصویر را در bucket عمومی product-images و رکورد product_images ذخیره می‌کند.
۴. برای نوشتن داده‌ها باید کاربر authenticated باشد. دسترسی عمومی فقط خواندن است.

صفحهٔ اصلی فقط پوستر hero.png است و مسیرها از hash خوانده می‌شوند.

راهنمای نسخهٔ v2:
- همهٔ فایل‌های ریشهٔ این پوشه را با فایل‌های ریشهٔ سایت جایگزین کنید؛ فقط index.html یا فقط supabase-config.js را جداگانه جایگزین نکنید.
- پس از انتشار، یک hard refresh انجام دهید (در موبایل cache سایت/مرورگر را پاک کنید).
- اگر قبلاً انجام نشده، کل supabase.sql را در Supabase Dashboard > SQL Editor اجرا کنید.
- صفحهٔ عمومی در صورت بسته بودن CDN از REST API استفاده می‌کند. پنل admin.html برای ورود، ذخیره و آپلود به یکی از CDNهای رسمی نیاز دارد.
