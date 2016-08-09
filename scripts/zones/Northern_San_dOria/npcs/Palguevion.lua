-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Palguevion
-- Only sells when San d'Oria controlls Valdeaunia Region
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/globals/conquest");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
end;
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local RegionOwner = GetRegionOwner(VALDEAUNIA);

if (RegionOwner ~= SANDORIA) then 
    player:showText(npc,PALGUEVION_CLOSED_DIALOG);
else
    player:showText(npc,PALGUEVION_OPEN_DIALOG);
    
    local stock = {0x111e,29,        -- Frost Turnip
         0x027e,170}        -- Sage
              
showShop(player,SANDORIA,stock);
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
