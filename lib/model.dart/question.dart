import 'instrument.dart';

class Question {
  final double x;
  final double y;
  final Map<String, String> question;
  final Instrument instrument;

  Question({
    required this.question,
    required this.instrument,
    required this.x,
    required this.y,
  });
}

final List<Question> questions = [
  Question(
    question: {
      'uz': 'O‘pka qismini kesib ochish',
      'ru': 'Вскрытие лёгочной области',
      'en': 'Incision and opening of the lung section',
      'ar': 'شق وفتح جزء الرئة',
      'zh': '切开并打开肺部区域',
    },
    instrument: Instrument.scalpel,
    x: 475,
    y: 512,
  ),
  Question(
    question: {
      'uz': 'O‘pka ichidan to‘qima namunasini olish',
      'ru': 'Взятие образца ткани из лёгкого',
      'en': 'Collection of a tissue sample from the lung',
      'ar': 'أخذ عينة نسيجية من الرئة',
      'zh': '从肺部获取组织样本',
    },
    instrument: Instrument.forceps,
    x: 480,
    y: 512,
  ),
  Question(
    question: {
      'uz': 'Qon ketayotgan joyni kuydirish',
      'ru': 'Прижигание места кровотечения',
      'en': 'Cauterization of the bleeding site',
      'ar': 'كي موضع النزيف',
      'zh': '烧灼出血部位',
    },
    instrument: Instrument.cautery,
    x: 510,
    y: 415,
  ),
  Question(
    question: {
      'uz': 'Jigarning shikastlangan qismini kesib olish',
      'ru': 'Удаление повреждённой части печени',
      'en': 'Resection of the damaged part of the liver',
      'ar': 'استئصال الجزء المتضرر من الكبد',
      'zh': '切除受损的肝脏部分',
    },
    instrument: Instrument.curvedSurgicalKnife,
    x: 440,
    y: 580,
  ),
  Question(
    question: {
      'uz': 'Ichakdagi tiqilishni ochish',
      'ru': 'Устранение кишечной непроходимости',
      'en': 'Relief of intestinal obstruction',
      'ar': 'إزالة انسداد الأمعاء',
      'zh': '解除肠梗阻',
    },
    instrument: Instrument.curvedSurgicalScissors,
    x: 475,
    y: 600,
  ),
  Question(
    question: {
      'uz': 'Ichakdagi mayda buyumni tortib olish',
      'ru': 'Извлечение мелкого предмета из кишечника',
      'en': 'Extraction of a small object from the intestine',
      'ar': 'استخراج جسم صغير من الأمعاء',
      'zh': '取出肠道内的小异物',
    },
    instrument: Instrument.hookedProbe,
    x: 445,
    y: 620,
  ),
  Question(
    question: {
      'uz': 'Buyrak ustidagi yiringni chiqarish',
      'ru': 'Удаление гноя над почкой',
      'en': 'Drainage of pus above the kidney',
      'ar': 'تصريف القيح فوق الكلية',
      'zh': '引流肾脏上方的脓液',
    },
    instrument: Instrument.trocar,
    x: 545,
    y: 630,
  ),
  Question(
    question: {
      'uz': 'Ko‘z atrofidagi shikastlangan joyni tiklash',
      'ru': 'Восстановление повреждённой области вокруг глаза',
      'en': 'Reconstruction of the damaged area around the eye',
      'ar': 'ترميم المنطقة المتضررة حول العين',
      'zh': '修复眼部周围受损区域',
    },
    instrument: Instrument.suturingNeedle,
    x: 530,
    y: 180,
  ),
  Question(
    question: {
      'uz': 'Burun ichidan tiqilib qolgan jismlarni chiqarish',
      'ru': 'Извлечение застрявших предметов из носа',
      'en': 'Removal of obstructed objects from the nose',
      'ar': 'إزالة الأجسام العالقة من داخل الأنف',
      'zh': '取出卡在鼻腔内的异物',
    },
    instrument: Instrument.nasalForceps,
    x: 455,
    y: 230,
  ),
  Question(
    question: {
      'uz': 'Jarrohlik yakunida yarani bog‘lash',
      'ru': 'Перевязка раны в конце операции',
      'en': 'Dressing the wound at the end of surgery',
      'ar': 'تضميد الجرح في نهاية العملية الجراحية',
      'zh': '在手术结束时包扎伤口',
    },
    instrument: Instrument.tamponApplicator,
    x: 480,
    y: 512,
  ),
];
