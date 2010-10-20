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
require_once 'Zend/Config.php';
require_once 'Zend/Config/Writer/Array.php';
class Vi_Language
{
    /**
     * Singleton instance
     *
     * Marked only as protected to allow extension of the class. To extend,
     * simply override {@link getInstance()}.
     *
     * @var Vi_Language
     */
    protected static $_instance = null;
    /**
     * Language code
     * 
     * @var string
     */
    protected $_langCode = null;
    /**
     * Phrases have been translated
     * 
     * @var array
     */
    protected $_translatedPhrases = array();
    /**
     * Array name of module/layout/sticker
     * 
     * @var array
     */
    protected $_name = array();
    /**
     * Path to language file
     * 
     * @var string
     */
    protected $_filePath;
    /**
     * Writer for writing language file
     * 
     * @var Zend_Config_Writer_Array
     */
    protected $_writer;    
    /**
     * Flag for translation. It is true means all phrase were translated
     * 
     * @var bool
     */
    public  $isTranslated;
    /**
     * Specify type that language is translated to. There are 3 types: module, layout, sticker
     * 
     * @var int
     */
    public static $currentType;
    const TYPE_MODULE  = 1;
    const TYPE_LAYOUT  = 2;
    const TYPE_STICKER = 3;
    /**
     * Specify name of module/layout/sticker
     * 
     * @var string
     */
    public static $currentName;
	/**
     * Constructor
     *
     * Instantiate the writer.
     *
     * @return void
     */
    protected function __construct()
    {
        $this->_writer = new Zend_Config_Writer_Array();
        $this->isTranslated = true;
    }
    /**
     * Singleton instance
     *
     * @return Vi_Language
     */
    public static function getInstance()
    {
        if (null === self::$_instance) {
            self::$_instance = new self();
        }

        return self::$_instance;
    }
    /**
     * Translate a phrase of words, or array of phrases
     * 
     * @param string|array $phrase
     * @param array        $params  Params are used to replace in $phrase
     * @param string       $langCode Default is null. If $langCode == null, it will use Vi_Registry::get('langCode')
     * 
     * @return string|array
     * @throws Exception if language file is not readable, or $phrase is not string/array
     * 
     * @example
     *                  $this->translate2('Version {{0}} is good',
     *                                     array('1.0'), 'en');
     *                   //Result: 'Version 1.0 is good'; 
     *                   
     *                   
     *                  $this->translate2(array('Version {{0}} is good',
     *                                          'But version {{0}} is better than version {{1}}'),
     *                                    array(
     *                                          array(
     *                                              '1.0'
     *                                          ),
     *                                          array(
     *                                              '2.0',
     *                                              '1.0'
     *                                          )
     *                                         ),
     *                                    'en');
     *                                    
     *                  //Result: array('Version 1.0 is good', 'But version 2.0 is better than version 1.0')
     */
    public function translate2($phrase, $params = array(), $langCode = null)
    {
        if (null == $langCode) {
            $langCode = Vi_Registry::get('langCode');
        } else {
            /**
             * @TODO Check $langCode to sure it has in system's languages
             */
        }
        
        if (null == $phrase) {
            return '';
        }
        
        if (! isset($this->_name[self::$currentType])) {
            $this->_name[self::$currentType] = '';
        }
        
        if (! isset($this->_translatedPhrases[self::$currentType])) {
            $this->_translatedPhrases[self::$currentType] = array();
        }
        if (! isset($this->_translatedPhrases[self::$currentType][$langCode])) {
            $this->_translatedPhrases[self::$currentType][$langCode] = array();
        }
        /**
         * Detect module, or layout, or sticker
         */
        if (self::$currentType == self::TYPE_MODULE) {
            $path = 'languages/module.' . self::$currentName;
        } elseif (self::$currentType == self::TYPE_LAYOUT) {
            $config = Vi_Registry::get('config');
            self::$currentName = $config['layoutCollection'];
            $path = 'languages/layout.' . self::$currentName;
        } else {
            $path = 'languages/sticker.'. self::$currentName;
        }
        /**
         * Load language file
         */
        $this->_filePath = "$path.$langCode.php";
        
        if (! is_writable('languages')) {
            throw new Exception('Language folder languages'
                                . '" is not writable. Please change it to 777 mode.');
        }
        
        if ($this->_name[self::$currentType] != self::$currentName || empty($this->_translatedPhrases[self::$currentType][$langCode])) {
            if (is_file($this->_filePath)) {
                if (is_readable($this->_filePath)) {
                    $this->_translatedPhrases[self::$currentType][$langCode] = require_once "$this->_filePath";
                } else {
                    throw new Exception("Permission denied. Language file ($this->_filePath) is not readable.");
                }
                $this->isTranslated = true;
            } else {
                $this->isTranslated = false;
            }
            $this->_name[self::$currentType] = self::$currentName;
        }
        /**
         * Begin translation
         */
        $return = '';
        if (is_string($phrase)){
            if (array_key_exists($phrase, $this->_translatedPhrases[self::$currentType][$langCode])) {
                $return =  $this->_translatedPhrases[self::$currentType][$langCode][$phrase];
                if (null == $return) {
                    return "[$phrase]";
                } else {
                    return $return;
                }
            } else {
                /**
                 * Not is translated yet
                 */
                $this->isTranslated = false;
                $this->_translatedPhrases[self::$currentType][$langCode][$phrase] = '';
                $return = "[$phrase]";
            }
        } elseif (is_array($phrase)) {
            foreach ($phrase as $item) {
                if (array_key_exists($item, $this->_translatedPhrases[self::$currentType][$langCode])) {
                    $return[$item] = $this->_translatedPhrases[self::$currentType][$langCode][$item];
                    if (null == $return[$item]) {
                        $return[$item] = "[$item]";
                    }
                } else {
                    /**
                     * Not is translated yet
                     */
                    $this->isTranslated  = false;
                    $this->_translatedPhrases[self::$currentType][$langCode][$item] = '';
                    $return[$item] = "[$item]";
                }
            }
        } else {
            throw new Exception("The param of Vi_Language::translate() is not correct. Params have to be string or array");
        }
        
        /**
         * Write language file
         */
        if (! $this->isTranslated) {
            $this->_writer->write($this->_filePath, new Zend_Config($this->_translatedPhrases[self::$currentType][$langCode]));
        }
        /**
         * Translate with params
         */
        if (is_array($params) && (! empty($params))) {
            if (is_string($phrase)){
                	$find =array();
                	$replace = array();
                	for ($i = 0;$i<count($params);$i++) {
                		$find[] = "{{$i}}";
                		$replace[] = $params[$i];
                	}
                	$return = str_replace($find, $replace, $return);
            } elseif (is_array($phrase)) {
                foreach ($phrase as $index => $item) {
                    if (is_array($params[$index]) && (! empty($params[$index]))) {
                        $find =array();
                        $replace = array();
                        for ($i = 0;$i<count($params[$index]);$i++) {
                            $find[] = "{{$i}}";
                            $replace[] = $params[$index][$i];
                        }
                        $return[$item] = str_replace($find, $replace, $return[$item]);
                    }
                }
            }
        }

        return $return;
    }
    /**
     * Translate a phrase of words, or array of phrases
     * 
     * @param string|array $phrase
     * @param array        $params  Params are used to replace in $phrase
     * @param string       $langCode Default is null. If $langCode == null, it will use Vi_Registry::get('langCode')
     * 
     * @return string|array
     * @throws Exception if language file is not readable, or $phrase is not string/array
     * 
     * @example
     *                  Vi_Language::translate('Version {{0}} is good',
     *                                     array('1.0'), 'en');
     *                   //Result: 'Version 1.0 is good'; 
     *                   
     *                   
     *                  Vi_Language::translate(array('Version {{0}} is good',
     *                                          'But version {{0}} is better than version {{1}}'),
     *                                    array(
     *                                          array(
     *                                              '1.0'
     *                                          ),
     *                                          array(
     *                                              '2.0',
     *                                              '1.0'
     *                                          )
     *                                         ),
     *                                    'en');
     *                                    
     *                  //Result: array('Version 1.0 is good', 'But version 2.0 is better than version 1.0')
     */
    public static function translate($phrase, $params = array(), $langCode = null)
    {
        $translator = Vi_Language::getInstance();
        return $translator->translate2($phrase, $params, $langCode);
    }
    /*
     * get current language code
     */
    public static function getCurrentLangCode()
    {
    	return Vi_Registry::get('langCode');
    }
}