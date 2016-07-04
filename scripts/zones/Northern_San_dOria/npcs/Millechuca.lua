-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Millechuca
-- Regional Marchant NPC 
-- Only sells when San d'Oria controls Vollbow.
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/globals/conquest");
require("scripts/zones/Northern_San_dOria/TextIDs");

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
            player:messageSpecial(FLYER_REFUSED);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    RegionOwner = GetRegionOwner(VOLLBOW);

    if (RegionOwner ~= SANDORIA) then 
        player:showText(npc,MILLECHUCA_CLOSED_DIALOG);
    else
        player:showText(npc,MILLECHUCA_OPEN_DIALOG);

        stock = {0x27c,119,  -- Chamomile
                 0x360,88,   -- Fish Scales
                 0x3a8,14,   -- Rock Salt
                 0x582,1656} -- Sweet William
        
        showShop(player,SANDORIA,stock);    
    end
    
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;



