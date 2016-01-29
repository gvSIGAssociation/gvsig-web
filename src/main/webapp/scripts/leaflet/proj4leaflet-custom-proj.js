/*
 * This file contains the custom projection declarations for leaflet based
 * thru proj4leaflet
 */



/**
 * EPSG:25830
 */
L.CRS.EPSG25830 = new L.Proj.CRS('EPSG:25830',
		'+proj=utm +zone=30 +ellps=GRS80 +units=m +no_defs',
		{
			resolutions: [
			              2048, 1024, 512, 256, 128,
			              64, 32, 16, 8, 4, 2, 1, 0.5, 0.2, 0.1, 0.05
			              ],
		origin: [0, 0]
		});

/**
 * EPSG:23029
 */
L.CRS.EPSG23029 = new L.Proj.CRS('EPSG:23029',
		'+proj=utm +zone=29 +ellps=intl +units=m +no_defs',
		{
			resolutions: [
			              2048, 1024, 512, 256, 128,
			              64, 32, 16, 8, 4, 2, 1, 0.5, 0.2, 0.1, 0.05
			              ],
		origin: [0, 0]
		});

/**
 * EPSG:23030
 */
L.CRS.EPSG23030 = new L.Proj.CRS('EPSG:23030',
		'+proj=utm +zone=30 +ellps=intl +units=m +no_defs',
		{
			resolutions: [
			              2048, 1024, 512, 256, 128,
			              64, 32, 16, 8, 4, 2, 1, 0.5, 0.2, 0.1, 0.05
			              ],
		origin: [0, 0]
		});

/**
 * EPSG:23031
 */
L.CRS.EPSG23031 = new L.Proj.CRS('EPSG:23031',
		'+proj=utm +zone=31 +ellps=intl +units=m +no_defs',
		{
			resolutions: [
			              2048, 1024, 512, 256, 128,
			              64, 32, 16, 8, 4, 2, 1, 0.5, 0.2, 0.1, 0.05
			              ],
		origin: [0, 0]
		});
