-----------------------------------
-- Area: Southern San d'Oria
-- NPC: Apairemant
-- Only sells when San d'Oria controls Gustaberg Region
-- @zone 230
-- @pos 72 2 0
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");

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
    local RegionOwner = GetRegionOwner(GUSTABERG);

    if (RegionOwner ~= SANDORIA) then
            player:showText(npc,APAIREMANT_CLOSED_DIALOG);
    else
            player:showText(npc,APAIREMANT_OPEN_DIALOG);
           
            local stock = {0x0454,703,    -- Sulfur
                             0x026b,43,             -- Popoto
                             0x0263,36,             -- Rye Flour
                             0x1124,40}             -- Eggplant
                             
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
