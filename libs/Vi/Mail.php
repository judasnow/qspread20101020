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
require_once 'Zend/Mail.php';
require_once 'Vi/Mail/Engine.php';
require_once 'Vi/View.php';
class Vi_Mail extends Zend_Mail
{
    public $view;
    public $dbTemplateName = '';
    public $isDbTemplateHtml = false;
    /**
     * Public constructor
     *
     * @param string $charset
     */
    public function __construct($charset = 'iso-8859-1')
    {
        parent::__construct($charset);
        $this->view = new Vi_View();
        $this->view->setEngine(new Vi_Mail_Engine());
    }
    /**
     * Set template name from database
     * 
     * @var string $name    Template's name
     * @var bool   $isHtml  Template is HTML template
     * @return void
     */
    public function setBodyDbTemplateName($name, $isHtml = false)
    {
        $this->dbTemplateName   = $name;
        $this->isDbTemplateHtml = $isHtml;
    }
    /**
     * Get template's name
     * 
     * @return string
     */
    public function getBodyDbTemplateName()
    {
        return $this->dbTemplateName;
    }
    /**
     * Override Zend_Mail::send()
     * 
     * Sends this email using the given transport or a previously
     * set DefaultTransport or the internal mail function if no
     * default transport had been set.
     *
     * @param  Zend_Mail_Transport_Abstract $transport
     * @return Zend_Mail                    Provides fluent interface
     */
    public function send($transport = null)
    {
        if (null != $this->dbTemplateName) {
            $mailContent = $this->view->render($this->dbTemplateName);
            if ($this->isDbTemplateHtml) {
                $this->setBodyHtml($mailContent);
            } else {
                $this->setBodyText($mailContent);
            }
//            echo "<pre>";print_r($mailContent);die;
        }
        
        return parent::send($transport);
    }
}