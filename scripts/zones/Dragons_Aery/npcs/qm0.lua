-----------------------------------
-- Area: Dragons Aery
--  NPC: qm0 (???)
-- Spawns Fafnir or Nidhogg
-- !pos -81 32 2 178
-----------------------------------
package.loaded["scripts/zones/Dragons_Aery/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Dragons_Aery/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------

function onSpawn(npc)
    if (LandKingSystem_NQ < 1 and LandKingSystem_HQ < 1) then
        npc:setStatus(dsp.status.DISAPPEAR);
    end
end;

function onTrade(player,npc,trade)
    local Fafnir = GetMobAction(17408018);
    local Nidhogg = GetMobAction(17408019);

    if ((Nidhogg == dsp.act.NONE or Nidhogg == dsp.act.SPAWN)
    and (Fafnir == dsp.act.NONE or Fafnir == dsp.act.SPAWN)) then
        -- Trade Cup of Honey Wine
        if (trade:hasItemQty(3339,1) and trade:getItemCount() == 1) then
            if (LandKingSystem_NQ ~= 0) then
                player:tradeComplete();
                SpawnMob(17408018):updateClaim(player);
                npc:setStatus(dsp.status.DISAPPEAR);
            end
        -- Trade Cup of Sweet Tea
        elseif (trade:hasItemQty(3340,1) and trade:getItemCount() == 1) then
            if (LandKingSystem_HQ ~= 0) then
                player:tradeComplete();
                SpawnMob(17408019):updateClaim(player);
                npc:setStatus(dsp.status.DISAPPEAR);
            end
        end
    end

end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
