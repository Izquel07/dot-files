#!/usr/bin/env bash

# Directorio de los fondos
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Archivo donde guardamos el índice del fondo anterior
STATE_FILE="$HOME/.cache/hyprland-wallpaper-index"

# Índice inicial: todavía no hay un fondo registrado
PREVIOUS_INDEX=-1

# Comprobar que exista el directorio
if [[ ! -d "$WALLPAPER_DIR" ]]; then
  echo "Error: no existe la carpeta $WALLPAPER_DIR"
  exit 1
fi

# Obtener las imágenes en orden alfabético
mapfile -t WALLPAPERS < <(
  find "$WALLPAPER_DIR" -maxdepth 1 -type f \
    \( -iname '*.jpg' -o \
    -iname '*.jpeg' -o \
    -iname '*.png' -o \
    -iname '*.webp' \) |
    sort
)

# Comprobar que existan imágenes
if ((${#WALLPAPERS[@]} == 0)); then
  echo "Error: no hay imágenes en la carpeta"
  exit 1
fi

# Leer el índice anterior, si existe
if [[ -f "$STATE_FILE" ]]; then
  read -r PREVIOUS_INDEX <"$STATE_FILE"
fi

# Validar el índice guardado
if [[ ! "$PREVIOUS_INDEX" =~ ^[0-9]+$ ]] ||
  ((PREVIOUS_INDEX >= ${#WALLPAPERS[@]})); then
  PREVIOUS_INDEX=-1
fi

# Calcular el siguiente índice
NEXT_INDEX=$(((PREVIOUS_INDEX + 1) % ${#WALLPAPERS[@]}))

# Obtener la ruta del siguiente fondo
NEXT_WALLPAPER="${WALLPAPERS[$NEXT_INDEX]}"

# Aplicar el fondo con Awww
if awww img \
  --transition-type grow \
  --transition-duration 2 \
  "$NEXT_WALLPAPER"; then

  # Crear la carpeta de caché si no existe
  mkdir -p "$(dirname "$STATE_FILE")"

  # Guardar el índice después de aplicar el fondo
  printf '%s\n' "$NEXT_INDEX" >"$STATE_FILE"
else
  echo "Error: Awww no pudo aplicar el fondo"
  exit 1
fi
