طوطی آرا | بسته آماده GitHub Pages

محتویات
این بسته شامل index.html، admin.html، supabase-config.js، supabase.sql، hero.png و فایل‌های راهنماست. صفحه عمومی فقط تصویر مرجع را تمام‌عرض نمایش می‌دهد و نواحی نامرئی قابل‌دسترسی روی تصویر، مسیرهای hash را فعال می‌کنند.

راه‌اندازی Supabase
1. در supabase.com یک پروژه بسازید.
2. کل متن supabase.sql را در SQL Editor اجرا کنید. این اسکریپت جدول‌های products، product_images، site_sections و تنظیمات لازم، RLS و bucket عمومی product-images را ایجاد می‌کند.
3. در Storage مطمئن شوید bucket با نام product-images ساخته شده است.
4. در Project Settings > API، مقدار Project URL و کلید anon/publishable را در supabase-config.js جایگزین دو مقدار PASTE کنید.
5. برای پنل مالک، با ایمیل و رمز عبور در Authentication ثبت‌نام کنید؛ سپس admin.html را باز کنید و محصول، تصویر و بخش‌های سایت را مدیریت کنید.

انتشار در GitHub Pages
1. یک repository عمومی بسازید یا همین فایل‌ها را در repository موجود بارگذاری کنید.
2. هر هفت فایل ریشه پروژه را commit و push کنید.
3. از Settings > Pages، شاخه اصلی و پوشه / (root) را انتخاب کنید.
4. پس از انتشار، آدرس ساخته‌شده را باز کنید. مسیرهای تصویری باید نسبت به ریشه و نام hero.png باشند.

نکات
تصاویر گالری از URLهای Supabase Storage خوانده می‌شوند. اگر Supabase تنظیم نشده باشد یا داده‌ای وجود نداشته باشد، صفحه عمومی پیام خالی فارسی نشان می‌دهد و تصویر hero همچنان بدون تغییر دیده می‌شود.
