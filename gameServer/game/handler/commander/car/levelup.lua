-- @Author:pandayu
-- @Version:1.0
-- @DateTime:2018-09-09
-- @Project:pandaCardServer CardGame
-- @Contact: QQ:815099602
local config = require "game.template.commander"
local tointhash = require "include.tointhash"


local _M = function(role,data)
    if not data.cid or type(data.cid) ~= "number" then return 2 end
    if not data.uid  then return 2 end

	local id = data.id or 101
	local commander = role.commanders:get(id)
	if not commander then return 400 end
	data.uid = tointhash(data.uid)
	local canup,add_exp,uid = config:can_car_level_up(commander,data.cid,data.uid)
	if not canup then return 101 end
	
	local cost = config:get_car_level_up_cost(commander,data.cid,uid)

	if not cost then return 4 end
	local enough,diamond,cost = role:check_resource_num(cost)
	if not enough then
		if data.usediamond ~= 1 or role.base:get_diamond() < diamond then return 100 end
	end

	role:consume_resource(cost)
	commander:car_level_up(data.cid,add_exp,cost)
	return 0
end

return _M
