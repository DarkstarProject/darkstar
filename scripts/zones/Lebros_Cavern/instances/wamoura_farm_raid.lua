-----------------------------------
-- 
-- Assault: Wamoura Farm Raid
-- 
-----------------------------------

package.loaded["scripts/zones/Lebros_Cavern/TextIDs"] = nil;
require("scripts/zones/Lebros_Cavern/TextIDs");

function afterInstanceRegister(player)
    local instance = player:getInstance();
    player:messageSpecial(ASSAULT_27_START, 27);
    player:messageSpecial(TIME_TO_COMPLETE, instance:getTimeLimit());
end;	