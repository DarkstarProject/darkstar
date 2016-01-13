-----------------------------------
-- Area: Palborough Mines
--  NPC: ???
-- Involved In Quest: The Talekeeper's Truth
-- @zone 143
-- @pos 15 -31 -94
-----------------------------------

require("scripts/globals/settings");
local text = require("scripts/zones/Palborough_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getVar("theTalekeeperTruthCS") == 3) then
        player:messageSpecial(text.SENSE_OF_FOREBODING);
        SpawnMob(17363318,180):updateClaim(player);
    else
        player:messageSpecial(text.NOTHING_OUT_OF_ORDINARY);
    end
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