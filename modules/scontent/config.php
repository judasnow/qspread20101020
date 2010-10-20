<?php
return array (
    'permissionRules' => array(
                        'see_scontent' => array(//External permission
                                            'See all articles/categories',//Full control name
                                            'vi_lang',//table
                                            'lang_id', //Check permisison column
                                            'name'),//Display column at permission inteface
                        'new_scontent' => array(//External permission
                                            'Create new article',//Full control name
                                            'vi_lang',//table
                                            'lang_id', //Check permisison column
                                            'name'),//Display column at permission inteface
                        'edit_scontent' => array(//External permission
                                            'Edit existed articles',//Full control name
                                            'vi_lang',//table
                                            'lang_id', //Check permisison column
                                            'name'),//Display column at permission inteface
                        'delete_scontent' => 'Delete existed articles',
                    ),
);
