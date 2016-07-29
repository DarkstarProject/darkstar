-----------------------------------
-- Area: Ru'Aun Gardens
-- NPC:  Pincerstone
-- NPCs which activates the blue teleports in sky
-----------------------------------
package.loaded["scripts/zones/RuAun_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/RuAun_Gardens/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local npcid = npc:getID();

    if (npcid == 17310039) then  -- Genbu to Byakko
        local portal = GetNPCByID(17310060);
        if (portal:getAnimation() == 8) then
            player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
        else
            GetNPCByID(17310039):openDoor(120);
            portal:openDoor(120);
        end
    elseif (npcid == 17310041) then -- Byakko to Genbu
        local portal = GetNPCByID(17310061);
        if (portal:getAnimation() == 8) then
            player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
        else
            GetNPCByID(17310041):openDoor(120);
            portal:openDoor(120);
        end
    elseif (npcid == 17310043) then -- Byakko to Suzaku
        local portal = GetNPCByID(17310063);
        if (portal:getAnimation() == 8) then
            player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
        else
            GetNPCByID(17310043):openDoor(120);
            portal:openDoor(120);
        end
    elseif (npcid == 17310045) then -- Suzaku to Byakko
        local portal = GetNPCByID(17310064);
        if (portal:getAnimation() == 8) then
            player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
        else
            GetNPCByID(17310045):openDoor(120);
            portal:openDoor(120);
        end
    elseif (npcid == 17310047) then -- Suzaku to Main
        local portal = GetNPCByID(17310066);
        if (portal:getAnimation() == 8) then
            player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
        else
            GetNPCByID(17310047):openDoor(120);
            portal:openDoor(120);
        end
    elseif (npcid == 17310037) then -- Genbu to Seriyu
        local portal = GetNPCByID(17310058);
        if (portal:getAnimation() == 8) then
            player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
        else
            GetNPCByID(17310037):openDoor(120);
            portal:openDoor(120);
        end
    elseif (npcid == 17310035) then -- Seriyu To Genbu 
        local portal = GetNPCByID(17310057);
        if (portal:getAnimation() == 8) then
            player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
        else
            GetNPCByID(17310035):openDoor(120);
            portal:openDoor(120);
        end
    elseif (npcid == 17310049) then -- Main to Suzaku
        local portal = GetNPCByID(17310067);
        if (portal:getAnimation() == 8) then
            player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
        else
            GetNPCByID(17310049):openDoor(120);
            portal:openDoor(120);
        end
    elseif (npcid == 17310031) then -- Main to Seriyu
        local portal = GetNPCByID(17310054);  
        if (portal:getAnimation() == 8) then
            player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
        else
            GetNPCByID(17310031):openDoor(120);
            portal:openDoor(120);
        end
    elseif (npcid == 17310033) then -- Seriyu to Main
        local portal = GetNPCByID(17310055);
        if (portal:getAnimation() == 8) then
            player:messageSpecial(IT_IS_ALREADY_FUNCTIONING);
        else
            GetNPCByID(17310033):openDoor(120);
            portal:openDoor(120);
        end
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