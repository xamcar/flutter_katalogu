# Flutter Katalog

Ürün katalogund göz atmak, ürünleri sepete eklemek ve ödeme işlemlerini yönetmek için tasarlanmış bir Flutter uygulamasıdır.

## Proje Açıklaması

Bu uygulama aşağıdaki özellikleri içerir:
- Ürünlerin listelendiği ana sayfa
- Ürün detaylarının görüntülendiği detay sayfası
- Sepete ürün ekleme/çıkarma özelliği
- Adres ve ödeme bilgilerinin girildiği ödeme sayfası
- Başarılı ödeme onayı ekranı

## Gereksinimler

- **Flutter Sürümü**: 3.41.0 veya üstü
- **Dart Sürümü**: 3.11.0 veya üstü

## Çalıştırma Adımları

### 1. Projeyi Klonla
```bash
git clone <repository-url>
cd flutter_katalog
```

### 2. Bağımlılıkları Yükle
```bash
flutter pub get
```

### 3. Uygulamayı Çalıştır
```bash
flutter run
```

### 4. (Opsiyonel) APK Oluştur
```bash
flutter build apk --split-per-abi
```

## Kullanılan Paketler

- `http: ^1.6.0` - API istekleri için

## Ekran Görüntüleri

### Ana Sayfa
Ürünlerin grid formatında listelendiği ana sayfa. Mac, iPhone gibi ürünleri göz atabilirsiniz.

![Katalog Listesi](https://raw.githubusercontent.com/xamcar/flutter_katalogu/main/screenshots/home-screen.png)

### Sepet Sayfası
Seçilen ürünlerin görüntülendiği, fiyat özeti ve siparişi tamamla butonunun olduğu sayfa.

![Sepet](https://raw.githubusercontent.com/xamcar/flutter_katalogu/main/screenshots/cart-screen.png)

### Ödeme Sayfası
Adres ve ödeme bilgilerinin girildiği sayfası. Her bölüm açılıp kapanabilir.

![Ödeme Bilgileri](https://raw.githubusercontent.com/xamcar/flutter_katalogu/main/screenshots/payment-screen.png)

### Ürün Detay Sayfası
Seçilen ürünün detaylı bilgilerinin gösterildiği sayfa.

![Ürün Detayı](https://raw.githubusercontent.com/xamcar/flutter_katalogu/main/screenshots/product-detail.png)


