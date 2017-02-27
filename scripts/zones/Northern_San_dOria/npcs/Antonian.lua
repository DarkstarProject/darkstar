-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Antonian
-- Regional Marchant NPC
-- Only sells when San d'Oria controlls Aragoneu.
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
require("scripts/globals/events/harvest_festivals");
require("scripts/globals/settings");
require("scripts/globals/conquest");
require("scripts/globals/quests");
require("scripts/globals/shop");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == 1) then
        if (trade:hasItemQty(532,1) == true and trade:getItemCount() == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    else
        onHalloweenTrade(player,trade,npc);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

RegionOwner = GetRegionOwner(ARAGONEU);

        if (RegionOwner ~= NATION_SANDORIA) then
                player:showText(npc,ANTONIAN_CLOSED_DIALOG);
        else
                player:showText(npc,ANTONIAN_OPEN_DIALOG);

                local stock = {0x0277,36,  --Horo Flour
                                 0x0275,43,  --Millioncorn
                                 0x113f,111, --Roasted Corn
                                 0x0349,36,  --Yagudo Feather
                                 0x1199,90}  --Sunflower Seeds
                                 
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
