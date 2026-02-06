## cara buat card text sama rata dengan card lain
- tambah display: flex; flex-direction: column; ke container text
- tambah flex: 1; ke element yang ingin mendorongnya 

## cara fix slider card yang push container hingga overflow (karena teks)
- tambah word-break: break-word; pada container text

## cara fix recaptcha tidak bisa di klik
- pastikan parent & body tidak memiliki pointer-events: none;

## cara fix efek bleed karena rounding pixel devices
- biasanya karena box-shadow, ganti ke border pakai posisi absolute di :before;

## cara fix svg tidak bisa animasi di safari
- update lib dan cek kembali element

## cara atasi memory nextjs saat run dev kurang
- NODE_OPTIONS='--max-old-space-size=6096' npm run dev