global.P_System=part_system_create_layer(layer, true);

global.Dust = part_type_create();

part_type_sprite(global.Dust, spr_explosion,true,true,false);
part_type_size(global.Dust, 0.5, 1, 0, 0.05);
part_type_speed(global.Dust, 2, 2.5, 0, 0);
part_type_direction(global.Dust, 0, 350, 0, 0);
part_type_life(global.Dust, 20, 60);
