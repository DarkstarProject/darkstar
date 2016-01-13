-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Palguevion
-- Only sells when San d'Oria controlls Valdeaunia Region
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/globals/conquest");
local text = require("scripts/zones/Northern_San_dOria/TextIDs");

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
            player:messageSpecial(text.FLYER_REFUSED);
        end
    end
end;


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

RegionOwner = GetRegionOwner(VALDEAUNIA);

if (RegionOwner ~= SANDORIA) then 
    player:showText(npc, text.PALGUEVION_CLOSED_DIALOG);
else
    player:showText(npc, text.PALGUEVION_OPEN_DIALOG);
    
    local stock =
    {
    0x111e,29,        -- Frost Turnip
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
