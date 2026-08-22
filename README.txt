طوطی آرا | بسته آماده انتشار در GitHub Pages

راه‌اندازی Supabase
1. یک پروژه Supabase بسازید.
2. محتوای supabase.sql را کامل و یک‌جا در SQL Editor اجرا کنید. این فایل جدول‌های products و site_settings، RLS، policyها و bucketهای عمومی product-images و site-assets را می‌سازد.
3. در Authentication > Users یک کاربر بسازید. ایمیل و رمز این کاربر برای ورود به admin.html است.
4. آدرس پروژه و کلید عمومی anon/publishable را در supabase-config.js وارد کنید.
5. اگر ساخت bucketها به‌دلیل محدودیت دسترسی SQL انجام نشد، در Storage > Buckets دو bucket عمومی با نام‌های product-images و site-assets بسازید و policyهای storage موجود در supabase.sql را اجرا کنید.

انتشار و استفاده
1. هر شش فایل ریشه این بسته را در ریشه مخزن GitHub آپلود کنید: index.html، admin.html، supabase-config.js، supabase.sql، README.txt و hero.png.
2. GitHub Pages را برای شاخه موردنظر فعال کنید و index.html را باز کنید.
3. برای مدیریت محصولات و تنظیمات سایت، admin.html را باز کرده و با کاربر Auth وارد شوید. از همان‌جا محصول را اضافه، ویرایش، حذف یا فعال/غیرفعال کنید و تنظیمات singleton را ذخیره کنید.

نکات
- hero.png تصویر پیش‌فرض و مستقل بسته است؛ تصاویر آپلودشده از Storage با URL عمومی نمایش داده می‌شوند.
- anon/publishable key برای کلاینت عمومی است؛ امنیت عملیات نوشتن با RLS و نیاز به ورود Auth تأمین می‌شود.
- این بسته به فایل‌های تصویری خارج از ZIP وابسته نیست.
