-- lua/config/options.lua

local opt = vim.opt

-- Apariencia
opt.number = true           -- Mostrar número de línea actual
opt.relativenumber = true   -- Mostrar números relativos
opt.cursorline = true       -- Resaltar la línea actual
opt.termguicolors = true    -- Colores de 24 bits
opt.signcolumn = "yes"      -- Mantener columna de signos visible
opt.showmode = false        -- No mostrar -- INSERT -- (lo puede mostrar la statusline)
opt.wrap = false            -- No dividir líneas largas visualmente

-- Indentación
opt.tabstop = 4             -- Un tab equivale visualmente a 4 espacios
opt.shiftwidth = 4          -- Espacios usados al indentar
opt.softtabstop = 4         -- Espacios al presionar Tab
opt.expandtab = true        -- Convertir Tab en espacios
opt.smartindent = true      -- Indentación automática básica

-- Búsqueda
opt.ignorecase = true       -- Ignorar mayúsculas al buscar
opt.smartcase = true        -- Distinguirlas si escribes alguna mayúscula
opt.hlsearch = true         -- Resaltar coincidencias
opt.incsearch = true        -- Mostrar coincidencias mientras escribes

-- Edición y comportamiento
opt.mouse = "a"             -- Permitir usar el ratón
opt.clipboard = "unnamedplus" -- Usar portapapeles del sistema
opt.undofile = true         -- Guardar historial de deshacer entre sesiones
opt.updatetime = 250        -- Tiempo de espera para eventos y diagnósticos
opt.timeoutlen = 400        -- Espera para completar combinaciones de teclas
opt.confirm = true           -- Preguntar antes de salir con cambios sin guardar

-- Ventanas y divisiones
opt.splitright = true       -- Divisiones verticales nuevas a la derecha
opt.splitbelow = true       -- Divisiones horizontales nuevas abajo

-- Archivos
opt.fileencoding = "utf-8"  -- Codificación de archivos
opt.backup = false          -- No crear archivos de respaldo
opt.swapfile = false        -- No crear archivos swap
opt.autoread = true         -- Recargar archivos modificados externamente

