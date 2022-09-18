class Constants {
  static Constants? _instance;
  static Constants get get {
    _instance ??= Constants._init();
    return _instance!;
  }

  Constants._init();

  final _TextConstant textConstant = _TextConstant();
}

class _TextConstant {
  final String register = 'Kayıt Ol';
  final String email = 'E-Mail';
  final String password = 'Şifrenizi Giriniz';
  final String login = 'Giriş';
  final String signOut = 'Oturumu Kapat';
  final String deleteAllNotes = 'Tüm Notları Sil ';
  final String settings = 'Ayarlar';
  final String addNote = 'Not Ekle';
  final String enterTitle = 'Başlık Giriniz';
  final String decription = 'Açıklama Giriniz';
  final String save = 'Kaydet';
  final String update = 'Güncelle';
  final String succes = 'İşlem Başarılı';
  final String title3Letters = 'Başlık en az 3 harfli olmalıdır.';
  final String desc10Letters = 'Açıklama en az 10 harfli olmalıdır.';
  final String allEmpty = 'Lütfen Tüm Boşlukları Doldurunuz.';
  final String savedNotes = 'Kayıt oluşturuldu';
  final String dontMatch = 'Şifreler Eşleştirilemiyor.';
  final String loginPage = 'Üye Girişi';
  final String registerPage = 'Üye Kayıt';
  final String menuPage = 'Notlarım';
}
