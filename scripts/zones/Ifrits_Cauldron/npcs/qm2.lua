-----------------------------------
-- Area: Ifrit's Cauldron
-- NPC:  qm2 (???)
-- Notes: Used to spawn Bomb Queen
-- !pos 18 20 -104 205
-----------------------------------

local ID = require("scripts/zones/Ifrits_Cauldron/IDs");

function onTrade(player,npc,trade)
    -- Trade 3 pinches of Bomb Queen Ash and a Bomb Queen Core and a verification if the nm is already spawned
    if (not GetMobByID(ID.mob.BOMB_QUEEN):isSpawned() and trade:hasItemQty(1187,3) and trade:hasItemQty(1186,1) and trade:getItemCount() == 4) then
        player:tradeComplete();
        SpawnMob(ID.mob.BOMB_QUEEN):updateClaim(player); -- Spawn Bomb Queen
        npc:setStatus(dsp.status.DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
