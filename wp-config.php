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
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'akaddour' );

/** Database password */
define( 'DB_PASSWORD', 'akaddour' );

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
define( 'AUTH_KEY',          'wE(A[;n}9@AUmISU-2@Vp$R=i/(1{7HWeGii+O?>fEuIA/y/{xT) {{H8ybV.uQ;' );
define( 'SECURE_AUTH_KEY',   '/@^:bT][_2,7` b{^y-V.z7lWyaw%0!4[=E_qU:b?$#iiraF#kp(cgyLaR_#}X!w' );
define( 'LOGGED_IN_KEY',     'Z@mS]k:A82EGg1^;L<Hlb;@lM-,1u<1nzgEz)rDboUr~0e*81?y=UrAu.uw^/K| ' );
define( 'NONCE_KEY',         '.Fg02G,X9]}*m:yR|o]r4-hQ-0dArfNP2}nj:tikf+poYjYOH1*J!RqV|)s-+M{d' );
define( 'AUTH_SALT',         'ZWtCkQgif<GmqkRY:pt8M ycrPEL]r4$yLV+.mAo3joq<y%roxFAkZ*|@`e dWnL' );
define( 'SECURE_AUTH_SALT',  'q+}B/1iAsn8r_zsaXVN$$~u0^GE0f=Mc:a}:U<j1A{VKv1y1jT|H`]ZmYBWAq~PJ' );
define( 'LOGGED_IN_SALT',    '1-nWm1a|SN?P{$6e^d=VaK?==5*BKltc`a##DXhp9I@Kpq761C%D%&j^%R8]a`W}' );
define( 'NONCE_SALT',        'keZywVVPp3]?>m&~J3l?OdvF2?|x55`/GIF*T;|_>YeQ9pPskY`jEi{-*$ NvVIA' );
define( 'WP_CACHE_KEY_SALT', '@.*PTmjwL{FVHy$QJ/7_NXA8?[zut)PP4,N*Al<30}e~A[gaZq?F:c8?erjvHXgg' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



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
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

define( 'WP_REDIS_HOST', 'redis' );
/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
