----------------------------------------------------------------
------------------Установка кодировки UTF-8---------------------
----------------------------------------------------------------
vim.opt.fileencodings = "utf-8,latin1" -- vim.opt.encoding устарело, Neovim всегда использует UTF-8



----------------------------------------------------------------
------------Установка английского языка для интерфейса----------
----------------------------------------------------------------
vim.cmd [[ language messages en_US.UTF-8 ]] -- Язык сообщений и ошибок
vim.o.helplang = "en" -- Язык для помощи (:help)
vim.o.langmenu = "en_US.UTF-8" -- Язык для меню (на всякий случай)


----------------------------------------------------------------
-----------------------Основные настройки-----------------------
----------------------------------------------------------------
vim.opt.syntax = "on"
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.backspace = { "indent", "eol", "start" }

vim.cmd("syntax on")

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.shadafile = "shada/main.shada"

vim.opt.backspace = { "indent", "eol", "start" }


----------------------------------------------------------------
---------------------Настройка ShaDa---------------------------
----------------------------------------------------------------
local shada_dir = vim.fn.stdpath("data") .. "/shada"
if vim.fn.isdirectory(shada_dir) == 0 then
  vim.fn.mkdir(shada_dir, "p")
end
vim.opt.shadafile = shada_dir .. "/main.shada"

----------------------------------------------------------------
----------Команды для открытия ссылок в браузере----------------
----------------------------------------------------------------

-- Найти в браузере Brw запрос
vim.api.nvim_create_user_command("Brw", function(opts)
    local query = table.concat(opts.fargs, " ")
    local url = "https://www.google.com/search?q=" .. vim.fn.escape(query, "#&")
    local open_cmd

    -- Определяем команду для открытия браузера в зависимости от ОС
    if vim.fn.has("mac") == 1 then
        open_cmd = "open '" .. url .. "'"
    elseif vim.fn.has("unix") == 1 then
        open_cmd = "xdg-open '" .. url .. "'"
    elseif vim.fn.has("win32") == 1 then
        open_cmd = "start " .. url
    else
        print("Не поддерживается на вашей ОС")
        return
    end

    os.execute(open_cmd)
end, { nargs = "+" })




--Tg
vim.api.nvim_create_user_command('Tg', function()
    local url = "https://t.me/Mikstyz"
    print(url)
    -- Определяем ОС и используем соответствующую команду
    local os_name = vim.loop.os_uname().sysname
    if os_name == "Windows_NT" then
        os.execute('start ' .. url)
    elseif os_name == "Darwin" then  -- macOS
        os.execute('open ' .. url)
    else  -- Linux/Unix
        os.execute('xdg-open ' .. url)
    end
end, {})

-- Перенаправления для других вариантов (начинаются с заглавной буквы)
vim.cmd([[
    command! TG Tg
]])

-- Github
vim.api.nvim_create_user_command('Git', function()
    local url = "https://github.com/Mikstyz"
    print(url)
    local os_name = vim.loop.os_uname().sysname
    if os_name == "Windows_NT" then
        os.execute('start ' .. url)
    elseif os_name == "Darwin" then  -- macOS
        os.execute('open ' .. url)
    else  -- Linux/Unix
        os.execute('xdg-open ' .. url)
    end
end, {})

-- Перенаправления для других вариантов
vim.cmd([[
    command! GIT Git
    command! Github Git
    command! GITHUB Git
]])



-- ChatGPT
vim.api.nvim_create_user_command('Gpt', function()
    local url = "https://chatgpt.com/"
    print(url)
    local os_name = vim.loop.os_uname().sysname
    if os_name == "Windows_NT" then
        os.execute('start ' .. url)
    elseif os_name == "Darwin" then  -- macOS
        os.execute('open ' .. url)
    else  -- Linux/Unix
        os.execute('xdg-open ' .. url)
    end
end, {})

vim.cmd([[
    command! GPT Gpt
    command! ChatGpt Gpt
    command! CHATGPT Gpt
]])

-- Grok
vim.api.nvim_create_user_command('Grok', function()
    local url = "https://grok.com/"
    print(url)
    local os_name = vim.loop.os_uname().sysname
    if os_name == "Windows_NT" then
        os.execute('start ' .. url)
    elseif os_name == "Darwin" then  -- macOS
        os.execute('open ' .. url)
    else  -- Linux/Unix
        os.execute('xdg-open ' .. url)
    end
end, {})

vim.cmd([[
    command! GROK Grok
]])

-- DeepSeek
vim.api.nvim_create_user_command('DeepSeak', function()
    local url = "https://chat.deepseek.com/"
    print(url)
    local os_name = vim.loop.os_uname().sysname
    if os_name == "Windows_NT" then
        os.execute('start ' .. url)
    elseif os_name == "Darwin" then  -- macOS
        os.execute('open ' .. url)
    else  -- Linux/Unix
        os.execute('xdg-open ' .. url)
    end
end, {})

vim.cmd([[
    command! DEEPSEAK DeepSeak
    command! Deep DeepSeak
    command! DEEP DeepSeak
]])



----------------------------------------------------------------
----------------------Системные команды-------------------------
----------------------------------------------------------------

-- Отрыть директорию файла в EX
vim.api.nvim_create_user_command('ExFolder', function()
    local file_path = vim.fn.expand('%:p:h') -- Получаем путь к папке текущего файла
    if file_path and file_path ~= "" then
        vim.cmd("Lexplore " .. vim.fn.fnameescape(file_path))
    else
        print("Не удалось определить папку файла!")
    end
end, {})





-- ОТКРЫТЬ ДИРЕКТОРИЮ В ТЕРМИНАЛЕ
vim.api.nvim_create_user_command('OpenDirT', function()
    local dir = vim.fn.expand('%:p:h') -- Получаем путь к директории текущего файла
    local os_name = vim.loop.os_uname().sysname
    if os_name == "Windows_NT" then
        os.execute('start cmd /k cd /d "' .. dir .. '"') -- Открываем cmd в нужной папке
    elseif os_name == "Darwin" then
        os.execute('open -a Terminal "' .. dir .. '"') -- Открываем Terminal на macOS
    else
        os.execute('x-terminal-emulator -e "cd ' .. dir .. ' && bash"') -- Открываем терминал на Linux
    end
end, {})

--Копирование пути фаЖйла в буфер обмена
vim.api.nvim_create_user_command('CopPat', function()
    local path = vim.fn.expand('%:p')
    vim.fn.setreg('+', path)
    print("Путь скопирован: " .. path)
end, {})


-- Создать файл Назниае.расширение
vim.api.nvim_create_user_command('Fadd', function(opts)
  local filename = opts.args
  if filename == '' then
    print('Ошибка: укажи имя файла')
    return
  end
  local f = io.open(filename, 'w')
  if f then
    f:close()
    print('Файл создан: ' .. filename)
  else
    print('Ошибка: не удалось создать файл')
  end
end, { nargs = 1 })


-- удалить файл Название расширение
vim.api.nvim_create_user_command('Fdelete', function(opts)
  local filename = opts.args
  if filename == '' then
    print('Ошибка: укажи имя файла')
    return
  end
  local ok, err = os.remove(filename)
  if ok then
    print('Файл удалён: ' .. filename)
  else
    print('Ошибка: ' .. err)
  end
end, { nargs = 1 })


-- Создание папки FfAdd
local function create_folder(foldername)
  if not foldername or foldername == "" then
    print("Please provide a folder name")
    return
  end

  -- Формируем полный путь относительно текущей директории
  local path = vim.fn.getcwd() .. "/" .. foldername
  local cmd

  -- Определяем команду в зависимости от ОС
  local os_name = vim.loop.os_uname().sysname
  if os_name == "Windows_NT" then
    cmd = 'mkdir "' .. path .. '"'
  else -- Linux, macOS
    cmd = 'mkdir -p "' .. path .. '"'
  end

  local success = os.execute(cmd)
  if success then
    print("Создана папка: " .. path)
  else
    print("Ошибка создания папки: " .. path)
  end
end

-- Удаление папки FfDelete
local function delete_folder(foldername)
  if not foldername or foldername == "" then
    print("Please provide a folder name")
    return
  end

  -- Формируем полный путь относительно текущей директории
  local path = vim.fn.getcwd() .. "/" .. foldername
  local cmd

  -- Определяем команду в зависимости от ОС
  local os_name = vim.loop.os_uname().sysname
  if os_name == "Windows_NT" then
    cmd = 'rmdir /s /q "' .. path .. '"'
  else -- Linux, macOS
    cmd = 'rm -rf "' .. path .. '"'
  end

  local success = os.execute(cmd)
  if success then
    print("Удалена папка: " .. path)
  else
    print("Ошибка удаления папки: " .. path)
  end
end

-- Регистрация команд
vim.api.nvim_create_user_command("FfAdd", function(opts)
  create_folder(opts.fargs[1])
end, { nargs = 1 })

vim.api.nvim_create_user_command("FfDelete", function(opts)
  delete_folder(opts.fargs[1])
end, { nargs = 1 })





-- Переименование файла
vim.api.nvim_create_user_command('Frename', function(opts)
    local args = vim.split(opts.args, " ") -- Разбиваем аргументы
    if #args < 2 then
        print("Ошибка: введите старое и новое имя файла!")
        return
    end
    local old_name = args[1]
    local new_name = args[2]

    if vim.fn.filereadable(old_name) == 0 then
        print("Ошибка: файл не найден!")
        return
    end

    if vim.fn.rename(old_name, new_name) == 0 then
        print("Файл переименован: " .. old_name .. " → " .. new_name)
    else
        print("Ошибка при переименовании файла!")
    end
end, { nargs = "+" })

-- Переименование папки
vim.api.nvim_create_user_command('Ffrename', function(opts)
    local args = vim.split(opts.args, " ") -- Разбиваем аргументы
    if #args < 2 then
        print("Ошибка: введите старое и новое имя папки!")
        return
    end
    local old_dir = args[1]
    local new_dir = args[2]

    if vim.fn.isdirectory(old_dir) == 0 then
        print("Ошибка: папка не найдена!")
        return
    end

    if vim.fn.rename(old_dir, new_dir) == 0 then
        print("Папка переименована: " .. old_dir .. " → " .. new_dir)
    else
        print("Ошибка при переименовании папки!")
    end
end, { nargs = "+" })







----------------------------------------------------------------
------------------------Открыть-в-------------------------------
----------------------------------------------------------------

-- ОТКРЫТЬ ДИРЕКТОРИЮ В проводнике
vim.api.nvim_create_user_command('OpenDE', function()
    local dir = vim.fn.expand('%:p:h')
    local os_name = vim.loop.os_uname().sysname
    if os_name == "Windows_NT" then os.execute('explorer ' .. dir)
    elseif os_name == "Darwin" then os.execute('open ' .. dir)
    else os.execute('xdg-open ' .. dir) end
end, {})

-- Открыть текущий файл в VsCode
vim.api.nvim_create_user_command("VsCode", function()
  local file = vim.fn.expand("%:p")
  vim.fn.jobstart({"code", file}, {detach = true})
end, {})

-- Открыть текущий файл в Vs
vim.api.nvim_create_user_command("Vstudio", function()
  local file = vim.fn.expand("%:p")
  vim.fn.jobstart({"cmd.exe", "/C", "start", "devenv", file}, {detach = true})
end, {})

-- Открыть текущий файл в Note
vim.api.nvim_create_user_command("Note", function()
  local file = vim.fn.expand("%:p")
  vim.fn.jobstart({"cmd.exe", "/C", "start", "notepad", file}, {detach = true})
end, {})

-- Открыть текущий файл в NotePad++
vim.api.nvim_create_user_command("NotePP", function()
  local file = vim.fn.expand("%:p")
  vim.fn.jobstart({"cmd.exe", "/C", "start", "notepad++", file}, {detach = true})
end, {})





----------------------------------------------------------------
---------------Запуск-и-Сборка-Проектов-------------------------
----------------------------------------------------------------

--Сборка и запуск проекта в зависимости от типа файла
function RunCurrentFile()
  local filetype = vim.bo.filetype
  local filename = vim.fn.expand("%")

  if filetype == "go" then
    vim.cmd("!go run " .. filename)
  elseif filetype == "python" then
    vim.cmd("!python " .. filename)
  elseif filetype == "cs" then
    vim.cmd("!dotnet run")
  elseif filetype == "java" then
    vim.cmd("!javac " .. filename .. " && java " .. filename:gsub("%.java$", ""))
  else
    print("🚨 Неизвестный тип файла: " .. filetype)
  end
end

-- Привязываем к Ctrl+F5
vim.api.nvim_set_keymap("n", "<C-F5>", ":lua RunCurrentFile()<CR>", { noremap = true, silent = true })

-- Привязываем к Run
vim.api.nvim_create_user_command("Run", RunCurrentFile, {})

-- Сборка проекта через команду Build
-- Функция для сборки текущего файла в зависимости от языка
function BuildCurrentFile()
  local filetype = vim.bo.filetype
  local cmd = ""

  if filetype == "go" then
    cmd = "go build %"
  elseif filetype == "python" then
    cmd = "echo 'Python не требует сборки'"
  elseif filetype == "java" then
    cmd = "javac %"
  elseif filetype == "cs" then
    cmd = "dotnet build"
  else
    print("Неизвестный тип файла: " .. filetype)
    return
  end

  vim.cmd("!" .. cmd)
end

-- Создаём команду :Build
vim.api.nvim_create_user_command("Build", BuildCurrentFile, {})



----------------------------------------------------------------
---------------Горячие клавиши и автосохранение-----------------
----------------------------------------------------------------

-- Автосохранение при потере фокуса
vim.cmd("autocmd FocusLost * silent! wa")

-- открыть терминал снизу Ctrl+T
vim.api.nvim_set_keymap("n", "<C-T>", ":split | resize 10 | terminal<CR>", { noremap = true, silent = true })

-- закрыть терминал Ctrl+Q
vim.api.nvim_set_keymap("t", "<C-Q>", "<C-\\><C-N>:q<CR>", { noremap = true, silent = true })

-- переключение меж терминалом и редактором Ctrl+Space
vim.api.nvim_set_keymap("t", "<C-Space>", "<C-\\><C-N>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Space>", "i", { noremap = true, silent = true })

-- закрыть файл  Закрыть файл
vim.api.nvim_set_keymap("n", "<C-W>", ":q<CR>", { noremap = true, silent = true })



-- Улучшенный поиск с Ctrl+F
vim.api.nvim_set_keymap("n", "<C-f>", ":set hlsearch<CR>/\\c", { noremap = true, silent = false }) -- Начинаем поиск
vim.api.nvim_set_keymap("n", "n", "nzz", { noremap = true, silent = true }) -- Следующий с центрированием
vim.api.nvim_set_keymap("n", "N", "Nzz", { noremap = true, silent = true }) -- Предыдущий с центрированием
vim.api.nvim_set_keymap("n", "<C-g>", ":nohlsearch<CR>", { noremap = true, silent = true }) -- Очистка подсветки
vim.api.nvim_set_keymap("n", "<CR>", "<CR>zz", { noremap = true, silent = true }) -- Подтверждение с центрированием

-- Настройки поиска
vim.opt.incsearch = true  -- Инкрементальный поиск
vim.opt.hlsearch = true   -- Подсветка совпадений
vim.opt.ignorecase = true -- Игнорировать регистр
vim.opt.smartcase = true  -- Умный учет регистра




-- Вставка

-- Ctrl+Z для отмены (undo)
vim.api.nvim_set_keymap('n', '<C-z>', 'u', { noremap = true, silent = true })

-- Ctrl+Y для повтора (redo)
vim.api.nvim_set_keymap('n', '<C-y>', '<C-r>', { noremap = true, silent = true })

-- Вставка - Ctrl+Z для отмены (undo)
vim.api.nvim_set_keymap('i', '<C-z>', '<Esc>u', { noremap = true, silent = true })

-- Вставка - Ctrl+Y для повтора (redo)
vim.api.nvim_set_keymap('i', '<C-y>', '<Esc><C-r>', { noremap = true, silent = true })





-- Удаления

-- Удаление выделенного текста при нажатии Backspace в визуальном режиме
vim.api.nvim_set_keymap('v', '<BS>', 'd', { noremap = true, silent = true })

-- Настройка для F7
vim.api.nvim_set_keymap('n', '<F7>', ':exe "cd " . expand("%:p:h")<CR>', { noremap = true, silent = true })



-- Улучшенные клавиши передвижения между окнами и сохранение  
local keymap = vim.api.nvim_set_keymap  
local opts = { noremap = true, silent = true }  

keymap("n", "<C-h>", "<C-w>h", opts)  
keymap("n", "<C-j>", "<C-w>j", opts)  
keymap("n", "<C-k>", "<C-w>k", opts)  
keymap("n", "<C-l>", "<C-w>l", opts)  
keymap("n", "<C-s>", ":w<CR>", opts)  
keymap("i", "<C-s>", "<Esc>:w<CR>a", opts)  
keymap("v", "<C-s>", "<Esc>:w<CR>gv", opts)  

-- Использовать системный буфер обмена  
vim.opt.clipboard = "unnamedplus"  

-- Улучшенные сочетания для копирования, вставки и вырезания  
keymap("v", "<C-c>", '"+y', opts) -- Копирование  
keymap("i", "<C-v>", '<C-r>+', opts) -- Вставка в режиме вставки  
keymap("n", "<C-v>", '"+p', opts) -- Вставка в обычном режиме  
keymap("v", "<C-v>", '"+p', opts) -- Вставка в режиме выделения  
keymap("v", "<C-x>", '"+d', opts) -- Вырезание  

-- Выделения слов  
keymap("n", "<C-S-x>", "dd", opts) -- Вырезать всю строку  
keymap("n", "<C-S-c>", "yy", opts) -- Копировать всю строку  
keymap("n", "<C-z>", "u", opts) -- Отмена последнего действия  

-- Выделение символов
keymap("i", "<S-Left>", "<C-o>v<Left>", opts)
keymap("i", "<S-Right>", "<C-o>v<Right>", opts)
keymap("n", "<S-Left>", "v<Left>", opts)
keymap("n", "<S-Right>", "v<Right>", opts)

-- Выделение строк (Shift + Up / Down)
keymap("i", "<S-Up>", "<C-o>V<Up>", opts)
keymap("i", "<S-Down>", "<C-o>V<Down>", opts)
keymap("n", "<S-Up>", "V<Up>", opts)
keymap("n", "<S-Down>", "V<Down>", opts)


-- Быстрое выделение по словам
keymap("i", "<C-S-Left>", "<C-o>vB", opts)
keymap("i", "<C-S-Right>", "<C-o>vE", opts)
keymap("n", "<C-S-Left>", "vB", opts)
keymap("n", "<C-S-Right>", "vE", opts)


-- Ожидание нажатия Ctrl+A для выделения всего файла в режиме выделения
vim.api.nvim_set_keymap('v', '<C-a>', ':normal! ggVG<CR>', { noremap = true, silent = true })



-- Автозакрытие в режиме вставки
local function map(mode, lhs, rhs, opts)
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts or { noremap = true, silent = true })
end

map("i", "(", "()<Left>")
map("i", "{", "{}<Left>")
map("i", "[", "[]<Left>")
map("i", '"', '""<Left>')
map("i", "'", "''<Left>")



-- Обертывание выделенного текста в визуальном режиме
map("v", "(", "<Esc>`>a)<Esc>`<i(<Esc>")
map("v", "{", "<Esc>`>a}<Esc>`<i{<Esc>")
map("v", "[", "<Esc>`>a]<Esc>`<i[<Esc>")
map("v", '"', '<Esc>`>a"<Esc>`<i"<Esc>')
map("v", "'", "<Esc>`>a'<Esc>`<i'<Esc>")



-- Умный Enter для {}
map("i", "<CR>", [[v:lua.smart_cr()]], { expr = true, noremap = true })
_G.smart_cr = function()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  if line:sub(col, col + 1) == "{}" then
    return "\r\n\r\027O" -- Enter, новая строка, Esc, вставка выше
  end
  return "\r"
end

----------------------------------------------------------------
----------------------Команды Для конфига-----------------------
----------------------------------------------------------------


-- Открыть конфиг файл cfg
vim.api.nvim_create_user_command("Cfg", function()
  vim.cmd("edit $MYVIMRC")
end, {})

-- Быстро все скачать MksInstall
vim.api.nvim_create_user_command("MksInstall", function()
  vim.cmd("Pasker install")
  vim.cmd("MasonInstall --force omnisharp gopls jdtls pyright json-lsp sqlls")
end, {})


-- Быстро все обновить MksUpdate
vim.api.nvim_create_user_command("MksUpdate", function()
  vim.cmd("Pasker update")
  vim.cmd("MasonUpdate")
end, {})




----------------------------------------------------------------
----------------------Команды Docker----------------------------
----------------------------------------------------------------

-- Проверка наличия файла docker-compose.yml перед выполнением команды
local function has_docker_compose()
  local cwd = vim.fn.expand('%:p:h')
  local file = cwd .. '/docker-compose.yml'
  return vim.fn.filereadable(file) == 1
end

-- Docker - run сборка и запуск
vim.api.nvim_create_user_command('DockerRun', function()
  if has_docker_compose() then
    local cwd = vim.fn.expand('%:p:h')
    vim.cmd('!cd ' .. cwd .. ' && docker-compose up --build')
  else
    print('Ошибка: docker-compose.yml не найден')
  end
end, {})

-- Docker - build сборка
vim.api.nvim_create_user_command('DockerBuild', function()
  if has_docker_compose() then
    local cwd = vim.fn.expand('%:p:h')
    vim.cmd('!cd ' .. cwd .. ' && docker-compose build')
  else
    print('Ошибка: docker-compose.yml не найден')
  end
end, {})

-- Docker - stop остановка
vim.api.nvim_create_user_command('DockerStop', function()
  if has_docker_compose() then
    local cwd = vim.fn.expand('%:p:h')
    vim.cmd('!cd ' .. cwd .. ' && docker-compose down')
  else
    print('Ошибка: docker-compose.yml не найден')
  end
end, {})

-- Docker - clear очистка
vim.api.nvim_create_user_command('DockerClear', function()
  local cwd = vim.fn.expand('%:p:h')
  vim.cmd('!cd ' .. cwd .. ' && docker system prune -f')
end, {})

-- Docker - clear run очистка и запуск
vim.api.nvim_create_user_command('DockerClearRun', function()
  if has_docker_compose() then
    local cwd = vim.fn.expand('%:p:h')
    vim.cmd('!cd ' .. cwd .. ' && docker system prune -f && docker-compose up --build')
  else
    print('Ошибка: docker-compose.yml не найден')
  end
end, {})

-- Docker name - run запуск проекта с именем
vim.api.nvim_create_user_command('DockerNameRun', function(opts)
  local cwd = vim.fn.expand('%:p:h')
  local file = cwd .. '/docker-compose.' .. opts.args .. '.yml'
  if vim.fn.filereadable(file) == 1 then
    vim.cmd('!cd ' .. cwd .. ' && docker-compose -f ' .. file .. ' up --build')
  else
    print('Ошибка: ' .. file .. ' не найден')
  end
end, {nargs = 1})


----------------------------------------------------------------
-------------------------ASCI-ART-------------------------------
----------------------------------------------------------------
vim.api.nvim_create_user_command('B21', function()
    local art = [[
⠀⠀⠀⠀⠀⠀⡇⣿⣿⣿⣿⣿
⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡿⣿⡇⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣫⣽⠶⢞⣛⣯⣭⣉⠠⣖⣉⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢀⣀⣀⡀⠀⣀⣄⢤⢷⣿⣿⣿⣿⣿
⠀⠀⠀⠀⠀⠀⢀⣦⣸⣿⣿⡏⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠁⠈⠋⣠⡶⣫⣿⣿⠟⣩⣥⣅⠐⢙⣔⣝⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿⣷⣞⣿⣯⢸⢸⣿⣿⣿⣿⣿
⠀⠀⠀⠀⠀⢠⣼⣿⣼⣿⣿⣧⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⢠⡞⠋⣸⣿⡿⣱⣿⣿⣿⣿⣮⣦⡹⣟⣷⡙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣸⣿⣿⣿⣿⣿⣿⢸⢸⣿⣿⣿⣿⣿
⠀⠀⠀⠀⠀⢸⣿⣿⡿⣿⠫⢫⣾⣿⣿⣿⣿⣿⣿⣿⢣⠁⠀⢠⡾⡜⣼⡿⡄⣠⣻⣿⠇⣿⣿⢿⢹⣷⡹⣟⢿⡜⣿⣿⣿⣿⣿⣿⣿⣿⡏⣿⣿⣿⣿⣿⣿⣿⢸⢸⣿⣿⣿⣿⣿
⠀⠀⣀⣀⡀⢀⣶⣶⣾⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⡟⡄⠀⠀⣾⣷⢳⣿⢣⢱⣿⡿⣷⢰⣿⡿⢀⢠⠣⠃⢻⡜⣿⡸⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⠘⣼⣿⣿⣿⣿⣿
⢰⣟⣿⣿⣿⣫⣯⣭⣭⡿⠡⣿⣿⣿⣿⣿⣿⣿⣿⡇⡅⡄⢠⣿⣿⢨⣿⢀⣿⡿⢑⠃⢸⢁⣿⡘⠘⣷⣠⠸⡀⣣⢧⢻⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⡇⡆⣿⣿⣿⣿⣿⣿
⠟⠛⠿⠛⠛⠻⣿⣿⣿⣷⣦⢸⣿⣿⣿⣿⣿⣿⣿⠀⠀⡇⢠⣿⣿⢸⡏⠘⠜⡱⠂⠠⢸⡼⢋⠃⠄⠙⡜⡆⡇⣇⠘⡜⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⡇⡇⣿⣿⣿⣿⣿⣿
⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⠒⠀⠁⢸⣿⣿⢙⡇⠋⠈⠀⠀⠀⡟⡵⠂⠀⠀⠀⠀⠇⠇⣿⠀⠁⢻⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⡇⡇⣿⣿⣿⣿⣿⣿
⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⡱⢛⣛⡻⢟⠿⠿⣿⠈⢠⢀⢸⢹⡹⠘⡁⠀⠀⠀⠀⠜⠈⠀⣀⠀⠀⠀⠀⠀⠀⠙⡰⡴⢺⣿⣿⣿⣿⣿⣧⣿⣿⣇⣿⣿⣿⠃⣿⣿⣿⣿⣿⣿⣿
⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⢺⣷⣶⡆⣿⡇⣿⠀⠀⢂⢘⠘⣦⠂⠁⠀⠀⠀⠀⣀⣤⣴⣂⣴⣤⣄⠀⠀⠀⠁⡇⠇⣸⣿⣿⣿⣿⣿⢹⣿⣿⣿⣿⣿⣿⢠⢸⣿⣿⣿⣿⣿⣿
⡀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣯⠘⠿⣿⣧⣿⣿⢿⠀⠀⠌⠀⠰⢹⣿⠈⠄⠠⢽⣿⣿⡿⠿⢿⣿⣿⣿⠇⠀⡄⢸⠀⢳⣹⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⢸⢸⣿⣿⣿⣿⣿⣿
⡇⠀⠀⠀⢰⡇⢸⣿⣿⣿⣿⡇⡞⣿⣮⡛⡸⣿⢸⣷⡈⠀⠀⠀⠁⠹⡁⠀⠀⠭⣿⣿⣿⣿⣾⣿⢟⣡⢂⠼⠁⠊⢠⠎⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⢸⢸⣿⣿⣿⣿⣿⣿
⡇⠀⠀⠀⠈⡇⢸⣿⣿⣿⣿⣷⡇⣄⢉⣛⣭⣿⡌⣿⣿⣿⣧⡀⢁⠀⠈⠀⠸⠷⣪⡝⠛⠟⢉⢢⡀⠵⠋⠆⣀⣰⣶⣾⣿⣿⣿⣿⣿⣿⢸⣿⣿⢻⣿⣿⡿⢸⣾⣿⣿⣿⣿⣿⣿
⣷⠀⠀⠀⠀⠁⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢗⣻⣿⣿⣿⣿⣿⣷⣀⡆⠀⠀⠈⠉⠁⠀⠸⣾⣿⣭⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿⢸⣿⣿⡇⠈⣿⣿⣿⣿⣿⣿⣿
⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡎⢿⣿⣿⣿⣿⣿⣿⡋⠅⠀⠀⠀⠀⠀⠀⠀⠈⠙⡿⠿⢿⣿⣿⣛⡿⠿⣿⣿⣿⣿⡿⣼⣿⣿⣾⣿⣿⡇⡆⣿⣿⣿⣿⣿⣿⣿
⣿⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡈⣿⣿⣿⣿⣿⠟⣫⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠢⣵⣿⣿⠿⣿⣷⡌⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⡇⡇⣿⣿⣿⣿⣿⣿⣿
⣿⡆⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣥⣾⣿⣯⣭⣾⣥⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⡎⣿⣧⢹⣿⣿⡇⣿⣿⣿⣿⣿⣿⡇⣷⣿⣿⣿⣿⣿⣿⣿
⣿⡇⠀⠀⠀⠀⠀⢙⠏⠙⠻⣿⣿⣿⣿⣿⡟⢈⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠈⢻⣿⢸⣿⢸⣿⣿⡇⣿⣿⣿⣿⣿⣿⣇⢻⣿⣿⣿⣿⣿⣿⣿
⣿⡇⠀⠀⠀⠀⠀⣂⠊⠠⡀⠉⡻⣿⣿⣿⡇⣼⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠺⠤⠌⠺⣿⣸⣿⣿⡇⣿⣿⣿⣿⣿⣿⢿⢸⣿⣿⣿⣿⣿⣿⣿
⣿⣷⠀⠀⠀⠀⠀⣭⡀⠀⠆⢠⠀⢸⣿⣿⡇⣿⣿⣿⣿⡙⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣤⡶⢢⣶⣿⣿⣿⣿⣮⡀⠛⠿⣿⡇⣿⣿⣿⣿⣿⣿⢸⢸⣿⣿⣿⣿⣿⣿⣿
⣿⣿⠀⠀⠀⠀⠀⢩⣭⠀⢰⡸⣰⢸⣿⣿⣧⢻⣿⣿⣿⣷⠸⣿⡿⠀⠀⠀⠀⢀⣤⡶⢟⣛⣛⠙⣿⣡⣿⣿⣿⣿⣿⣿⣿⣷⠘⣷⣌⠣⣿⣿⣿⣿⣿⣿⡸⣸⣿⣿⣿⣿⣿⣿⣿
⣾⣿⠀⠀⢀⣄⠀⢸⡽⣠⣼⢸⣿⣼⣿⣿⣿⢸⣿⣿⣿⣿⣇⢈⣧⠀⠀⣠⣾⠟⣵⣾⣿⣿⣿⣿⣎⢻⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣧⢻⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⡄⣄⢸⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⢸⡿⠀⠈⠻⣯⣾⣿⣿⣿⣿⣿⣿⣿⡆⢿⣿⣿⣿⣿⣿⣿⣿⠀⠛⠛⠁⢸⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⡇⣿⣾⣷⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⢹⣿⣿⣿⣿⠘⡇⠀⠀⠀⣌⠙⢿⣿⣿⣿⣿⣿⣿⢣⠈⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⡇⢿⡏⢈⣩⣝⠙⢿⣿
⠉⠉⠁⡡⠜⣿⣿⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡜⣿⣿⣿⣿⡇⢣⠀⠀⠀⠉⠻⣦⠈⠛⠿⣿⣿⣿⣾⠀⠘⢿⣿⡿⠟⠁⠀⠀⠀⢀⣄⣿⣿⠀⢈⣙⡉⠈⣑⠳⣾⣿⣿⣿⣷⣿
⢀⠴⠚⢁⡀⠸⣭⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠟⠃⠀⠃⣀⠀⠀⠀⠀⠀⠠⣴⣭⣽⠛⡉⣲⡍⠠⠀⢤⠌⠐⠆⣹⣿⣿⣿⣿
⠀⠀⠀⠄⣐⣂⡈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⡇⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⡎⠃⠀⠀⠀⠀⢠⣿⣶⣶⣶⡒⢰⣿⢁⠀⠐⠠⠆⢄⣴⣿⣿⣿⣿⣿
⠀⠀⠀⠀⣈⣥⣤⣤⣼⣷⣶⣶⣤⣌⡛⡻⢿⣿⣿⠸⣿⣿⣿⣿⣇⢿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⠿⠿⠦⠨⠶⠏⠀⣡⢴⣿⣿⣿⣿⣿⣿⣿⣿
⣴⣶⣾⢏⠩⠭⠢⠟⠛⠛⠋⢉⣉⡀⠀⢤⣤⣤⢢⢰⣿
    ]]
    for line in art:gmatch("[^\n]+") do
        print(line)
    end
end, {nargs = 0})


vim.api.nvim_create_user_command('Fuck', function()
    local art = [[
        ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⢀⠀⡰⢃⣿⡿⠁⡼⠃⣰⡟⢁⣼⠟⣰⣿⣾⠿⣿⢾⣿⣿⠟⢷⣶⢶⣶⡄⢻⣿⣿⣷⣷⡻⣯⠙
        ⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠐⠁⣼⠃⡾⡟⢀⠞⠁⣼⠋⠀⣾⠟⢠⣿⣻⣞⡿⣷⣿⠟⠎⠀⣸⣞⣻⣿⣿⡀⢹⣷⣻⢾⣷⠌⠂
        ⣻⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠐⠀⣸⠃⢸⣿⠀⡬⠀⣘⠃⠄⣸⡟⠀⣾⣿⣳⣏⣿⡿⠋⠀⢠⠆⣿⣯⢳⣻⣇⢳⠀⣿⣿⣻⣻⡆⠀
        ⣻⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠠⠠⡗⠀⣿⠃⠰⠁⢠⠏⠠⠀⡜⠀⢠⣿⣷⡿⡿⠻⠁⠀⢠⠸⠀⠿⢯⠷⢿⣯⠀⡆⢸⣿⣾⣽⡇⠀
        ⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⠄⠆⢸⠐⠀⣿⠀⠀⠀⠀⠀⠃⠘⢠⠂⢼⣿⡷⣷⠒⠀⢀⣼⣶⠀⠀⢲⡶⢰⣦⣄⠀⠃⢈⠓⠉⡈⠀⢠
        ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡂⠇⢨⠐⠀⡧⠀⡃⠀⠀⠀⠀⠀⡟⠀⣿⣿⠟⢁⠄⠠⠞⠻⢿⠂⢰⠘⡇⢸⣽⣎⡅⠀⠨⢄⠂⠁⠀⣧
        ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡃⢀⠈⠆⠀⢡⢀⠇⠀⠀⠀⠀⢰⡇⢀⣿⠏⢀⡜⢀⡄⠀⠀⠈⠀⠚⠀⠁⡞⣿⣯⠁⠀⢢⠘⠀⠀⡆⢿
        ⣿⣿⣿⣿⣿⡿⠟⠻⠿⠿⠿⠟⠇⠈⠀⠀⠀⡀⠸⣆⠠⢆⣀⢠⣿⣿⠀⠃⣰⡟⣴⣿⠀⠀⠀⠀⠀⠀⣀⠀⢸⣿⡗⠀⠀⢂⠠⢀⣾⡇⣺
        ⣿⣿⣿⣿⡏⠀⢠⣀⣀⡐⢀⠂⠀⠄⠀⠐⠀⠳⠈⣿⣶⣤⣾⣿⣿⡗⢀⣾⣿⣿⣿⣿⠀⣠⠀⡀⠀⣠⠏⢠⣿⣟⠃⠀⡐⠂⣠⠟⣿⡇⢸
        ⣿⣿⡟⠀⠄⣼⡟⠻⠛⠫⠼⢿⣶⣶⣦⣤⣄⣁⡘⠛⠛⠛⠛⠿⠷⣿⣿⣿⣿⣿⣿⣦⣀⣉⣡⣾⠏⢀⣾⡿⠂⡄⠀⣠⣾⣿⡆⢻⣯⠀
        ⢻⣿⠁⠘⢠⣿⠀⢰⣶⣶⣤⣾⡷⠀⣼⣿⣿⣿⡟⠙⢿⡟⠳⢶⣦⣤⣤⣈⣉⣉⣋⠉⠛⠙⠏⠁⢠⣾⡟⢁⡔⠀⢠⣿⣏⣷⡳⠘⣿⡀
        ⢾⣿⠀⠂⣼⣿⣄⠀⠙⢿⣯⢾⡇⠠⣿⣿⣿⣿⡇⠀⢶⡇⢀⣾⣿⣾⣷⠈⢙⠈⠛⠛⠻⠟⢶⣶⣦⣤⠀⢀⠠⠀⠸⣿⣏⡷⣿⡀⢿⡷
        ⡉⠋⠀⢠⣿⣿⣿⣿⣤⡀⠙⡿⠀⢠⣉⣉⡉⠙⠀⢸⢧⠀⢸⣿⣿⣿⡿⠀⣾⣿⣶⡆⠀⣤⣤⣴⣿⡟⠀⠨⢜⡀⠀⣿⣯⣟⣿⡇⠈⢿
        ⠀⡀⠈⢸⣏⡈⠛⠛⠛⠀⡀⠇⠀⣾⣿⣿⣿⡟⠀⡎⡎⠀⣾⣿⣿⣿⠇⠀⣿⣷⢻⠀⢠⣿⣿⣿⣿⠇⠀⠉⡆⠄⠀⢻⣿⢾⣽⣷⠀⠈
        ⠀⣶⡚⢽⣿⣿⣷⣶⣶⣿⣿⣤⣤⣿⣿⣿⣿⡃⠀⣧⣧⠀⠻⣿⣿⡝⠀⢸⣿⣯⡹⠀⣼⣿⣿⣿⡿⠀⠨⠄⠘⡥⠀⠘⣿⣯⣟⣻⡄⠀
        ⠀⢿⢇⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣤⣀⣤⣴⣿⣿⣿⠇⠀⣿⣿⣯⢰⣆⠀⠘⡰⠈⡔⢣⠀⢹⣿⣼⣳⣧⠠
        ⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⡏⠉⣹⣿⣿⣿⠿⠿⣿⠾⣿⣿⣽⣿⣿⣿⣿⣿⣿⣷⣶⣾⣿⣇⠀⣶⣾⡄⠱⡀⢘⢂⠆⠀⢻⣶⣻⣷⡈
        ⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⢠⣿⣿⣿⡿⠀⢰⣽⠀⢀⣀⠉⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⢉⣤⣦⠀⢡⠀⢎⠘⠤⠀⢻⣿⣷⣷
        ⡄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣸⣿⣿⣿⡇⠀⣼⡏⠀⣼⡿⢢⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⢸⣿⣻⠀⠌⡄⠘⢀⢆⢂⠈⢻⣿⣟
        ⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⣿⣿⣿⣿⠇⢠⣿⠃⠐⠛⠃⠂⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠐⣧⣿⠀⠘⡄⢈⠀⢎⡰⢀⠀⠻⣿
        ⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠙⠿⠿⠟⠀⣼⡞⠀⢸⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢀⡀⠻⠾⠀⠰⠐⠀⠀⣎⠰⠀⡀⠀⠙
        ⠉⠉⡙⢛⠛⠻⠿⠿⣿⣿⣿⣿⣷⣶⣶⣶⣿⣿⣇⣀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠈⠓⣀⢄⠲⣐⠆⠀⡸⢀⢣⠀⢸⠀⠀
        ⣴⣦⣤⣤⡍⣁⡐⠂⠠⠠⠉⢉⡙⠛⠛⠻⠿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠲⢍⠲⣌⡱⢌⠂⢠⡑⢌⢢⠀⢸⡇⠀
        ⣿⣿⣿⣿⡿⠿⡿⢶⠋⠑⠶⠶⠆⠠⠀⢐⠒⠀⠄⠐⢀⠠⡌⢉⡛⢛⠛⠿⠿⠿⣿⣿⣿⣿⡏⠠⠤⠤⡌⢆⠱⠉⠀⠆⡜⠤⣊⠄⣹⣇⠀
        Fuck
    ]]
    vim.api.nvim_command('echo "' .. art .. '"')
end, {nargs = 0})


vim.api.nvim_create_user_command('Rei', function()
    local art = [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣤⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣴⣿⣿⣿⡿⢿⣿⣿⣿⣭⣵⣦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡿⣿⣿⣿⡿⡛⢻⣿⠫⢿⢿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⢿⡇⣷⣻⣽⣿⣿⣦⡋⣿⡟⢿⣻⣿⣷⣹⣿⢿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⣿⣞⣿⠇⣵⣛⢮⢮⢟⡯⣷⢖⢽⢿⣿⣾⠗⢿⣜⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡜⣿⡏⠷⣃⠻⠬⢧⣵⡑⡟⣷⢍⢿⣻⣿⣿⡟⣿⣾⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡟⣟⡪⢿⣯⢤⣾⣤⡿⣐⢟⢎⣺⡻⣾⡩⢿⡇⣿⣻⢛⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠈⠊⢠⢛⡞⣿⣿⣃⣱⣻⢟⣴⠿⡥⡾⣭⢡⣿⣿⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢎⡿⣿⣿⣿⣫⣟⢁⣖⠽⡾⣺⢣⣏⣟⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠈⢣⢛⣖⣯⣾⣫⣿⣗⣨⣠⢃⠩⠐⠜⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢑⢽⡋⠿⠐⠛⠃⠉⠀⠙⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣴⣾⣿⣿⣷⣶⣤⢲⣶⣿⣶⣶⣶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⠟⢉⢻⣿⣿⣯⢻⣻⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⡧⣂⣼⣿⢩⣷⡾⣏⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⡿⣼⣿⢇⣿⣿⣿⣿⣿⡿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣬⢿⣿⣿⣿⡿⠋⠁⠈⠻⣸⣿⣿⣿⣽⣿⣟⢩⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⡿⠻⣿⣿⣯⠀⠀⠀⠀⢠⡟⣷⣿⡎⢂⣍⠻⡝⣼⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡿⣻⠐⡿⢿⣿⣧⠀⠀⠀⣾⢰⢿⣿⢡⣿⡇⣿⡿⢿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡿⣿⣿⡆⢦⣞⣿⡿⠀⠀⠀⡟⣾⣿⡟⣸⡟⢸⡟⢠⡞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣈⣹⣿⠛⢓⣃⣽⣿⠁⠀⠀⣼⣿⣿⣿⠇⣿⢃⡿⠁⠘⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣿⣿⣷⣿⣿⣿⡟⠋⠁⠀⠀⣴⣿⣿⣧⣿⣶⣦⡼⠁⠀⠀⢹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢋⠷⣿⣿⣶⣿⣷⠀⢀⠀⢰⣿⡿⣿⣟⣿⡿⠋⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⠀⠀⠀⠀⢿⡹⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⡿⠀⠀⠀⠀⣾⠄⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣯⡇⠀⠀⠀⣼⣿⣣⠀⠀⠀⠀⠀⠀⠀⠀⠀⣐⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣞⢿⣿⣿⣿⡇⠀⢁⠀⣿⣿⣯⣞⣷⣦⣄⡀⠀⠀⠀⣾⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣟⣿⣿⣿⣧⠀⠸⠀⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣾⣿⣿⣿⡆⠀⢠⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⣼⣿⣿⣿⣿⣿⣿⣳⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⡿⠟⠻⣰⣿⣿⣿⣿⢹⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⠿⠋⠀⢀⣤⣆⣿⣿⣿⣿⡾⣿⣾⢹⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ]]
    for line in art:gmatch("[^\n]+") do
        print(line)
    end
end, {nargs = 0})


vim.api.nvim_create_user_command('B22', function()
    local art = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣯⣾⣿⡿⢟⣿⠛⠉⠩⠁⠀⠀⡟⠁⠀⣀⠀⠀⠈⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠈⠢⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣾⡿⠟⠁⣐⡮⠁⠀⡐⠀⠀⠀⠀⢰⣅⠈⠀⠒⡀⡀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠐⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣰⡿⠋⠀⠀⠀⡬⠁⠀⡐⠀⠀⠀⠀⠀⠀⠟⢂⠀⠀⠀⠈⠂⡀⠀⠀⠀⠈⠙⢿⣿⣻⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠈⢳⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣲⠏⠀⠀⠀⠠⡙⠀⠀⢀⠁⠀⠀⠀⠀⠀⠀⠐⡈⠑⡀⠀⠀⠀⠈⠢⡀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠬⠁⠀⢀⠈⠀⢠⠁⠀⠀⡈⠀⠀⠀⠀⠀⠀⠀⠀⠐⡀⠈⢄⠀⠀⠀⠀⠀⢄⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠈⠦⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠁⠀⠀⠂⠀⠀⡄⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⠈⢂⠀⠀⠀⠀⠀⢂⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣗⡀⠀⠀⠀⠀⠀⠈⣇⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣨⠁⠀⠀⠄⠀⠀⢀⠀⠀⠀⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢂⠀⠀⠀⠀⠀⢂⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⡰⠀⠀⠀⠀⠀⠀⢩⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢠⡇⠀⠀⡘⠀⠀⠀⢸⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⣣⠀⠀⠀⠀⠀⠀⠀⠀⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⡇⢃⠀⠀⠀⠀⠀⠸⢆⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣨⠀⠀⢀⠁⠀⠀⠀⠀⠀⠀⠀⣼⠀⠀⠀⠀⠀⠀⢁⢀⠀⠀⠀⠀⠀⠀⠀⠈⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⡇⠋⡀⠀⠀⠀⠀⠀⣏⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢠⡇⠀⠀⡈⠀⠀⠀⠀⠀⠀⠰⢰⣿⡆⠀⠀⠀⠀⠀⠀⠄⢂⠀⠐⡀⠀⠀⠀⠀⠈⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⠈⢡⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢨⠀⠀⢀⠁⠀⠀⠀⠀⢀⠀⠆⣿⣿⣧⠀⠠⠀⠐⠀⠀⠘⡀⠠⠀⠐⣀⠀⠀⠀⠀⠘⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⠀⠈⡄⠀⠀⠀⠀⠘⠆⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣿⠀⠀⠘⠀⠀⠀⠀⠀⠸⠰⢸⣿⣿⣿⣆⠀⢂⠀⠀⠀⠀⠐⡀⠐⠀⠐⠑⠀⠀⠈⠄⠐⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⠀⠀⢁⠀⠀⠀⠀⠀⡆⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⡊⠀⠀⡀⠀⠀⠀⠀⠀⢐⢳⣾⣿⣿⣿⣿⡌⠌⣆⠀⠀⠀⠀⠐⠀⠈⠂⠈⢀⠢⡀⠀⢂⢡⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⠀⠀⠀⠀⠀⠀⠀⠣⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⡅⠀⠀⡇⠀⡀⠀⠀⠀⢰⣧⣿⣿⣿⣿⣿⣿⣄⠚⢆⠀⠀⠀⠀⠈⢄⠀⠀⠑⠀⠁⡀⠀⠀⠂⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⡆⠀⠀⡆⡆⡔⠄⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣿⠀⠃⢸⢀⡇⠀⠀⠠⠈⣻⣿⣿⣿⣿⣿⣿⣿⣦⠙⡧⡀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠈⠀⡀⢀⢲⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⢸⠆⠀⠀⡇⢰⠀⢳⠁⢷⠗⡀⠀⠀
⠀⠀⠀⠀⠀⠀⢹⢰⠀⠈⣸⢰⠀⠀⠀⠒⡹⣿⣿⣿⣿⣿⣿⢿⣿⣷⣜⣮⣦⠀⠀⠀⠀⠀⠀⠈⠊⠀⠀⠀⢄⠀⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⢤⢸⠀⠀⠀⡇⢸⢰⣾⢠⠆⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠸⢸⠆⠀⢡⢀⠃⠀⠀⢀⠱⡹⣿⣿⣿⣿⣯⣿⣼⣹⣻⣮⣿⣿⡦⡀⠀⡀⠐⠄⠀⠈⠢⡢⢀⠀⠠⡣⡀⠀⠀⠀⠀⠀⠀⠀⡿⢸⠀⠀⠀⡇⠸⢘⠙⣾⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢸⣾⣯⣶⠀⢸⠎⠄⡀⠈⡷⣼⣌⢻⣿⣿⣿⠿⢻⠩⠁⠀⠈⠑⢖⠠⠀⠠⠔⢄⠀⢌⠐⠨⠢⠁⠣⠂⠰⢠⣄⠀⠀⠀⠀⢠⡙⡈⠀⠀⠀⣌⢀⢸⠀⠏⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢹⣁⠱⡇⢸⢰⡘⢇⢄⢡⠈⢿⣷⠟⠋⠀⠀⠀⢅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠂⡝⡰⢠⠄⣐⡆⠀⢀⠀⠈⠀⠂⢠⢲⢡⠃⠀⠀⣰⠂⣸⡆⠘⠃⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠙⠦⢩⣆⢼⢡⠈⠂⠱⢕⠌⡅⠀⢀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠂⠁⠊⠔⣣⣀⣀⣀⠸⠀⣠⢏⡲⡉⠀⠠⢠⡏⢠⣗⠁⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢧⢯⣛⣥⠀⠀⠂⠈⠩⢊⠀⠀⠀⠀⠀⢀⡀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢁⣵⠉⠁⠀⠄⡆⡊⣜⡚⡔⠀⢠⡵⣿⢠⠯⠂⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢊⡎⠙⢓⠄⠀⢆⠀⠑⠱⢄⠀⠀⠀⠁⢃⡀⠀⠉⠀⠀⠀⠀⠀⠀⠀⠀⢀⢐⠚⠹⠀⡀⣨⢰⡀⢨⡣⡞⣠⡰⠉⢀⣭⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢧⠤⠢⠽⠦⢈⠑⢦⢀⠳⡅⡠⡀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⡠⣐⠁⡂⢀⢃⣔⣔⣇⢛⢣⡜⣷⠮⡧⠃⠈⢐⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢣⡆⠀⢠⠈⠑⠊⣾⣺⢳⣿⠙⢲⣄⡀⠀⢀⣀⣤⡔⢻⡔⠃⠁⣀⡔⢹⡏⢹⣿⠁⠙⣷⣟⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⡄⣴⠾⠟⣴⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠟⠃⣿⣿⡅⠘⠈⠉⠉⠁⠀⠀⠀⠃⠛⠃⢸⣷⣼⡏⠀⠀⠈⠻⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣠⠤⢓⣵⣾⣿⣷⣄⠈⢘⠲⣠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣷⣶⣶⣶⣤⣤⣤⣤⣶⣶⣶⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢀⡤⠓⠁⣰⡿⣽⢾⣟⣿⣿⣧⡄⡘⠢⡟⣧⣠⡀⠀⠀⢀⡀⣀⣴⣁⠟⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠟⠁⢀⣾⢯⣟⣽⣻⣞⡿⣿⣿⣿⣮⣳⣜⣻⣿⣷⠒⠊⠉⠁⣠⣴⣶⣦⣤⣙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣗⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⢤⣤⣠⠀⠀⠀⠀⠀
⠀⡠⢟⣞⣯⣞⣷⣻⣾⣿⣿⣿⣿⣿⣿⣾⣷⣿⢿⣵⣤⣶⣿⣿⡿⣿⣿⣿⣿⣾⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡴⣠⠀⢀⣠⠠⠒⠒⠒⠒⠋⣰⣿⡿⣿⣷⣴⠀⠀⠀
⢀⠝⣸⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢯⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡐⣉⠯⣄⠀⠀⠀⠀⠀⣴⣿⢯⣿⢷⣿⣿⣷⡂⠀
⢈⢠⣿⣽⣻⣿⢿⣯⣿⣽⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣵⣫⡽⣷⠀⢀⣠⣾⡿⣯⣿⣾⣿⣿⣟⣿⣿⡄
⠀⣼⣷⣻⣿⣾⣿⣯⣿⣯⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⡽⣧⠛⠿⣿⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿
⢠⣿⡽⣟⣷⣿⣿⣿⣷⣿⡿⣿⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣯⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣬⣟⣯⣿⣿⣿⣿⣿⣿⣿⣿
    ]]
    for line in art:gmatch("[^\n]+") do
        print(line)
    end
end, {nargs = 0})




vim.api.nvim_create_user_command('HelloKitty', function()
    local art = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠒⠦⣄⣠⠶⠞⠳⣆⠀⠀⠀⠀
⠀⠀⠀⣴⠛⠛⠛⠲⢦⣤⡴⠶⠶⢶⠏⠀⢀⣄⣹⣇⡀⠀⠀⣻⡀⠀⠀⠀
⠀⠀⠀⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠂⠀⢿⣼⠋⠀⠉⣿⣍⠉⠉⡆⠀⠀
⠀⠀⠀⢿⡤⠀⠀⠀⠀⠀⠀⠀⠀⠈⠧⠤⠤⠿⢦⣀⣤⠿⠼⠀⣰⠃⠀⠀
⠀⠀⠀⡾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⠤⠶⢿⡀⠀⠀
⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣼⡧⠤⠆
⣠⣤⢼⡧⢤⠀⠀⠀⢠⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡇⠀⠀⠀⣤⣧⣄⡀
⠀⠀⢀⡿⠉⠹⡄⠀⠈⠋⠀⠀⠀⣴⠒⡆⠀⠀⠀⠀⠀⠀⠀⣀⣼⠁⠀⠀
⢠⡞⠉⠛⠀⠀⠹⠶⠶⣄⠀⠀⠀⠈⠉⠀⠀⠀⠀⠀⠀⠀⣀⠾⠉⠙⠒⠀
⠀⠳⢤⣀⠀⠀⢠⠖⠒⠈⢳⣀⠀⠀⢀⣀⣀⣀⣤⠤⠖⠛⠁⠀⠀⠀⠀⠀
⠀⠀⠀⢹⡀⠀⠘⠲⠖⠃⣼⠋⠉⠁⠉⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠛⠦⣤⣤⠴⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ]]
    for line in art:gmatch("[^\n]+") do
        print(line)
    end
end, {nargs = 0})



----------------------------------------------------------------
------------------------Работа-с-Git----------------------------
----------------------------------------------------------------

-- Показывает статус репозитория  
vim.api.nvim_create_user_command("GitStatus", "!git status", {})

-- Добавляет текущий файл в индекс  
vim.api.nvim_create_user_command("GitAdd", "!git add %", {})

-- Выполняет коммит (не забудь написать сообщение коммита)  
vim.api.nvim_create_user_command("GitCommit", function(opts)
    local message = opts.args
    if message == "" then
        print("❌ Ошибка: напиши сообщение для коммита!")
        return
    end
    vim.cmd("!git add . && git commit -m '" .. message .. "'")
end, { nargs = 1 })

-- Отправляет изменения в удаленный репозиторий  
vim.api.nvim_create_user_command("GitPush", "!git push", {})

-- Забирает изменения из удаленного репозитория  
vim.api.nvim_create_user_command("GitPull", "!git pull", {})

-- Показывает разницу между файлами  
vim.api.nvim_create_user_command("GitDiff", "!git diff", {})

-- Показывает лог коммитов в удобном виде  
vim.api.nvim_create_user_command("GitLog", "!git log --oneline --graph", {})

-- Показывает, кто и когда изменял строки в файле  
vim.api.nvim_create_user_command("GitBlame", "!git blame %", {})

-- Откатывает изменения в текущем файле  
vim.api.nvim_create_user_command("GitReset", "!git reset HEAD %", {})

-- Откатывает последний коммит  
vim.api.nvim_create_user_command("GitRevert", "!git revert HEAD", {})


----------------------------------------------------------------
----------------------Команды Docker----------------------------
----------------------------------------------------------------

-- открытие директории файла в котором ты находишься 
vim.api.nvim_create_user_command('ExUp', function()
  local bufname = vim.api.nvim_buf_get_name(0) -- Получаем полный путь к файлу
  if bufname == "" then
    print("Файл не открыт")
    return
  end
  local file_dir = vim.fn.fnamemodify(bufname, ':h') -- Берём его директорию
  local parent_dir = vim.fn.fnamemodify(file_dir, ':h') -- Поднимаемся на уровень выше
  vim.cmd('e ' .. parent_dir) -- Открываем родительскую директорию через ex
end, {})

----------------------------------------------------------------
----------------------Команды lua-------------------------------
----------------------------------------------------------------

-- Перезагрузка LuaConf
vim.api.nvim_create_user_command("LuaBoot", function()
    vim.cmd("source $MYVIMRC")
    print("Lua config reloaded!")
end, {})

----------------------------------------------------------------
-------------------Установка и настройка плагинов---------------
----------------------------------------------------------------

-- Установка packer.nvim (если ещё нет)
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            "git", "clone", "--depth", "1",
            "https://github.com/wbthomason/packer.nvim", install_path
        })
        vim.cmd("packadd packer.nvim")
    end
end
ensure_packer()

-- Устанавливаем нужные плагины
require("packer").startup(function(use)
    use "wbthomason/packer.nvim"           -- Менеджер плагинов
    

    -- LSP
    use "neovim/nvim-lspconfig"            -- Конфиг LSP
    use "williamboman/mason.nvim"          -- Автоматическая установка LSP серверов
    use "williamboman/mason-lspconfig.nvim" -- Связка mason + lspconfig
    

    -- Автодополнение
    use "hrsh7th/nvim-cmp"                 -- Основной плагин автодополнения
    use "hrsh7th/cmp-nvim-lsp"             -- Источник для LSP
    use "hrsh7th/cmp-buffer"               -- Источник: слова из буфера
    use "hrsh7th/cmp-path"                 -- Источник: пути файловой системы
    use "L3MON4D3/LuaSnip"                 -- Сниппеты
    use "saadparwaiz1/cmp_luasnip"         -- Интеграция luasnip с nvim-cmp
    

    -- Explorer
    use "DaikyXendo/nvim-material-icon"    -- Иконки для файлов
    use {
        "nvim-tree/nvim-tree.lua",
        requires = { "nvim-tree/nvim-web-devicons" } -- Иконки для nvim-tree
    }


    --Быстрое коментирование
    use {

        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    --Поиск по файлам
    use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
    use 'junegunn/fzf.vim'



    -- Цветовая схема
    use "Mofiqul/dracula.nvim"
end)

----------------------------------------------------------------
------------------------Настройка nvim-tree---------------------
----------------------------------------------------------------

require("nvim-tree").setup({
    on_attach = function(bufnr)
        local api = require("nvim-tree.api")

        -- Функция для переключения на директорию текущего файла
        local function toggle_file_directory()
            local current_file = vim.fn.expand("%:p")
            if current_file == "" then
                print("No file is currently open")
                return
            end
            local current_dir = vim.fn.fnamemodify(current_file, ":h")
            if api.tree.is_visible() then
                api.tree.change_root(current_dir)
            else
                api.tree.open({ path = current_dir })
                vim.cmd("vertical resize " .. math.floor(vim.o.columns * 0.95))
            end
        end

        -- Привязка к <S-e>
        vim.keymap.set("n", "<S-e>", toggle_file_directory, { silent = true, noremap = true, desc = "Toggle Nvim-Tree for current directory" })

        -- Функция для синхронизации корня с текущим файлом
        local function sync_root_with_current_file()
            local current_file = vim.fn.expand("%:p")
            if current_file ~= "" and api.tree.is_visible() then
                local current_dir = vim.fn.fnamemodify(current_file, ":h")
                local current_root = api.tree.get_nodes().absolute_path
                if current_dir ~= current_root then
                    api.tree.change_root(current_dir)
                end
            end
        end

        -- Автоматическая синхронизация при открытии файла
        vim.api.nvim_create_autocmd("BufEnter", {
            group = vim.api.nvim_create_augroup("NvimTreeAutoRoot", { clear = true }),
            callback = function()
                vim.schedule(sync_root_with_current_file)
            end,
        })

        -- Функция для перехода к выбранной директории или открытия файла
        local function set_root_to_node()
            local node = api.tree.get_node_under_cursor()
            if not node then return end
            if node.type == "directory" then
                api.tree.change_root(node.absolute_path)
            elseif node.type == "file" then
                api.node.open.edit(node)
            end
        end

        -- Функция для перехода на уровень выше
        local function go_to_parent()
            api.tree.change_root_to_parent()
            vim.schedule(sync_root_with_current_file)
        end

        local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- Используем стандартные привязки nvim-tree
        api.config.mappings.default_on_attach(bufnr)

        -- Кастомные привязки
        vim.keymap.set("n", "<CR>", set_root_to_node, opts("Set root to selected node"))
        vim.keymap.set("n", "-", go_to_parent, opts("Go to parent directory"))
    end,

    view = {
        width = 30,
        side = "left",
    },

    filters = {
        dotfiles = false,
    },

    renderer = {
        root_folder_label = false,
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = false,
            },
            glyphs = {
                default = "",
                folder = {
                    default = "▶",
                    open = "▼",
                    empty = "▷",
                    empty_open = "▽",
                },
            },
        },
        highlight_git = true,
    },
})

----------------------------------------------------------------
-------------Настройка LSP и автодополнения---------------------
----------------------------------------------------------------

-- Настройка Mason для автоматической установки LSP-серверов
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "omnisharp",  -- C#
        "gopls",      -- Go
        "jdtls",      -- Java
        "pyright",    -- Python
        "jsonls",     -- JSON
        "sqlls",      -- SQL
    },
    automatic_installation = true,
})

-- Загрузка lspconfig
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Настройка LSP для каждого языка
lspconfig.omnisharp.setup { -- C#
    cmd = { "omnisharp" },
    capabilities = capabilities,
}

lspconfig.gopls.setup { -- Go
    cmd = { "gopls" },
    capabilities = capabilities,
    settings = {
        gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
        },
    },
}

lspconfig.jdtls.setup { -- Java
    cmd = { "jdtls" },
    capabilities = capabilities,
}

lspconfig.pyright.setup { -- Python
    cmd = { "pyright-langserver", "--stdio" },
    capabilities = capabilities,
}

lspconfig.jsonls.setup { -- JSON
    cmd = { "vscode-json-language-server", "--stdio" },
    capabilities = capabilities,
}

lspconfig.sqlls.setup { -- SQL
    cmd = { "sql-language-server", "up", "--method", "stdio" },
    capabilities = capabilities,
}

-- Настройка nvim-cmp
local cmp = require("cmp")
local luasnip_ok, luasnip = pcall(require, "luasnip") -- Безопасная загрузка luasnip

if luasnip_ok then
    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        mapping = {
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<C-e>"] = cmp.mapping.close(),
        },
        sources = {
            { name = "nvim_lsp", priority = 1000 },
            { name = "luasnip", priority = 750 },
            { name = "buffer", priority = 500 },
            { name = "path", priority = 250 },
        },
    })
else
    cmp.setup({
        mapping = {
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<Tab>"] = cmp.mapping.select_next_item(),
            ["<S-Tab>"] = cmp.mapping.select_prev_item(),
            ["<C-e>"] = cmp.mapping.close(),
        },
        sources = {
            { name = "nvim_lsp", priority = 1000 },
            { name = "buffer", priority = 500 },
            { name = "path", priority = 250 },
        },
    })
    print("LuaSnip не установлен. Установите его через :PackerInstall L3MON4D3/LuaSnip")
end

-- Дополнительные возможности LSP
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true }) -- Форматирование кода
vim.diagnostic.config({ virtual_text = true }) -- Показывать ошибки в коде
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true }) -- Показать детали ошибки

-- Финальные настройки
vim.cmd [[
    syntax enable
    filetype plugin indent on
]]
vim.cmd[[colorscheme dracula]]



----------------------------------------------------------------
-----------------------------Lsp-Команды------------------------
----------------------------------------------------------------

-- Форматирование кода
vim.api.nvim_create_user_command("Format", function()
  vim.lsp.buf.format({async = true})
end, {})

-- Перезапуск LSP
vim.api.nvim_create_user_command("RestartLSP", function()
  vim.cmd("LspRestart")
end, {})





-- Удаление временных файлов
vim.api.nvim_create_user_command("Clean", function()
  vim.fn.jobstart({"cmd.exe", "/C", "del /S /Q *.tmp *.log *.bak *.swp"}, {detach = true})
end, {})

-- Comment.nvim для горячей клавиши комментариев (gcc)
require('Comment').setup()

