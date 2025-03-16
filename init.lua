-- Установка кодировки UTF-8
vim.opt.fileencodings = "utf-8,latin1" -- vim.opt.encoding устарело, Neovim всегда использует UTF-8

-- Установка английского языка для интерфейса
vim.cmd [[ language messages en_US.UTF-8 ]] -- Язык сообщений и ошибок
vim.o.helplang = "en" -- Язык для помощи (:help)
vim.o.langmenu = "en_US.UTF-8" -- Язык для меню (на всякий случай)

-- Основные настройки
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

-- ShaDa с проверкой директории
local shada_dir = vim.fn.stdpath("data") .. "/shada"
if vim.fn.isdirectory(shada_dir) == 0 then
  vim.fn.mkdir(shada_dir, "p")
end
vim.opt.shadafile = shada_dir .. "/main.shada"


-- Включаем подсветку синтаксиса
vim.cmd("syntax on")

-- Использовать пробелы вместо табов и задать ширину таба
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



-- BROWSER and URL


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



-- System
-- ОТКРЫТЬ ДИРЕКТОРИЮ В проводнике
vim.api.nvim_create_user_command('OpenDE', function()
    local dir = vim.fn.expand('%:p:h')
    local os_name = vim.loop.os_uname().sysname
    if os_name == "Windows_NT" then os.execute('explorer ' .. dir)
    elseif os_name == "Darwin" then os.execute('open ' .. dir)
    else os.execute('xdg-open ' .. dir) end
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

--Копирование пути файла в буфер обмена
vim.api.nvim_create_user_command('CopPat', function()
    local path = vim.fn.expand('%:p')
    vim.fn.setreg('+', path)
    print("Путь скопирован: " .. path)
end, {})






-- ROFL
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

vim.api.nvim_create_user_command('Sexs', function()
    local art = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠆⠀⠈⠑⡆⠀⠀⠀⠀stop wathcing porn you know you will regret it
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡄⠀⠀⠨⡇⠀⠀⠀jesus bled on the cross for you and you sit and commit lust as thanks?
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⡈⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣧⣄⣤⣤⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⣇⣠⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢀⣴⣿⣾⣿⣿⣿⣋⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡀⡀⠀
⣿⢿⣿⣿⣿⣏⡏⠛⠻⠿⢿⣯⣛⢿⡉⠛⣿⣿⣯⣿⣟⣿⣿⣿⡙⢫⡟⠙⢉⢛⢭⠋⢉⡹⠯⠭⠹⣳⣿⣟⣻⣿⣿
⠛⠛⢻⢺⠟⢻⠛⠓⠢⢤⣈⣋⣉⣉⡛⢛⡛⠚⣿⣿⣿⣿⣿⣿⣿⡏⢩⣿⣪⣌⠭⣍⣈⣠⡴⠾⠿⢿⠿⡿⡿⠫⠾
⠀⠀⢸⠸⠀⠸⠀⠀⠀⠀⠀⠀⠈⠙⡚⠿⠿⣿⡽⣿⡟⣿⢻⣿⠷⣷⡿⠛⢛⠋⠉⠀⠀⠀⠀⠁⠀⢺⠀⡇⠀⠀⠀
⠀⠀⠘⢀⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠐⠀⠐⣝⢦⣀⣿⢸⣼⢾⣿⠃⠀⠐⠀⠁⠀⠀⠀⠀⠀⠀⠘⠀⡏⠉⠀⠀
⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢧⡒⢴⣿⠾⣘⣻⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀
⠀⠀⠀⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⢬⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀
⠀⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⢸⠘⢈⡌⣸⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡞⠫⠤⣠⡴⣯⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣵⣽⣿⣾⢿⣾⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⡿⣿⣿⣻⡿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⢻⠁⠙⢿⣶⢿⣹⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⢸⢣⣤⢸⢁⣸⡿⣿⡧⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠈⡯⣿⡞⣿⡇⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣝⣿⣿⣿⡇⠇⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⡍⣿⣿⣺⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣏⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣽⣧⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣧⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣇⣸⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ]]
    for line in art:gmatch("[^\n]+") do
        print(line)
    end
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









-- DOCKER 
-- Docker - run сборка и запуск
vim.api.nvim_create_user_command('DockerRun', function()
  local cwd = vim.fn.expand('%:p:h')
  vim.cmd('!cd ' .. cwd .. ' && docker-compose up --build')
end, {})

-- Docker - build сборка
vim.api.nvim_create_user_command('DockerBuild', function()
  local cwd = vim.fn.expand('%:p:h')
  vim.cmd('!cd ' .. cwd .. ' && docker-compose build')
end, {})

-- Docker - stop остановка
vim.api.nvim_create_user_command('DockerStop', function()
  local cwd = vim.fn.expand('%:p:h')
  vim.cmd('!cd ' .. cwd .. ' && docker-compose down')
end, {})

-- Docker - clear очистка
vim.api.nvim_create_user_command('DockerClear', function()
  local cwd = vim.fn.expand('%:p:h')
  vim.cmd('!cd ' .. cwd .. ' && docker system prune -f')
end, {})

-- Docker - clear run очистка и запуск
vim.api.nvim_create_user_command('DockerClearRun', function()
  local cwd = vim.fn.expand('%:p:h')
  vim.cmd('!cd ' .. cwd .. ' && docker system prune -f && docker-compose up --build')
end, {})

-- Docker name -run запуск проекта с именем
vim.api.nvim_create_user_command('DockerNameRun', function(opts)
  local cwd = vim.fn.expand('%:p:h')
  vim.cmd('!cd ' .. cwd .. ' && docker-compose -f docker-compose.' .. opts.args .. '.yml up --build')
end, {nargs = 1})





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


-- Поиск в файле Ctrl+F
vim.api.nvim_set_keymap("n", "<C-F>", "/", { noremap = true })




-- Ctrl+Z для отмены (undo)
vim.api.nvim_set_keymap('n', '<C-z>', 'u', { noremap = true, silent = true })

-- Ctrl+Y для повтора (redo)
vim.api.nvim_set_keymap('n', '<C-y>', '<C-r>', { noremap = true, silent = true })

-- Вставка - Ctrl+Z для отмены (undo)
vim.api.nvim_set_keymap('i', '<C-z>', '<Esc>u', { noremap = true, silent = true })

-- Вставка - Ctrl+Y для повтора (redo)
vim.api.nvim_set_keymap('i', '<C-y>', '<Esc><C-r>', { noremap = true, silent = true })





-- Удаления

-- Удаление слова слева при нажатии Shift + Backspace
vim.api.nvim_set_keymap('i', '<S-BS>', '<C-w>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-BS>', 'db', { noremap = true, silent = true })

-- Удаление всей строки при нажатии Ctrl + Shift + Backspace
vim.api.nvim_set_keymap('i', '<C-S-BS>', '<Esc>ddi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-BS>', 'dd', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', 'F', ':Ex<CR>', { noremap = true, silent = true })

-- Настройка для F7
vim.api.nvim_set_keymap('n', '<F7>', ':exe "cd " . expand("%:p:h")<CR>', { noremap = true, silent = true })




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


-- перезагрузка LuaConf
vim.api.nvim_create_user_command("LuaBoot", function()
    vim.cmd("source $MYVIMRC")
    print("Lua config reloaded!")
end, {})

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

-- Дополнительные хоткеи  
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

-- Запуск и билд проекта при нахождении в нем же
-- Быстрый запуск через CTRL + F5 или же команду Run
-- Функция для запуска кода в зависимости от типа файла
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
  use "wbthomason/packer.nvim" -- Менеджер плагинов

  -- LSP
  use "neovim/nvim-lspconfig" -- Конфиг LSP
  use "williamboman/mason.nvim" -- Автоматическая установка LSP серверов
  use "williamboman/mason-lspconfig.nvim" -- Связка mason + lspconfig
  
  
  use 'DaikyXendo/nvim-material-icon'
  
  
  -- Explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }

  -- Автодополнение
  use "hrsh7th/nvim-cmp" -- Основной плагин автодополнения
  use "hrsh7th/cmp-nvim-lsp" -- Источник для LSP
  use "Mofiqul/dracula.nvim"
end)






-- Explorer
-- Настройка nvim-tree
-- Функция для настройки привязок клавиш в nvim-tree
local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function set_root_to_node()
    local node = api.tree.get_node_under_cursor()
    if not node then return end -- Защита от nil
    if node.type == "directory" then
      api.tree.change_root(node.absolute_path)
    elseif node.type == "file" then
      api.node.open.edit(node)
    end
  end

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set("n", "<CR>", set_root_to_node, opts("Set root to selected node"))
end



-- Минимальная настройка nvim-tree
require("nvim-tree").setup({
  on_attach = my_on_attach,
  view = {
    width = 30,
    side = "left",
  },
  filters = {
    dotfiles = false, -- Не показывать скрытые файлы
  },
  actions = {
    open_file = {
      quit_on_open = false,
    },
  },
})






-- Настройка nvim-tree
require('nvim-tree').setup({
  renderer = {
    icons = {
      show = {
        file = true,        -- Отключаем иконки файлов
        folder = true,       -- Включаем иконки папок
        folder_arrow = false,-- Отключаем стрелки раскрытия
      },
      glyphs = {
        default = '',        -- Оставляем пустым
        symlink = '',        -- Оставляем пустым
        git = {
          unstaged = '✗',    -- Неиндексированные изменения
          staged = '✔',      -- Индексированные изменения
          untracked = '★',   -- Неотслеживаемые файлы
        },
        folder = {
          default = '▶',     -- Закрытая папка
          open = '▼',        -- Открытая папка
          empty = '▷',       -- Пустая закрытая папка
          empty_open = '▽',  -- Пустая открытая папка
          symlink = '⤷',     -- Символическая ссылка на папку
          symlink_open = '⤶',-- Открытая символьная ссылка
        },
      },
    },
    add_trailing = false,
    highlight_git = true,
  },
  -- Кастомизация отображения через on_attach
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")

    -- Функция для кастомного рендеринга имени файла
    local function custom_renderer(node)
      if node.type == "file" then
        local ext = node.extension or "" -- Получаем расширение файла
        if ext ~= "" then
          return "." .. ext .. " " .. node.name -- Формат: .py FileName.py
        end
        return node.name -- Если нет расширения, просто имя
      end
      return node.name -- Для папок и других типов возвращаем имя как есть
    end

    -- Перехватываем стандартные привязки
    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    -- Переопределяем рендеринг
    vim.api.nvim_buf_set_option(bufnr, 'filetype', 'nvimtree')
    vim.api.nvim_create_autocmd("BufEnter", {
      buffer = bufnr,
      callback = function()
        local tree = api.tree.get_nodes()
        if tree then
          for _, node in ipairs(tree) do
            node.display = custom_renderer(node)
          end
          api.tree.reload()
        end
      end,
    })
  end,
})






-- Функция для переключения на директорию текущего файла
local function toggle_file_directory()
  local api = require("nvim-tree.api")
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
  end
end

-- Автоматическое изменение корня при открытии файла
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("NvimTreeAutoRoot", { clear = true }),
  callback = function()
    if vim.bo.buftype ~= "" then return end -- Пропускаем не-файловые буферы
    local api = require("nvim-tree.api")
    local current_file = vim.fn.expand("%:p")
    if current_file ~= "" then
      local current_dir = vim.fn.fnamemodify(current_file, ":h")
      if api.tree.is_visible() then
        api.tree.change_root(current_dir)
      end
    end
  end,
})



-- Автоматическое открытие nvim-tree при запуске Neovim
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = function() require("nvim-tree.api").tree.open() end })


-- Загружаем плагины
require("mason").setup()
require("mason-lspconfig").setup()

-- Настроим LSP
local lspconfig = require("lspconfig")

lspconfig.jdtls.setup{}   -- Java
lspconfig.omnisharp.setup{} -- C#
lspconfig.pyright.setup{} -- Python
lspconfig.jsonls.setup{} -- JSON
lspconfig.sqlls.setup{}  -- SQL

-- Настраиваем nvim-cmp
local cmp = require("cmp")

cmp.setup({
  mapping = {
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true })
  },
  sources = {
    { name = "nvim_lsp" }
  }
})

vim.cmd [[
  syntax enable
  filetype plugin indent on
]]

vim.cmd[[colorscheme dracula]]
