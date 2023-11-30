# tempd

a simple shell library for generate temp directory, alternative for "mktemp -d"

## Installation
```sh
git clone https://github.com/lazypwny751/tempd.git
cd tempd
bash missing.sh
sudo make all
```

## Usage
you can source the library in a shell script also you use it directly.
```sh
source /usr/local/lib/bash/5.1/tempd.sh
tempd.create export
rm -rf "${TEMPD}"
export TEMPD="$(tempd.create)"
rm -rf "${TEMPD}"
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[GPL3](https://choosealicense.com/licenses/gpl-3.0/)
