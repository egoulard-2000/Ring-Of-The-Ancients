/// @desc GUI/Vars/Menu setup

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

title_logo = "Ring of the Ancients";
title_logo_font = f_title;
title_logo_x = gui_width - 400;
title_logo_y = gui_height - gui_margin - 220;

menu_x = gui_width +200;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;
menu_speed = 25;
menu_font = f_menu;
menu_itemheight = font_get_size(f_menu);
menu_committed = -1;
menu_control = true;

menu[1] = "Start Game";
menu[0] = "Quit";

menu_items = array_length_1d(menu);
menu_cursor = 2;