-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
 
function onTrigger(player,npc)
   player:startEvent(0x01f,player:getFame(0))
end;
 
 

