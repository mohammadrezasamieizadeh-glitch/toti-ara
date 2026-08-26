FIX-README.txt - تغییرات نسخه v2

- supabase-config.js اکنون ابتدا از createClient رسمی استفاده می‌کند و در نبود آن، کلاینت سبک REST با fetch می‌سازد.
- fallback از products و product_images، select و eq پشتیبانی می‌کند و پاسخ‌های {data,error} و خطاهای HTTP را به شکل Supabase برمی‌گرداند.
- index.html هنگام نبود CDN پیام قطع اتصال مسدودکننده نشان نمی‌دهد و خطای REST را به پیام خالی/قابل‌فهم گالری تبدیل می‌کند.
- admin.html ابتدا SDK رسمی را به‌ترتیب از jsDelivr و unpkg بارگذاری می‌کند و فقط در صورت شکست هر دو، پیام اختصاصی پنل مدیریت نشان می‌دهد. fallback محدود برای عملیات auth/storage استفاده نمی‌شود.
- کلید موجود همان کلید عمومی پروژه است؛ service_role اضافه نشده است.
- فایل‌های اصلی hero.png، supabase.sql و preview-notes.txt حفظ شده‌اند.

اعتبارسنجی انجام‌شده: وجود ۷ فایل top-level، قابل‌خواندن بودن HTML با HTMLParser، و بررسی نحوی بلوک‌های JavaScript با Node.js (در صورت نصب Node).
