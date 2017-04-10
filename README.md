# mandelbrot-set-animation

Using `mandelbrot-set-cpp`, shell script, and `ffmpeg` to animate the Mandelbrot Set

## Goals

- To create a video animation of the Mandelbrot Set, Julia Sets, and Multibrot
  Sets using `mandelbrot-set-cpp`
- To better learn shell scripting
- To use `ffmpeg` to stitch together images to create a video
- To use `mandelbrot-set-cpp` to generate images of the Mandelbrot Set

## Installation

Make sure you have `make`, `ffmpeg`, and `g++` installed.

Running `make` will install and compile the `mandelbrot-set-cpp` dependency.

## Usage

Scripts, for each animation, can be found in the `src/` folder.

Run a script by doing `bash src/<script_name>.sh` or `make build/<script_name>`.

The script will be set with the default parameters `--bitmap --ratio 1 --width 100 --height 100 --iterations 10`. There parameters can be replaced by appending new parameters like so: `bash src/<script_name>.sh --width 1920 --height 1080 --max-colour 00ff00`.

## License

MIT LICENSE. See [LICENSE](LICENSE).

## Author

Jordan Lord
