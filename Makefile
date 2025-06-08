BUILD_DIR := .build/

build_dir:
	mkdir -p $(BUILD_DIR)

gdal2tiles-leaflet: build_dir
	if test ! -d $(BUILD_DIR)gdal2tiles-leaflet/; then \
		git clone https://github.com/commenthol/gdal2tiles-leaflet.git $(BUILD_DIR)gdal2tiles-leaflet; \
	else \
		git -C $(BUILD_DIR)gdal2tiles-leaflet pull --all; \
	fi

.PHONY: gen-tiles
gen-tiles: gdal2tiles-leaflet
	GDAL_ALLOW_LARGE_LIBJPEG_MEM_ALLOC=true \
	JPEGMEM=2048M \
		python3 $(BUILD_DIR)gdal2tiles-leaflet/gdal2tiles.py \
		-l -p raster -z 1-7 -w none \
		./maps/GTAV_POSTAL_16384x16384.jpg ./tiles/postal
	GDAL_ALLOW_LARGE_LIBJPEG_MEM_ALLOC=true \
	JPEGMEM=2048M \
		python3 $(BUILD_DIR)gdal2tiles-leaflet/gdal2tiles.py \
		-l -p raster -z 1-7 -w none \
		./maps/GTAV_SATELITE_16384x16384.jpg ./tiles/satelite

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)

.PHONY: optimize-tiles
optimize-tiles:
	find ./tiles/ -iname '*.png' -print0 | xargs -n1 -P16 -0 optipng -strip all -clobber -fix -o9

.PHONY: tiles
tiles:
	$(MAKE) gen-tiles
	$(MAKE) optimize-tiles
