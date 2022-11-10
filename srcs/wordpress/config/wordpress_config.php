<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv("WORDPRESS_DB_NAME"));

/** Database username */
define( 'DB_USER', getenv("WORDPRESS_ADMIN_USER"));

/** Database password */
define( 'DB_PASSWORD', getenv("WORDPRESS_ADMIN_PASSWORD") );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */

define('AUTH_KEY',         '/I@Y_P<p>&.BBZ0,f^? s?)[y|#LBAIj![^; 6fUx/NriVPNg@_`FM)jTH7jt|Gc');
define('SECURE_AUTH_KEY',  'I?~;sk/ei9l(NNW.MbIH?)cO/9i[3w[^u<np cL5M>A4/H{Cvku+V8!wYOIsoJdJ');
define('LOGGED_IN_KEY',    'p/|uj]An.ce?oi19tSxR3&v*+>&2-=.b<w&]^@z@Z@?+28v@L4(<CE|`Y`qEK!F0');
define('NONCE_KEY',        '.]@~B7dgeyjTgIzT{U>%/,pVwbkh(K`+;Hy[6^ylUT)Sh6KVE_kbn+xYkrYglGOx');
define('AUTH_SALT',        '/`F=[(Dg@/b!p:4[6Znb835r0jAVtrV7[|HYJ4i08dLp,Z:H+Xxt<`].Ng9pRcT8');
define('SECURE_AUTH_SALT', '9]~D2GBChq++,cMn%0Q&`|42m)7)}df5qLtC;J/.KBT&f3xIET|,Q^YO&)E/dhQb');
define('LOGGED_IN_SALT',   'b0y4+2c^4uL5~^.J4cE@oRBI,6_,DQ5ukXbH[A9rEDqt[.]+;5jED,lrc(k?a)YV');
define('NONCE_SALT',       '%AazfnL//D,!Y/A{C/Lt{q ;BA)IFi|8w!6N3(:%a=8}C(PZ7G>paQ421mhS%)yN');
/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';