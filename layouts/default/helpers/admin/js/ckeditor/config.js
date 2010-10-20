/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	
        config.toolbar = 'MyToolbar';

        config.toolbar_MyToolbar =
        [
            ['Source'],
			['Format','Font','FontSize'],
            ['TextColor','BGColor'],
            ['Bold', 'Italic','Underline','Strike'],
            ['NumberedList', 'BulletedList'],
			'/',
            ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
			['Outdent','Indent'],
			['Link','Unlink','Anchor'],
            ['Image','Flash','Smiley','SpecialChar'],
            ['PasteText','PasteFromWord'],
			['Maximize', 'SpellChecker']
        ];
};
