#!/usr/bin/env sh
set -e

PARTS_DIR="$(cd -- "$(dirname "$0")"/parts >/dev/null 2>&1 && pwd)"
OUT_DIR="${1:-$(pwd)}"
mkdir -p "${OUT_DIR}"

assemble() {
  name="$1"
  echo "Assembling ${name}..."
  cat "${PARTS_DIR}/${name}.part-"* > "${OUT_DIR}/${name}"
  size=$(stat -c%s "${OUT_DIR}/${name}" 2>/dev/null || wc -c <"${OUT_DIR}/${name}")
  if [ "${size}" -lt 1024 ]; then
    echo "Assembled ${name} looks too small (${size} bytes)" >&2
    rm -f "${OUT_DIR}/${name}"
    exit 1
  fi
}

assemble yolov5s-face.onnx
assemble landmarks_68_pfld.onnx
assemble recognition_resnet27.onnx

echo "Models assembled into ${OUT_DIR}"
