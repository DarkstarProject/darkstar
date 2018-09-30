-----------------------------------
-- Area: Palborough Mines
--  NPC: ???
-- Involved In Quest: The Talekeeper's Truth
-- !pos 15 -31 -94 143
-----------------------------------
local ID = require("scripts/zones/Palborough_Mines/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getVar("theTalekeeperTruthCS") == 3 and not GetMobByID(ID.mob.NI_GHU_NESTFENDER):isSpawned()) then
        player:messageSpecial(ID.text.SENSE_OF_FOREBODING);
        SpawnMob(ID.mob.NI_GHU_NESTFENDER):updateClaim(player);
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
