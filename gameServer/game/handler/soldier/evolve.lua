-- @Author:pandayu
-- @Version:1.0
-- @DateTime:2018-09-09
-- @Project:pandaCardServer CardGame
-- @Contact: QQ:815099602
local config = require "game.template.soldier"
local task_config = require "game.template.task"
local open_config = require "game.template.open"


local _M = function(role,data)
	if not data.id then return 2 end
	if not open_config:check_level(role,open_config.need_level.soldier_evolve) then return 101 end

	local soldier = role.soldiers:get(data.id)
	if not soldier then return 500 end

	local canup = config:canevolve(soldier)
	if not canup then return 101 end
	
	local cost = config:get_evolve_cost(soldier)
	if not cost then return 4 end
	local enough,diamond,cost = role:check_resource_num(cost)
	if not enough then
		if data.usediamond ~= 1 or role.base:get_diamond() < diamond then return 100 end
	end
	
	role:consume_resource(cost)
	soldier:qrank_up(cost)
	--role.tasklist:trigger(task_config.trigger_type.soldier_num)
	return 0
end

return _M
