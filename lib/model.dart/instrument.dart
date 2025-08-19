class Instrument {
  final String img;
  final Map<String, String> task;
  bool visible;

  Instrument({
    required this.img,
    required this.task,
    this.visible = true,
  });

  static final Instrument scalpel = Instrument(
    img: 'assets/instruments/scalpel.png',
    task: {
      'uz': 'Kesish, to‘qimalarni ochish',
      'ru': 'Разрез и рассечение тканей',
      'en': 'Incision and dissection of tissues',
      'ar': 'شق وفصل الأنسجة',
      'zh': '切开并分离组织',
    },
  );

  static final Instrument forceps = Instrument(
    img: 'assets/instruments/forceps.png',
    task: {
      'uz': 'Mayda jismlarni ushlash va tortib olish',
      'ru': 'Захват и извлечение мелких предметов',
      'en': 'Grasping and extracting small objects',
      'ar': 'إمساك الأجسام الصغيرة واستخراجها',
      'zh': '夹取并取出小物体',
    },
  );

  static final Instrument cautery = Instrument(
    img: 'assets/instruments/cautery.png',
    task: {
      'uz': 'Qon ketishini to‘xtatish, yarani kuydirish',
      'ru': 'Остановка кровотечения и прижигание раны',
      'en': 'Hemostasis and cauterization of the wound',
      'ar': 'إيقاف النزيف وكي الجرح',
      'zh': '止血并烧灼伤口',
    },
  );

  static final Instrument curvedSurgicalKnife = Instrument(
    img: 'assets/instruments/curved_surgical_knife.png',
    task: {
      'uz': 'Organlarni qiyshiq kesishda ishlatiladi',
      'ru': 'Используется при косом разрезе органов',
      'en': 'Used for oblique cutting of organs',
      'ar': 'يُستخدم في شق الأعضاء بشكل مائل',
      'zh': '用于器官的斜切',
    },
  );

  static final Instrument curvedSurgicalScissors = Instrument(
    img: 'assets/instruments/curved_surgical_scissors.png',
    task: {
      'uz': 'Organlarni qiyshiq kesishda ishlatiladi',
      'ru': 'Применяется при косом разрезании органов',
      'en': 'Used in oblique incision of organs',
      'ar': 'يُستخدم في الشق المائل للأعضاء',
      'zh': '用于器官的斜向切开',
    },
  );

  static final Instrument hookedProbe = Instrument(
    img: 'assets/instruments/hooked_probe.png',
    task: {
      'uz': 'Ichki qismlardan jismlarni chiqarish',
      'ru': 'Извлечение предметов из внутренних частей',
      'en': 'Removal of objects from internal parts',
      'ar': 'إزالة الأجسام من الأجزاء الداخلية',
      'zh': '从内部部位取出异物',
    },
  );

  static final Instrument trocar = Instrument(
    img: 'assets/instruments/trocar.png',
    task: {
      'uz': 'Organ yoki bo‘shliqni teshish va suyuqlik chiqarish',
      'ru': 'Прокалывание органа или полости и выведение жидкости',
      'en': 'Puncture of an organ or cavity and drainage of fluid',
      'ar': 'ثقب عضو أو تجويف وتصريف السوائل',
      'zh': '穿刺器官或腔体并引流液体',
    },
  );

  static final Instrument suturingNeedle = Instrument(
    img: 'assets/instruments/suturing_needle.png',
    task: {
      'uz': 'Yaralarni tikish',
      'ru': 'Наложение швов на раны',
      'en': 'Suturing of wounds',
      'ar': 'خياطة الجروح',
      'zh': '缝合伤口',
    },
  );

  static final Instrument nasalForceps = Instrument(
    img: 'assets/instruments/nasal_forceps.png',
    task: {
      'uz': 'Yaralarni tikish',
      'ru': 'Наложение швов на раны',
      'en': 'Suturing of wounds',
      'ar': 'خياطة الجروح',
      'zh': '缝合伤口',
    },
  );

  static final Instrument tamponApplicator = Instrument(
    img: 'assets/instruments/tampon_applicator.png',
    task: {
      'uz': 'Burundan jismlarni olish',
      'ru': 'Извлечение предметов из носа',
      'en': 'Removal of objects from the nose',
      'ar': 'إخراج الأجسام من الأنف',
      'zh': '取出鼻腔内的异物',
    },
  );

  static final List<Instrument> instruments = [
    scalpel,
    forceps,
    cautery,
    curvedSurgicalKnife,
    curvedSurgicalScissors,
    hookedProbe,
    trocar,
    suturingNeedle,
    nasalForceps,
    tamponApplicator,
  ];
}
