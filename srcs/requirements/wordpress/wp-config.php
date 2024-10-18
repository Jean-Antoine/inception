<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
echo(getenv("DB_NAME"));
define( 'DB_NAME', getenv("DB_NAME") );

/** MySQL database username */
define( 'DB_USER', getenv("DB_USER") );

/** MySQL database password */
define( 'DB_PASSWORD', getenv("DB_PWD") );

/** MySQL hostname */
define( 'DB_HOST', 'mariadb:3306' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'nvmC+N]kV+uaj|2sJo12+~*N4Jxm$dY&Vh|Gl4Lx1lAt..8w[qAw }pOVS$x_IU~');
define('SECURE_AUTH_KEY',  'TQNo_stKmy8gZb^Q:jsbr[kNrl{F2QC<W+d(VgT/a/0u{4K1Q1@P(W[He+OEyRS#');
define('LOGGED_IN_KEY',    'L#E1Z`@9[w-&r-;Y[ Q`.PAY?#?A_nb9@_Pw^h_E90@]alUid1=9yZMCS+^cHpCS');
define('NONCE_KEY',        'Uw`Z{304JR;5ELt|P-->UEWc?0(pFlR7c+Or^RN*e:*qrmK-Tp:O^wD[%.0G_W-G');
define('AUTH_SALT',        'U7Crkf<|eV^:!?K;g!jH@njnn8vD7m)U0-NAkcshHl#bN#).X@]2sTjhl^;G?UrR');
define('SECURE_AUTH_SALT', 'h}<py~$iOu)DDVUb)fl@dbsa8p*!ab!lDIOr|h@gS:M=6!3;-G+%j- ^m|^L6-Xc');
define('LOGGED_IN_SALT',   'Kib`m];>-nf8@d_+Bq*UD/om8Cq2l:ZV^ykpE+.W(2iWURZRS,c9^re{?h-Q{ SC');
define('NONCE_SALT',       'nauiZ;CZ|0|L.zOn~eTp6|uNQ}1j%+=E5f`gmc{s%M?jZ$N5lX$V~EZ&:98v&NO@');


/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

define('WP_SITEURL',	getenv("DOMAIN_NAME"))
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

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';