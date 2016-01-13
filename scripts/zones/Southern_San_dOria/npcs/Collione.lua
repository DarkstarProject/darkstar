-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Collione
-- General Info NPC
-- @zone 230 
-- @pos 10 2 -66
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
local text = require("scripts/zones/Southern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)
-- "Flyers for Regine" conditional script
FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        count = trade:getItemCount();
        MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(text.FLYER_REFUSED);
        end
    end
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 
    player:startEvent(0x35b);
-- player:startEvent(0x0356)  --chocobo dig game
-- player:startEvent(0x0358)  -- play the chocobo game
-- player:startEvent(0x0359)  -- rules for choc game
-- player:startEvent(0x035a)  -- cant give more greens
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

