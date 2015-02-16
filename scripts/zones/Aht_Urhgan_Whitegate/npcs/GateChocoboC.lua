-----------------------------------
-- 	Gate: Chocobo Circuit
-- 	Basic Chat Text
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");

function onTrigger(player,npc)
	player:startEvent(0x0084);
end;


-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end;


-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;
