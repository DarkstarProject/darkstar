-----------------------------------
-- Area: Den of Rancor
-- NPC:  Lantern (NE)
-- @pos -59 45 24 160
-----------------------------------
package.loaded["scripts/zones/Den_of_Rancor/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Den_of_Rancor/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local Lantern_ID = 17433047
    local LSW = GetNPCByID(Lantern_ID):getAnimation();
    local LNW = GetNPCByID(Lantern_ID+1):getAnimation();
    local LNE = GetNPCByID(Lantern_ID+2):getAnimation();
    local LSE = GetNPCByID(Lantern_ID+3):getAnimation(); 
    
    -- Trade Crimson Rancor Flame
    if (trade:hasItemQty(1139,1) and trade:getItemCount() == 1) then
        if (LNE == 8) then
            player:messageSpecial(LANTERN_OFFSET + 7); -- already lit
        elseif (LNE == 9) then
            npc:openDoor(LANTERNS_STAY_LIT);
            local ALL = LNW+LSW+LSE;
            player:tradeComplete();
            player:addItem(1138); -- Unlit Lantern
            if ALL == 27 then
                player:messageSpecial(LANTERN_OFFSET + 9);
            elseif ALL == 26 then
                player:messageSpecial(LANTERN_OFFSET + 10); 
            elseif ALL == 25 then
                player:messageSpecial(LANTERN_OFFSET + 11); 
            elseif ALL == 24 then
                player:messageSpecial(LANTERN_OFFSET + 12); 
                GetNPCByID(Lantern_ID+3):closeDoor(1);
                GetNPCByID(Lantern_ID+2):closeDoor(1);
                GetNPCByID(Lantern_ID+1):closeDoor(1);
                GetNPCByID(Lantern_ID):closeDoor(1);
                
                GetNPCByID(Lantern_ID+4):openDoor(30);
                GetNPCByID(Lantern_ID+3):openDoor(30);
                GetNPCByID(Lantern_ID+2):openDoor(30);
                GetNPCByID(Lantern_ID+1):openDoor(30);
                GetNPCByID(Lantern_ID):openDoor(30);
            end
        end
    end
end;


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local npca = npc:getAnimation()
    if (npca == 8) then
        player:messageSpecial(LANTERN_OFFSET + 7); -- already lit
    else
        player:messageSpecial(LANTERN_OFFSET + 20); -- unlit
    end
return 0;
end;

