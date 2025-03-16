
#### Быстрая установка всех плагинов 
- **PackerSync**
- **MasonInstall --force omnisharp gopls jdtls pyright json-lsp sqlls**

# Комбинация или команда

## Быстрые комбинации клавиш

### Работа с терминалом
- **Ctrl+T** — Открыть терминал снизу (размер 10 строк)
- **Ctrl+Q** — Закрыть терминал (в режиме терминала)
- **Ctrl+Space** — Переключение между терминалом и редактором

### Работа с файлами и окнами
- **Ctrl+W** — Закрыть текущий файл
- **F** — Открыть файловый менеджер (`:Ex`)
- **Ctrl+H** — Перейти в левое окно
- **Ctrl+J** — Перейти в нижнее окно
- **Ctrl+K** — Перейти в верхнее окно
- **Ctrl+L** — Перейти в правое окно
- **Ctrl+S** — Сохранить файл (в нормальном, вставочном и визуальном режимах)
- **F7** — Перейти в директорию текущего файла (`cd`)

### Поиск и редактирование
- **Ctrl+F** — Поиск в файле (ввод `/`)
- **Shift+Backspace** — Удалить слово слева (вставочный: `<C-w>`, нормальный: `db`)
- **Ctrl+Shift+Backspace** — Удалить всю строку (вставочный: `dd`, нормальный: `dd`)
- **Ctrl+Z** — Отменить последнее действие
- **:Files** - поиск по файлам (укажите в path прямой путь к fzf.exe)

### Копирование, вставка и вырезание
- **Ctrl+C** — Копировать выделение (в визуальном режиме)
- **Ctrl+V** — Вставить из буфера обмена (в вставочном, нормальном и визуальном режимах)
- **Ctrl+X** — Вырезать выделение (в визуальном режиме)
- **Ctrl+Shift+X** — Вырезать всю строку
- **Ctrl+Shift+C** — Копировать всю строку

### Выделение текста
- **Shift+Left** — Выделить символ слева
- **Shift+Right** — Выделить символ справа
- **Shift+Up** — Выделить строку вверх
- **Shift+Down** — Выделить строку вниз
- **Ctrl+Shift+Left** — Выделить слово слева
- **Ctrl+Shift+Right** — Выделить слово справа

### Запуск и сборка
- **Ctrl+F5** — Запустить текущий файл (в зависимости от типа: Go, Python, C#, Java)

## Быстрые команды

### Социальные сети и ссылки
- **:Tg** / **:TG** — Открыть Telegram (`https://t.me/Mikstyz`)
- **:Git** / **:GIT** / **:Github** / **:GITHUB** — Открыть GitHub (`https://github.com/Mikstyz`)
- **:Gpt** / **:GPT** / **:ChatGpt** / **:CHATGPT** — Открыть ChatGPT (`https://chatgpt.com/`)
- **:Grok** / **:GROK** — Открыть Grok (`https://grok.com/`)
- **:DeepSeak** / **:DEEPSEAK** / **:Deep** / **:DEEP** — Открыть DeepSeek (`https://chat.deepseek.com/`)

### Работа с системой
- **:OpenDE** — Открыть директорию текущего файла в проводнике
- **:OpenDirT** — Открыть директорию текущего файла в терминале
- **:CopPat** — Скопировать полный путь текущего файла в буфер обмена
- **:ExUp** — Открыть родительскую директорию текущего файла в файловом менеджере
- **:LuaBoot** — Перезагрузить конфигурацию Lua

### Docker
- **:DockerRun** — Сборка и запуск Docker Compose в текущей директории
- **:DockerBuild** — Сборка Docker Compose
- **:DockerStop** — Остановка Docker Compose
- **:DockerClear** — Очистка Docker (`docker system prune -f`)
- **:DockerClearRun** — Очистка и запуск Docker Compose
- **:DockerNameRun <имя>** — Запуск Docker Compose с указанным файлом (`docker-compose.<имя>.yml`)

### Запуск и сборка
- **:Run** — Запустить текущий файл (в зависимости от типа: Go, Python, C#, Java)
- **:Build** — Собрать текущий файл (в зависимости от типа: Go, Python, Java, C#)
