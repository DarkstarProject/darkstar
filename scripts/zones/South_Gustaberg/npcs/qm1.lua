-----------------------------------
-- Area: South Gustaberg
-- NPC:  qm1 (???)
-- Involved in Quest: The Cold Light of Day
-- !pos  744 0 -671 107
-----------------------------------
local ID = require("scripts/zones/South_Gustaberg/IDs");

function onTrade(player,npc,trade)
    if (
        (trade:hasItemQty(4514,1) or trade:hasItemQty(5793,1)) and
        trade:getItemCount() == 1 and trade:getGil() == 0 and
        not GetMobByID(ID.mob.BUBBLY_BERNIE):isSpawned()
    ) then
        player:tradeComplete();
        SpawnMob(ID.mob.BUBBLY_BERNIE);
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.MONSTER_TRACKS);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
