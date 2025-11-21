# FaceApp.Models

Model parts for FaceApp/FaceServer. Contains split ONNX files and an assemble script to rebuild them.

## Contents
- `onnx/parts/` – split chunks (`*.part-*`) of:
  - `yolov5s-face.onnx`
  - `landmarks_68_pfld.onnx`
  - `recognition_resnet27.onnx`
- `onnx/assemble.sh` – reassembles all parts into full models.
- `FaceApp.Models.onnx.parts.zip` – archive of the above for easy distribution (optional).

## Reassemble
```bash
# from this repo root
sh onnx/assemble.sh ./onnx
# outputs full .onnx files into ./onnx
```

## Notes
- The full `.onnx` files are `.gitignore`'d; only parts are tracked.
- If you change a model, rerun the splitting and update the parts and zip.
