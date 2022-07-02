# TestWork

<h3>Описание:</h3>

Разработать процесс авторизации пользователя в firebase по номеру телефона.

Экран со следующими элементами:

Поле ввода номера телефона. Номер должен валидироваться по формату телефонных номеров РФ: +x(ххх)ххх-хх-хх, допустимо использовать маску на поле.

Кнопка «Получить код»

После нажатия кнопки – переход к следующему экрану

Экран ввода полученного SMS-кода

Кнопка «Продолжить»

Кнопка повторной отправки кода с обратным таймером на 2 минуты

При нажатии на «Продолжить» происходит валидация кода в firebase, и полученный идентификатор отправляется в метод авторизации checkUser

При нажатии на кнопку повторной отправки кода, происходит обращение в firebase и повторная отправка кода

После успешной авторизации (ответ от checkUser 200), переход на главный экран

Главный экран состоит из двух вкладок:

Список заведений (отображается в виде плитки по 4 заведения в ряд). Список заведений получается через вызов метода getPlaces.

Заведения на карте.

При нажатии на маркер заведения, запрашивать меню заведения методом getMenu и выводить списком.

<h4>Для проверки авторизации, используются тестовые номера, код выводится в консоль</h4>
+10000000000
+10000000001
+71111111111

<h2>Стек технологий </h2>

<h4>Архитектура: MVP</h4>
<h4>Сетевое взаимодействие: URLSession</h4>
<h4>Сторонние библиотеки SDWebImage</h4>
<h4>Сервис Firebase для авторизации</h4>
<h4>Для получения данных идет взаимодействие со стороним беком, его описание было предоставлено файлом формата Postman</h4>
