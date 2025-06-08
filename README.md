# livemap-tiles

[![Discord](https://img.shields.io/badge/Discord-%235865F2.svg?&logo=discord&logoColor=white)](https://discord.gg/ASRPPr8CeT) [![fivenet.app Website](https://img.shields.io/badge/Website-fivenet.app-purple)](https://fivenet.app)

Pre-generated livemap tiles generated from the Virus_City Postal Code Map based on the DLK HD Atlas Map (links to resources and authors in [credits section](#credits)).

These are generated leaflet tiles ready to be used with FiveNet's livemap feature. They have been generated using a customized `gdal2tiles` version from [GitHub commenthol/gdal2tiles-leaflet](https://github.com/commenthol/gdal2tiles-leaflet) to work with Leaflet.

To note the map image files have been scaled up to a resolution of _16384x16384_ before being run through `gdal2tiles`.
Additionally to save storage and "optimize" the images, they have been run through `optipng` with the following options `-strip all -clobber -fix -o9`.

## `tiles/` Folder

Currently only the postal code map is available here.

## Credits

* [Postal Code Map & Minimap - New & Improved - v1.3](https://forum.cfx.re/t/release-postal-code-map-minimap-new-improved-v1-3/147458) by [Virus_City](https://forum.cfx.re/u/Virus_City)
* [DLK HD Atlas Map For FiveM](https://aothsa.com/2021/08/08/dlk-hd-atlas-map-for-fivem/) by [DieLikeKane](https://aothsa.com/gtav-fivem-map-mods/)
* [Grid Overlay Map](https://www.reddit.com/r/chiliadmystery/comments/3zccne/gta_v_gtao_gridded_map_with_coordinates_xpost/) by [chiliadmystery](https://www.reddit.com/r/chiliadmystery/) on Reddit (note: I have seen this overlay posted in various places, but this is the earliest I could find it)

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
