
<?php
/**
 * Custom WordPress configurations on "wp-config.php" file.
 *
 * This file has the following configurations: MySQL settings, Table Prefix, Secret Keys, WordPress Language, ABSPATH and more.
 * For more information visit {@link https://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php} Codex page.
 * Created using {@link http://generatewp.com/wp-config/ wp-config.php File Generator} on GenerateWP.com.
 *
 * @package WordPress
 * @generator GenerateWP.com
 */


/* MySQL settings */
define( 'DB_NAME',     getenv('WORDPRESS_DB_NAME') );
define( 'DB_USER',     getenv('WORDPRESS_USER') );
define( 'DB_PASSWORD', getenv('WORDPRESS_PASSWORD') );
define( 'DB_HOST',     'localhost' );
define( 'DB_CHARSET',  'utf8mb4' );


/* MySQL database table prefix. */
$table_prefix = 'wp_';


/* Authentication Unique Keys and Salts. */
/* https://api.wordpress.org/secret-key/1.1/salt/ */
define('AUTH_KEY',         '7Yid5U?Bksg[irVk;iK&`ZUfM$=!g?oUYFB/VYB|WYRjC!eO|ARkYJ}ao}n0oI<G');
define('SECURE_AUTH_KEY',  '1M4XjyZqJ2wjRJgPcbZD5OXf>LZ*|pGNIp@U@cg01Ht:pPDpn4Ymc~Gh_@`:s1fz');
define('LOGGED_IN_KEY',    '<va#ra:sr5qxysa/$+kMr0eQ8@@lWFU%)-!K-?j]+|nqM]xF0[;|UA?sq)WKS+_Q');
define('NONCE_KEY',        'iK_iR7h88mlda[s!C;prwI{sV[qfIy~ot- n;%%1>e  B|=JEii9,1(B=*.-TN- ');
define('AUTH_SALT',        'CG5.2mvSa+)n6S:X 36 -wzYGg]G6qE+.l&1P=sL}D%?$[B$B0dj|PwVW)AKJ1T3');
define('SECURE_AUTH_SALT', 'pqbc|@e%b;Uxfc9^zM|@Kt}ZQ]bt t<UaKfuW..j+U,lw4W=IZctD/*a-kEOf1~5');
define('LOGGED_IN_SALT',   'em6U%WgB;B$|D.1POUx2OuV*l2nD5BlG:gpDr`u#%5YFfZX>|;PQNN=E*m+tiA:>');
define('NONCE_SALT',       'g+ V?)5p|Z/cYyAefK[w-Y3cJ$cK,`|{/4IjmU8xk8@e{ ^[;~6Ik:1EgW`UU2/J');

/* Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/* Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');