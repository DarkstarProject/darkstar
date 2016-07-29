-----------------------------------
-- Area: Dragons Aery
--  NPC: qm0 (???)
-- Spawns Fafnir or Nidhogg
-- @pos -81 32 2 178
-----------------------------------
package.loaded["scripts/zones/Dragons_Aery/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Dragons_Aery/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local Fafnir = GetMobAction(17408018);
    local Nidhogg = GetMobAction(17408019);

    if ((Nidhogg == ACTION_NONE or Nidhogg == ACTION_SPAWN)
    and (Fafnir == ACTION_NONE or Fafnir == ACTION_SPAWN)) then
        -- Trade Cup of Honey Wine
        if (trade:hasItemQty(3339,1) and trade:getItemCount() == 1) then
            if (LandKingSystem_NQ ~= 0) then
                player:tradeComplete();
                SpawnMob(17408018):updateClaim(player);
            end
        -- Trade Cup of Sweet Tea
        elseif (trade:hasItemQty(3340,1) and trade:getItemCount() == 1) then
            if (LandKingSystem_HQ ~= 0) then
                player:tradeComplete();
                SpawnMob(17408019):updateClaim(player);
            end
        end
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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