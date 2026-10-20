<?php  // Moodle configuration file

unset($CFG);
global $CFG;
$CFG = new stdClass();

$CFG->dbtype    = 'mysqli';
$CFG->dblibrary = 'native';
$CFG->dbhost    = 'db';
$CFG->dbname    = 'moodle';
$CFG->dbuser    = 'moodle';
$CFG->dbpass    = 'moodle_password_2026';
$CFG->prefix    = 'mdl_';
$CFG->dboptions = array (
  'dbpersist' => 0,
  'dbport' => '',
  'dbsocket' => '',
  'dbcollation' => 'utf8mb4_unicode_ci',
);

$CFG->wwwroot   = 'https://moodle.xorbit.my.id';
$CFG->dataroot  = '/var/www/moodledata';
$CFG->sslproxy  = true;
$CFG->admin     = 'admin';

$CFG->directorypermissions = 02777;

$CFG->session_handler_class = '\core\session\redis';
$CFG->session_redis_host = 'moodle-redis';
$CFG->session_redis_port = 6379;
$CFG->session_redis_prefix = 'moodle_ses_';

require_once(__DIR__ . '/lib/setup.php');

// There is no php closing tag in this file,
// it is intentional because it prevents trailing whitespace problems!
