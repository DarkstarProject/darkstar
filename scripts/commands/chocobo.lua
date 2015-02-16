---------------------------------------------------------------------------------------------------
-- func: chocobo
-- auth: <Unknown>
-- desc: Spawns a chocobo.
---------------------------------------------------------------------------------------------------
require("scripts/globals/common");
require("scripts/globals/status");
require("scripts/globals/pets");
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iii"
};

function onTrigger(player,target)
    
    player:setAnimation(5);
	
	
	--target:costume(2436);
	
	--entityVisualPacket(lua_State* L)
    -- player race chocobo
	-- 20 yellow
	-- 21 black
	-- 22 blue
	-- 23 red
	-- 24 green
end