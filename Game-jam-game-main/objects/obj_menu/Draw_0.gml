/// @description Draw Title Logo
draw_set_font(title_logo_font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var title_txt = title_logo;
var title_xx = title_logo_x;
var title_yy = title_logo_y;
var col = c_maroon;
draw_set_color(col);
draw_text_transformed(title_xx,title_yy,title_txt, 1.1, 1.1, 0);
