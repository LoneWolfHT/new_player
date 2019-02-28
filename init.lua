local anim = {
	stand     = {x = 0,   y = 0},
	sit       = {x = 1,  y = 1},
	walk      = {x = 2, y = 42},
	mine      = {x = 43, y = 57},
	lay       = {x = 58, y = 58},
	walk_mine = {x = 59, y = 103},
}	

player_api.register_model("nc_player.b3d", {
	animation_speed = 57,
	animations = anim,
	collisionbox = {-0.3, 0.0, -0.3, 0.3, 1.83, 0.3},
	stepheight = 0.6,
	eye_height = 1.65,
})

minetest.register_on_joinplayer(function(player)
	minetest.after(1, function()
		player_api.set_model(player, "nc_player.b3d")
		player:set_local_animation(
			{x = 0,   y = 0},
			{x = 2, y = 41},
			{x = 43, y = 57},
			{x = 59, y = 103},
			57
		)
	end)
end)

minetest.register_chatcommand("set_anim", {
	description = "Set the player's animation\n"..table.concat(anim, ", "),
	func = function(name)
		local p = minetest.get_player_by_name(name)

		p:set_animation(anim[param], 57)
	end
})