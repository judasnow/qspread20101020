<?php
return array (
    'permissionRules' => array(
                        'see_newsletter_mail' => array(//External permission
                                            'See all newsletter mails',//Full control name
                                            'vi_lang',//table
                                            'lang_id', //Check permisison column
                                            'name'),//Display column at permission inteface
                        'new_newsletter_mail' => array(//External permission
                                            'Create new newsletter mail',//Full control name
                                            'vi_lang',//table
                                            'lang_id', //Check permisison column
                                            'name'),//Display column at permission inteface
                        'edit_newsletter_mail' => array(//External permission
                                            'Edit existed newsletter mails',//Full control name
                                            'vi_lang',//table
                                            'lang_id', //Check permisison column
                                            'name'),//Display column at permission inteface
                        'delete_newsletter_mail' => 'Delete existed newsletter mails',
                        'edit_system_mail' => 'Edit system mails',
                        'see_system_mail'  => 'See system mails'
                    ),
);
