-----------------------------------
-- Area: Lufaise Meadows
--  NPC: ??? - Kurrea spawn
-- @pos -249.320 -16.189 41.497 24
-----------------------------------

local text = require("scripts/zones/Lufaise_Meadows/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:hasItemQty(5210,1) and trade:getItemCount() == 1) then -- Adamantoise Soup 
        player:tradeComplete();
        SpawnMob(16875778,120):updateClaim(player); -- Kurrea
        npc:setStatus(STATUS_DISAPPEAR);
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(text.NOTHING_OUT_OF_THE_ORDINARY);
end;