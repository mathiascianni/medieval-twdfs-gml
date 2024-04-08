var _castle = instance_find(obj_castle, 0);

var _window_w = window_get_width();
var _window_h = window_get_height();

draw_set_color(c_white);
draw_text(_window_w - 200, 50, "Castle HP: " + string(_castle.hp));
