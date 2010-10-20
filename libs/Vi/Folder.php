<?php
/**
 * LICENSE
 * 
 * [license information]
 * 
 * @category   Vi
 * @copyright  Copyright (c) 2009 visualidea.org
 * @license    http://license.visualidea.org
 * @version    v 1.0 2009-04-15
 * 
 */
class Vi_Folder
{
    /**
     * Read content of the folder. The content consists of files and folders.
     * 
     * @var string $dir
     * @return array The content of the folder. Empty array will be return if the 
     *               folder does not have any file and folder
     */
    public static function readdir($dir)
    {
        $content =  array();
        if (is_dir($dir)) {
            if ($dh = opendir($dir)) {
                while (false !== ($file = readdir($dh))) {
                    $content[] = $file;
                }
                closedir($dh);
            }
        }
        return $content;
    }
    
    public static function getFolders($dir)
    {
    	$content =  array();
        if (is_dir($dir)) {
            if ($dh = opendir($dir)) {
                while (false !== ($file = readdir($dh))) {
                	if (strpos($file, '.') !== 0)
                    	$content[] = $file;
                }
                closedir($dh);
            }
        }
        return $content;
    }
    
    public static function removeDir($dir) {
        if (!file_exists($dir)) return true;
        if (!is_dir($dir)) return unlink($dir);
        foreach (scandir($dir) as $item) {
            if ($item == '.' || $item == '..') continue;
            if (!Vi_Folder::removeDir($dir . DIRECTORY_SEPARATOR . $item)) return false;
        }
        return Vi_Folder::removeDir($dir);
    }
    
    public static function mkDirIfNotExist($dir)
    {
        if (!is_dir($dir)) {
            mkdir($dir, "0777");
        }
        return $dir;
    }
}