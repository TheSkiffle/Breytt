global.mid_transition = false;
global.paused = false;
global.transition_type_loc = false;
global.transition_type_in = -1;
global.target_room = -1;
global.target_x = -1;
global.target_y = -1;
global.target_face = 0;

function TransitionPlaceSequence(_type) {
	if (layer_exists("transition")) layer_destroy("transition");
	var _lay = layer_create(-9999, "transition");
	layer_sequence_create(_lay, 0, 0, _type);
}

function TransitionStart(_target_room, _type_out, _type_in) {
	if (!global.mid_transition) {
		global.mid_transition = true;
		global.paused = true;
		global.target_room = _target_room;
		TransitionPlaceSequence(_type_out);
		layer_set_target_room(_target_room);
		TransitionPlaceSequence(_type_in);
		layer_reset_target_room();
		return true;
	}
	else return false;
}

function TransitionStartLoc(_target_room, _target_x, _target_y, _target_face, _type_out, _type_in) {
	if (!global.mid_transition) {
		global.mid_transition = true;
		global.paused = true;
		global.transition_type_loc = true;
		global.target_room = _target_room;
		global.target_x = _target_x;
		global.target_y = _target_y;
		global.target_face = _target_face;
		TransitionPlaceSequence(_type_out);
		layer_set_target_room(_target_room);
		TransitionPlaceSequence(_type_in);
		layer_reset_target_room();
		return true;
	}
	else return false;
}

function TransitionChangeRoom() {
	room_goto(global.target_room);
	if (global.transition_type_loc) {
		obj_player.x = global.target_x;
		obj_player.y = global.target_y;
		obj_player.face = global.target_face;
	}
}

function TransitionFinished() {
	layer_sequence_destroy(self.elementID);
	global.mid_transition = false;
	global.paused = false;
	global.transition_type_loc = false;
}