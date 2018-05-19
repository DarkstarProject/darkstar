-----------------------------------
-- Area: Appolyon
-- NPC:  Sentinel_Column
-- !pos
-----------------------------------
require("scripts/globals/limbus");
function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

   player:startEvent(221,127);


end;

function onEventUpdate(player,csid,option)
   --printf("RESULT: %u",option);
 player:updateEvent(0,player:getSpecialBattlefieldLeftTime(2),player:getSpecialBattlefieldLeftTime(1),player:getSpecialBattlefieldLeftTime(4),player:getSpecialBattlefieldLeftTime(3),player:getSpecialBattlefieldLeftTime(6),player:getSpecialBattlefieldLeftTime(5));
end;

function onEventFinish(player,csid,option)
   if (csid == 0) then

   end
end;