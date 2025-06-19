## cara buat card text sama rata dengan card lain
- tambah display: flex; flex-direction: column; ke container text
- tambah flex: 1; ke element yang ingin mendorongnya 

## cara fix slider card yang push container hingga overflow
- tambah word-break: break-word; pada container text

## cara fix recaptcha tidak bisa di klik
- pastikan parent & body tidak memiliki pointer-events: none;

## cara fix content yang keluar antialiasing edges / bleed saat browser melakukan rouding terhadap fractional pixel 
- tambahkan overflow: hidden;

## cara fix svg tidak bisa animasi di safari
- update lib dan cek kembali element