# livemap-tiles

[![Discord](https://img.shields.io/badge/Discord-%235865F2.svg?&logo=discord&logoColor=white)](https://discord.gg/ASRPPr8CeT) [![fivenet.app Website](https://img.shields.io/badge/Website-fivenet.app-purple)](https://fivenet.app)

Pre-generated livemap tiles generated from the Virus_City Postal Code Map based on the DLK HD Atlas Map (links to resources and authors in [credits section](#credits)).

These are generated leaflet tiles ready to be used with FiveNet's livemap feature. They have been generated using a customized `gdal2tiles` version from [GitHub commenthol/gdal2tiles-leaflet](https://github.com/commenthol/gdal2tiles-leaflet) to work with Leaflet.

To note the map image files have been scaled up to a resolution of _16384x16384_ before being run through `gdal2tiles`.
Additionally to save storage and "optimize" the images, they have been run through `optipng` with the following options `-strip all -clobber -fix -o9`.

## `tiles/` Folder

The `tiles/` folder contains the pre-generated tiles in a structure ready to be used with FiveNet's livemap feature.

```plain
tiles/
├── postal/
└── satelite/
```

## Credits

- Base Map
    - [Postal Code Map & Minimap - New & Improved - v1.3](https://forum.cfx.re/t/release-postal-code-map-minimap-new-improved-v1-3/147458) by [Virus_City](https://forum.cfx.re/u/Virus_City)
    - [DLK HD Atlas Map For FiveM](https://aothsa.com/2021/08/08/dlk-hd-atlas-map-for-fivem/) by [DieLikeKane](https://aothsa.com/gtav-fivem-map-mods/)
- Cayo Perico Island
    - [Cayo Perico Satelitte Map V3](https://forum.cfx.re/t/free-cayo-perico-satelitte-map-v3/5260282) by [jonstyle83](https://forum.cfx.re/u/johnstyle83)
    - [Cayo Perico Atlas Postal Map](https://forum.cfx.re/t/cayo-perico-atlas-postal-map-free/5275857) by [DZ2024](https://forum.cfx.re/u/DZ2024)
_Should you want any file removed from this repository, please contact the FiveNet organization email address with your request, thanks!_

## Development

### Building Tiles

You must have Python3.13 and GDAL installed to build the tiles.

```console
# Clone the repository
git clone https://github.com/fivenet-app/livemap-tiles.git
cd livemap-tiles

python3 -m venv .venv
source .venv/bin/activate

make tiles
```
